#!/usr/bin/ruby

def mult(a, b)
  if b == 0
    0
  elsif b == 1
    a
  elsif b.even?
    mult(double(a), halve(b))
  else
    a + mult( a, b - 1)
  end
end

def double(n)
  n + n
end

def halve(n)
  n / 2
end
