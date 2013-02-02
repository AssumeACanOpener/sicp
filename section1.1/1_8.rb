#!/usr/bin/ruby

def cubeRoot(x)
  guess = 1.0
  while (not goodEnough?(guess, x))
    guess = improve(guess, x)
  end
  guess
end

def cube(x)
  x * x * x
end

def goodEnough?(guess, x)
  (1 - cube(guess) / x).abs < 0.000001
end

def improve(guess, x)
  (x / (guess * guess) + 2 * guess) / 3
end

def average(x, y)
  (x + y) / 2
end
