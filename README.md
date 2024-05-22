# ETL Toll Data Pipeline

ETL Toll Data Pipeline
This project is an ETL (Extract, Transform, Load) pipeline for toll data using Apache Airflow. The pipeline is defined in Python, utilizing Airflow's DAG (Directed Acyclic Graph) capabilities to schedule and execute tasks. The ETL process extracts data from multiple sources, transforms it, and loads the processed data into a staging directory.

Project Structure    
dags/ETL_toll_data.py: The main Airflow DAG definition file.
dags/Extract_Transform_data.sh: The Bash script that performs the extraction, transformation, and loading of data.
/path/to/staging/directory/: The directory where the transformed data is saved.

Prerequisites
Apache Airflow installed and configured.
Necessary permissions to read from and write to the specified directories.

Installation and Setup
Install Apache Airflow:
Follow the official Airflow installation guide to set up Airflow in your environment.

Place the files:

Place the ETL_toll_data.py file in your Airflow DAGs directory (e.g., /home/project/airflow/dags).
Place the Extract_Transform_data.sh script in the same directory.
Ensure tolldata.tgz and the raw data files (vehicle-data.csv, tollplaza-data.tsv, payment-data.txt) are also located in the Airflow DAGs directory.
Configure the DAG:
The ETL_toll_data.py file contains the DAG configuration. The default_args dictionary and the dag object define the properties of the DAG, including scheduling, retry logic, and email notifications.
