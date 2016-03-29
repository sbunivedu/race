#!/bin/bash                                                                       
#if file numbers doesn't exist                                                 
if test ! -f numbers
then
    #create the numbers file                                                   
    echo 0 > numbers
fi

count=0

#repeat 200 times using $count as the loop variable                            
while test $count != 200
do
    count=`expr $count + 1`

    #read the last number in the file                                          
    n=`tail -1 numbers`

    #add 1 to the number and append it to numbers                              
    echo `expr $n + 1` >> numbers
done
