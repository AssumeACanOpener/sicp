#!/usr/bin/ruby

def f(n)
  if (n < 3)
    n
  else
    f(n - 1) + 2 * f(n - 2) + 3 * f(n - 3)
  end
end

def f2(n)
  if (n < 3)
    n
  else
    iter(0, 1, 2, n)
  end
end

def iter(n1, n2, n3, count)
  if (count < 3)
    n3
  else
    iter(n2, n3, 3 * n1 + 2 * n2 + n3, count - 1)
  end
end
