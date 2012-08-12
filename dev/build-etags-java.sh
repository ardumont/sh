#!/bin/bash

find . -name "*.java" | etags --language=java -

