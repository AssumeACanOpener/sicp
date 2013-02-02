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
    n
  else
    fastPrime?(n, 100)
  end
end

def fastPrime?(n, times)
  if times == 0
    true
  elsif fermatTest(n)
    fastPrime?(n, times - 1)
  else
    false
  end
end

def fermatTest(n)
  tryIt(1 + rand(n - 1), n)
end

def tryIt(a, n)
  expmod(a, n, n) == a
end

def expmod(base, exp, m)
  if exp == 0
    1
  elsif exp.even?
    square(expmod(base, exp / 2, m)) % m
  else
    base * expmod(base, exp - 1, m) % m
  end
end

def square(n)
  n * n
end
