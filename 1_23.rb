#!/usr/bin/ruby

def searchForPrimes(first, last)
  while first <= last
    timedPrimeTest first
    first = first + 1
  end
end

def timedPrimeTest(n)
  start = Time.now
  isPrime = prime? n
  if isPrime
    print "#{n} is prime.  Time elapsed: #{Time.now - start} seconds.\n"
  end
end

def prime?(n)
  if n < 4
    true
  else
    n == smallestDivisor(n)
  end
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
    findDivisor(n, nextTestDivisor(testDivisor))
  end
end

def divides?(a, b)
  b % a == 0
end

def square(n)
  n * n
end

def nextTestDivisor(n)
  if n < 3
    n + 1
  else
    n + 2
  end
end
