#!/bin/bash

# function to log the action                                                                                                                                                                                                     
do-action() {                                                                                                                                                                                                                    
    echo -e "\n$1"                                                                                                                                                                                                               
    $1                                                                                                                                                                                                                           
}
