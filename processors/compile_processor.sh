#!/bin/bash

DIR_PATH='../data/annoymised_final/*'
EXCEPTION_FILE='../data/exceptions.txt'
LIBRARY_EXCEPTION_FILE='../data/library_exceptions.txt'
CHANGED_FILE='../data/changed_submissions.txt'

rm $EXCEPTION_FILE
rm $LIBRARY_EXCEPTION_FILE

for year in $DIR_PATH
do
  if [[ ! -d "$year" ]]; then
     continue
  fi

  for sub in $year/*
  do
    if [[ ! -d "$sub" ]]; then
      continue
    fi

    exception=$(javac $sub/*.java 2>&1)

    if [[ $exception == 'Note:'* ]]; then
      continue
    elif [[ $exception == *'Fox is not abstract and does not override abstract method'* ||
          $exception == *'constructor Animal in class Animal cannot be applied to given types'* ||
          $exception == *'Fox cannot override'*'attempting to assign weaker access privileges;'* ||
          $exception == *'Fox.java'*'cannot be applied to given types;'* ]]; then
      rm $sub/Fox.java $sub/Rabbit.java
      echo $sub >> $CHANGED_FILE
    elif [[ $exception == *'does not exist'* ]]; then
        echo $sub >> $LIBRARY_EXCEPTION_FILE
    elif [[ ! $exception == '' ]]; then
      echo $exception >> $EXCEPTION_FILE
    fi
  done
done
