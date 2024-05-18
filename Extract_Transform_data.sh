#!/bin/bash

# Unzip the data
unzip /home/project/airflow/dags/tolldata.tgz -d /home/project/airflow/dags

# Extract data from csv file
awk -F ',' '{print $1, $2, $3, $4}' /home/project/airflow/dags/vehicle-data.csv > /home/project/airflow/dags/csv_data.csv

# Extract data from tsv file
awk -F '\t' '{print $1, $2, $3}' /home/project/airflow/dags/tollplaza-data.tsv > /home/project/airflow/dags/tsv_data.csv

# Extract data from fixed width file
awk '{printf "%s %s\n", substr($0,1,3), substr($0,4)}' /home/project/airflow/dags/payment-data.txt > /home/project/airflow/dags/fixed_width_data.csv
# Consolidate data
paste /home/project/airflow/dags/csv_data.csv /home/project/airflow/dags/tsv_data.csv /home/project/airflow/dags/fixed_width_data.csv > /home/project/airflow/dags/extracted_data.csv
# Transform data
awk '{print $1, $2, $3, toupper($4), $5, $6, $7, $8, $9}' /home/project/airflow/dags/extracted_data.csv > /path/to/staging/directory/transformed_data.csv
