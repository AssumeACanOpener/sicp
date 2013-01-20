#!/usr/bin/ruby

def searchForPrimes(first, last)
  while first <= last
    if first.even?
      first = first + 1
    else
      timedPrimeTest first
      first = first + 1
    end
  end
end

#(define (search-for-primes start end)
#  (define (search-iter current end)
#    (cond ((> current end) (newline) (display "done"))
#          ((even? current) (search-iter (+ current 1) end))
#          (else (timed-prime-test current)
#                (search-iter (+ current 2) end))))
#  (search-iter start end))

def timedPrimeTest(n)
  start = Time.now
  isPrime = prime? n
  if isPrime
    print "#{n} is prime.  Time elapsed: #{Time.now - start} seconds.\n"
  #else
  #  print "#{n} is not prime.  Time elapsed: #{Time.now - start} seconds.\n"
  end
end

def prime?(n)
  n == smallestDivisor(n)
end

def smallestDivisor(n)
  findDivisor(n, 2)
end

def findDivisor(n, testDivisor)
  if square(testDivisor) > n
    n
  elsif divides?(testDivisor, n)
    testDivisor
  else
    findDivisor(n, testDivisor + 1)
  end
end

def divides?(a, b)
  b % a == 0
end

def square(n)
  n * n
end
