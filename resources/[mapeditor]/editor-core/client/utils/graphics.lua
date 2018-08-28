function DrawCrosshair(r, g, b, a)
  local resX, resY = GetActiveScreenResolution()
  local lineW, lineH = 4, 16

  local scaleXW = lineW / resX
  local scaleYW = lineH / resY
  local scaleXH = lineH / resX
  local scaleYH = lineW / resY

  DrawRect(0.5, 0.5 - scaleYW, scaleXW, scaleYW, 255, 255, 255, a)
  DrawRect(0.5, 0.5 + scaleYW, scaleXW, scaleYW, 255, 255, 255, a)

  DrawRect(0.5 - scaleXH, 0.5, scaleXH, scaleYH, 255, 255, 255, a)
  DrawRect(0.5 + scaleXH, 0.5, scaleXH, scaleYH, 255, 255, 255, a)

  DrawRect(0.5, 0.5, scaleXW, scaleYH, r, g, b, a)
end

--------------------------------------------------------------------------------

function DrawEntityAxis(entity, length)
  local center = GetEntityCoords(entity)

  local offX = vector3(length, 0, 0)
  local offY = vector3(0, length, 0)
  local offZ = vector3(0, 0, length)

  local posX = GetOffsetFromEntityInWorldCoords(entity, offX)
  local posY = GetOffsetFromEntityInWorldCoords(entity, offY)
  local posZ = GetOffsetFromEntityInWorldCoords(entity, offZ)

  DrawLine(center, posX, 255, 0, 0, 255)
  DrawLine(center, posY, 0, 255, 0, 255)
  DrawLine(center, posZ, 0, 0, 255, 255)
end

--------------------------------------------------------------------------------

function DrawEdgeMatrix(lines, r, g, b, a)
  for line in values(lines) do
    local x1, y1, z1 = table.unpack(line[1])
    local x2, y2, z2 = table.unpack(line[2])

    DrawLine(x1, y1, z1, x2, y2, z2, r, g, b, a)
  end
end

function DrawPolyMatrix(polies, r, g, b, a)
  for poly in values(polies) do
    local x1, y1, z1 = table.unpack(poly[1])
    local x2, y2, z2 = table.unpack(poly[2])
    local x3, y3, z3 = table.unpack(poly[3])

    DrawPoly(x1, y1, z1, x2, y2, z2, x3, y3, z3, r, g, b, a)
  end
end

function DrawBoundingBox(box, r, g, b, a)
  local polyMatrix = GetBoundingBoxPolyMatrix(box)
  local edgeMatrix = GetBoundingBoxEdgeMatrix(box)

  DrawPolyMatrix(polyMatrix,   r,   g,   b,   a)
  DrawEdgeMatrix(edgeMatrix, 255, 255, 255, 255)
end

function DrawVirtualBoundingBox(pos, r, g, b, a)
  local p1 = pos - 0.25
  local p2 = pos + 0.25

  local box = GetBoundingBox(p1, p2)
  return DrawBoundingBox(box, r, g, b, a)
end

function DrawEntityBoundingBox(entity, r, g, b, a)
  local box = GetEntityBoundingBox(entity)
  return DrawBoundingBox(box, r, g, b, a)
end

--------------------------------------------------------------------------------

function DrawDebugText(x, y, text)
  SetTextFont(0)
  SetTextProportional(0)
  SetTextScale(0.5, 0.5)
  SetTextColour(255, 255, 255, 255)
  SetTextDropShadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry('STRING')
  AddTextComponentString(text)
  DrawText(x, y)
end
