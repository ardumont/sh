#!/usr/bin/env bash

find . -name "*.java" | etags --language=java -
