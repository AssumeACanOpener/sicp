#!/usr/bin/ruby

#def integral(f, a, b, n)

#  def simpsonsRule(n)
#    (h() / 3) * sum(simpsonsTerm, 0, inc, n)
#  end

#  def simpsonsTerm(k)
#    if k == 0
#      f(a + k * h)
#    elsif k == n
#      f(a + k * h)
#    elsif k.odd?
#      4 * f(a + k * h)
#    elsif k.even?
#      2 * f(a + k * h)
#    else
#      assert "Error: the world has ended"
#  end

#  def h()
#    (b - a) / n
#  end
  
#  simpsonsRule(n)
#end

def sum(term, a, nextTerm, b)
  if a > b
    0
  else
    term(a) + sum(term, nextTerm(a), nextTerm, b)
  end
end

def cube(n)
  n * n * n
end

def inc(n)
  n + 1
end

def f1(x)
  2 * x
end

def identity(x)
  x
end
