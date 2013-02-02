#!/usr/bin/ruby

def pascal(row, col)
  if  row < 1 or col < 1 or col > row
    0
  elsif col == 1 or col == row
    1
  else
    pascal(row - 1, col -1) + pascal(row - 1, col)
  end
end
