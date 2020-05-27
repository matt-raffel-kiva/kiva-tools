#!/usr/bin/env bash
export BIOANALYZER_SERVICE=http://bioanalyzer:8089
TEMPLATE_DB_HOST=protocol-dev-01.cluster-cf0huotnzbdi.eu-west-2.rds.amazonaws.com
TEMPLATE_DB_NAME=identitytemplate
TEMPLATE_DB_USER=kiva_dev_identitytemplate
TEMPLATE_DB_PASSWORD=vJmGbXbtSwSTHXiELztCWFN3o04Z5RP0JOX
IDENTITY_DB_HOST=protocol-dev-01.cluster-cf0huotnzbdi.eu-west-2.rds.amazonaws.com
IDENTITY_DB_NAME=identity
IDENTITY_DB_USER=kiva_dev_identity
IDENTITY_DB_PASSWORD=Ur3YPPI1lRqXC0NcknnOgCgt5mevdCXi1Gp
PEPPER=ZHdw/k/vLsjq7vazlCvzfv0V6n6dI4mJpxEg5dnPgRU
DB_RECORDS=10
SERVERS=1
npm run perf:bio ${TEMPLATE_DB_HOST} ${TEMPLATE_DB_NAME} ${TEMPLATE_DB_USER} ${TEMPLATE_DB_PASSWORD} ${IDENTITY_DB_HOST} ${IDENTITY_DB_NAME} ${IDENTITY_DB_USER} ${IDENTITY_DB_PASSWORD} ${PEPPER} ${DB_RECORDS} ${SERVERS}
