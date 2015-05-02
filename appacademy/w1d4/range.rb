def range(first, last)
  if last <= first + 1
    []
  else
    [first + 1].concat(range(first + 1, last))
  end
end
