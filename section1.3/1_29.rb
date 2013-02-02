#!/usr/bin/ruby

cube = lambda{|x| x * x * x}

inc = lambda{|x| x + 1}

f1 = lambda{|x|  2 * x}

identity = lambda{|x| x}

def sum(term, a, next_term, b)
  if a > b
    0
  else
    term.call(a) + sum(term, next_term.call(a), next_term, b)
  end
end

def integral(f, a, b, n, inc)

  h = lambda{(b - a) / n}

  simpsons_term = lambda{|k|
    if k == 0
      f.call(a + k * h.call())
    elsif k == n
      f.call(a + k * h.call())
    elsif k.odd?
      4 * f.call(a + k * h.call())
    elsif k.even?
      2 * f.call(a + k * h.call())
    else
      assert "Error: the world has ended"
    end
  }
  
  simpsons_rule = lambda{|n| (h.call() / 3) * sum(simpsons_term, 0, inc, n)}

  simpsons_rule.call(n)
end

puts integral(f1, -100.0, 100.0, 1000, inc)
