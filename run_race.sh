#!/bin/bash                                                                   
# run the first process in the background                                      
sh race.sh &

# run the second process in the foreground                                     
sh race.sh
