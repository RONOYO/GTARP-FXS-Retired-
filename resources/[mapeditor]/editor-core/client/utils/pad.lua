function GetDisabledControlNormalBetween(inputGroup, control1, control2)
  local normal1 = math.abs(GetDisabledControlNormal(inputGroup, control1))
  local normal2 = math.abs(GetDisabledControlNormal(inputGroup, control2))
  return normal1 - normal2
end
