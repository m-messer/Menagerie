#!/bin/bash

DIR_PATH='../data/anonymised_assignments/*'

for batch in $DIR_PATH
do
  if [[ ! -d "$batch" ]]; then
     continue
  fi

  for sub in $batch/*
  do
    if [[ ! -f "$sub" ]]; then
      rm $sub/*.class
    fi
  done
done