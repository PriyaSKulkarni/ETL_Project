from airflow import DAG
from datetime import datetime, timedelta

default_args = {
    'owner': 'dummy_owner',
    'start_date': datetime.today(),
    'email': 'dummy@example.com',
    'email_on_failure': True,
    'email_on_retry': True,
    'retries': 1,
    'retry_delay': timedelta(minutes=5)
}

dag = DAG(
    'ETL_toll_data',
    default_args=default_args,
    description='Apache Airflow Final Assignment',
    schedule_interval='@daily'
)
from airflow.operators.bash_operator import BashOperator

extract_transform_load_task = BashOperator(
    task_id='extract_transform_load',
    bash_command='/home/project/airflow/dags/Extract_Transform_data.sh',
    dag=dag
)
extract_transform_load_task
