#!/bin/bash

#######################################
#                                     #
# Autor: Luís Felipe da Cunha Duarte  #
#                                     #
#######################################

DATA_INICIAL=$1
DATA_FINAL=$2
DIRETORIO=$3
NOME_DIRETORIO=$(basename "${DIRETORIO}")
PWD_BASENAME=$(basename "${PWD}")

DATA_AGORA=$(date +"%Y%m%d")
DATA_2_DAYS_AGO=$(date --date="-2 day" +"%Y%m%d")

if [ ! -z "${DATA_INICIAL}" ] && [ ! -z "${DATA_FINAL}" ] && [ ! -z "${NOME_DIRETORIO}" ];
then
	FILENAME="AcessoRecente_${NOME_DIRETORIO}_${DATA_INICIAL}_${DATA_FINAL}.txt"
	find $DIRETORIO -type f -newermt $DATA_INICIAL ! -newermt $DATA_FINAL -ls &> $FILENAME

elif [ -z "${DATA_INICIAL}" ] && [ -z "${DATA_FINAL}" ] && [ -z "${NOME_DIRETORIO}" ];
then
	TEMP_FILENAME="AcessoRecente_$PWD_BASENAME_$DATA_2_DAYS_AGO_$DATA_FINAL.txt"
	find . -type f -newermt $DATA_2_DAYS_AGO ! -newermt $DATA_AGORA -ls &> $TEMP_FILENAME
else
	echo "Para utilizar este programa você deve fornecer 3 parâmetros: "
	echo "1 - Data inicial ex: ${DATA_2_DAYS_AGO}"
	echo "2 - Data final ex: ${DATA_AGORA}"
	echo "3 - Diretório inicial ex: $HOME"
fi
