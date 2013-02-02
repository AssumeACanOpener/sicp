#!/usr/bin/ruby

def mySqrt(x)
  guess = 1.0
  while (not goodEnough?(guess, x))
    guess = improve(guess, x)
  end
  guess
end

def square(x)
  x * x
end

def goodEnough?(guess, x)
  (1 - square(guess) / x).abs < 0.000001
end

def improve(guess, x)
  average(guess, (x / guess))
end

def average(x, y)
  (x + y) / 2
end
