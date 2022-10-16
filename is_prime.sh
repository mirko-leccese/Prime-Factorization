#!/bin/bash

# Defining function that factorizes n:
primeFactors() {
    n=$1
    list=()
    prime=()
    occur=()
    k=0

    # Looping until n is divisible by 2
    while [ $((n%2)) -eq 0 ]; do
        n=$( echo "$n/2" | bc )
        #list+=(2)
        ((k+=1))
    done
    if [ $k -gt 0 ]; then   
        # Add 2 to the prime factor list, together with its occurences:
        prime+=(2)
        occur+=($k)
    fi

    # Compute the square root of n (sq) and then loop from i=3 to sq:
    sq=$( echo "scale=0; sqrt($n)" | bc )
    for ((i=3;i<=$sq;i=i+2)) do
        k=0
        while [ $((n%i)) -eq 0 ]; do
            #list+=($i)
            n=$( echo "$n/$i" | bc )
            ((k+=1))
        done
        if [ $k -gt 0 ]; then   
            # Add the prime factor and its occurences:
            prime+=($i)
            occur+=($k)
        fi
    done
    if [ $n -gt 2 ]; then
        prime+=($n)
        occur+=(1)
    fi
    #echo "${list[@]}"
    #echo "${prime[@]}" 
    #echo "${occur[@]}"

    # Print the obtained factorization:
    for i in ${!prime[@]}; do
        #echo $i
        if [ ${occur[$i]} -ne 1 ]; then
            printf "(${prime[$i]}**${occur[$i]})"
        else
            printf "(${prime[$i]})"
        fi
    done
}

# Call the function on the prompted value:
primeFactors $1
