#!/usr/bin/ruby

def sumOfSquaresOfLargest(n1, n2, n3)
  if (n1 > n3 and n2 > n3)
    sumOfSquares(n1, n2)
  elsif (n1 > n2 and n3 > n2)
    sumOfSquares(n1, n3)
  else
    sumOfSquares(n2, n3)
  end
end

def sumOfSquares(n1, n2)
  square(n1) + square(n2)
end

def square(n)
  n * n
end
