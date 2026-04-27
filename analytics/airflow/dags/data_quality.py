from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.bash import BashOperator
with DAG("helixcare_data_quality", start_date=datetime(2026, 1, 1), schedule_interval="@hourly", catchup=False) as dag:
    BashOperator(task_id="ge_validate", bash_command="great_expectations checkpoint run helixcare_checkpoint")
