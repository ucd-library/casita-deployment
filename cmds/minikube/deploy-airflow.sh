#! /bin/bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $ROOT_DIR

LOCAL_BUILD=true source ../../config.sh

helm upgrade \
 --install airflow apache-airflow/airflow \
 --namespace airflow \
 --create-namespace \
 --set images.airflow.repository=${CASITA_AIRFLOW_WORKER_NAME} \
 --set images.airflow.tag=${APP_VERSION} \
 -f $ROOT_DIR/../../a6t-casita-local-dev/airflow-values.yaml