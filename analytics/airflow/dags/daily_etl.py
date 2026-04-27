from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.bash import BashOperator
default_args = { "owner": "helixcare-data", "retries": 2, "retry_delay": timedelta(minutes=5) }
with DAG("helixcare_daily_etl", start_date=datetime(2026, 1, 1), schedule_interval="0 2 * * *", default_args=default_args, catchup=False) as dag:
    extract = BashOperator(task_id="extract", bash_command="python /opt/etl/extract.py --date {{ ds }}")
    transform = BashOperator(task_id="transform", bash_command="cd /opt/dbt && dbt run --target prod")
    test = BashOperator(task_id="test", bash_command="cd /opt/dbt && dbt test --target prod")
    publish = BashOperator(task_id="publish", bash_command="python /opt/etl/publish.py --date {{ ds }}")
    extract >> transform >> test >> publish
