# Problem 1: Prime Factorization

# Write a method that returns an array of prime factors given a positive integer.

# Assume num > 1

# checks if number is prime by seeing if any % == 0
def is_prime(num)
    # every number greater than root is checked with lower numbers
    root = Math.sqrt(num)
    i = 2
    while i <= root
        if(num % i == 0)
            return false
        end
        i += 1
    end
    return true
end

def prime_factorization(num)
    # create empty array for numbers
    primes = []
    # start with 2, 1 would create infinite recursion
    i = 2

    while i < num
        if num % i == 0
            if is_prime(i)
                primes.push(i)
            else
                # recursion factors numbers until only primes remain, joins those to existing array
                primes.concat(prime_factorization(i))
            end

            if is_prime(num / i)
                primes.push(num / i)
            else
                primes.concat(prime_factorization(num / i))
                # why cant i put the return statement here?
            end  
            # if we're here we found prime factors time to leave
            return primes        
        end
        i += 1
    end
end

# Example

print prime_factorization(12) #=> [2, 2, 3]

print prime_factorization(50) #=> [2, 5, 5]

print prime_factorization(100) 
