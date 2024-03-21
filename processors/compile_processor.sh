#!/bin/bash

DIR_PATH='../data/batches/*'
EXCEPTION_FILE='../data/exceptions.txt'
LIBRARY_EXCEPTION_FILE='../data/library_exceptions.txt'
CHANGED_FILE='../data/changed_submissions.txt'

rm $EXCEPTION_FILE
rm $LIBRARY_EXCEPTION_FILE

for batch in $DIR_PATH
do
  if [[ ! -d "$batch" ]]; then
     continue
  fi

  for sub in $batch/*
  do
    if [[ ! -d "$sub" ]]; then
      continue
    fi

    exception=$(javac $sub/*.java 2>&1)

    if [[ $exception == *'Fox is not abstract and does not override abstract method'* ]]; then
      rm $sub/Fox.java $sub/Rabbit.java
      echo $sub >> $CHANGED_FILE
    elif [[ $exception == *'does not exist'* ]]; then
        echo $sub >> $LIBRARY_EXCEPTION_FILE
    elif [[ ! $exception == '' ]]; then
      echo $sub >> $EXCEPTION_FILE
      echo $exception >> $EXCEPTION_FILE
    fi
  done
done
