#!/usr/bin/ruby

def fastExpt(b, n)
  iter(1, b, n)
end

def iter(a, b, n)
  if n == 0
    a
  elsif n.even?
    iter a, b * b, n / 2
  else
    iter a * b, b, n - 1
  end
end
