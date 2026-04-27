from pyspark.sql import SparkSession
from pyspark.ml.feature import VectorAssembler
from pyspark.ml.clustering import KMeans
spark = SparkSession.builder.appName("helixcare-segment").getOrCreate()
df = spark.read.format("iceberg").load("helixcare_mart.user_features")
assembler = VectorAssembler(inputCols=["recency_days","frequency_30d","monetary_30d"], outputCol="features")
pipeline = KMeans(featuresCol="features", k=5, seed=42)
model = pipeline.fit(assembler.transform(df))
preds = model.transform(assembler.transform(df))
preds.select("user_id","prediction").writeTo("helixcare_mart.user_segments").using("iceberg").createOrReplace()
