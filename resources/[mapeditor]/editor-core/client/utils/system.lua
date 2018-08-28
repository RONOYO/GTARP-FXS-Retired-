function values(xs)
  local i = 0
  return function()
    i = i + 1;
    return xs[i]
  end
end

function map(xs, fn)
  local t = {}
  for i,v in ipairs(xs) do
    local r = fn(v, i, xs)
    table.insert(t, r)
  end
  return t
end

function filter(xs, fn)
  local t = {}
  for i,v in ipairs(xs) do
    if fn(v, i, xs) then
      table.insert(t, v)
    end
  end
  return t
end
