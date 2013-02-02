#!/usr/bin/ruby

def fib(n)
  fibIter(1, 0, 0, 1, n)
end

def fibIter(a, b, p, q, count)
  if count == 0
    b
  elsif count.even?
    fibIter(a, b, p*p + q*q, 2 * p * q + q * q, count / 2)
  else
    fibIter(b * q + a * q + a * p, b * p + a * q, p, q, count - 1)
  end
end
