#!/usr/bin/ruby

def mult(a, b)
  iter(a, b, 0)
end

def iter(a, b, c)
  if b == 0
    c
  elsif b.even?
    iter(double(a), halve(b), c)
  else
    iter(a, b - 1, c + a)
  end
end

def double(n)
  n + n
end

def halve(n)
  n / 2
end
