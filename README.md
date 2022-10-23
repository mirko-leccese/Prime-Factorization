# Prime-Factorization
## Description
This Bash script determines the prime factorization of a prompt number ( $n$ ). The implemented algorithm is the standard one:
- While $n$ is divisible by 2, keep dividing by 2;
- As the number becomes odd, start a loop from $i=3$ to the square root of $n$. While $i$ divides $n$, add the number to the list of prime factors, and divide $n$ by $i$. After it fails to divide n, increment $i$ by 2 and continue;
- If, at the end, $n$ is greater than 2 then it is a prime number and it is "added" to the factorization

We loop from $i=3$ to the square root of $n$ because of the following simple argument: let $x=\sqrt{n}$, therefore $x\cdot x= n$, which trivially means that it cannot exist a prime factor larger than the square root of $n$. 

## Usage
To run the script (e.g. to find the prime factorization of 120): 
```bash
chmod +x ./is_prime.sh
./is_prime.sh 120
```  
