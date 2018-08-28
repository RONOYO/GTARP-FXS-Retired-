function DoesLineIntersectAABB(p1, p2, min, max)
  if p1.x > min.x and p1.x < max.x and
     p1.y > min.y and p1.y < max.y and
     p1.z > min.z and p1.z < max.z then
    return false
  end

  for a in values({ 'x', 'y', 'z' }) do
    if (p1[a] < min[a] and p2[a] < min[a]) or
       (p1[a] > max[a] and p2[a] > max[a]) then
      return false
    end
  end

  for p in values({ min, max }) do
    for a, o in pairs({ x={'y','z'}, y={'x','z'}, z={'x','y'} }) do
      local h = p1 + (p1[a] - p[a]) / (p1[a] - p2[a]) * (p2 - p1)
      local o1, o2 = o[1], o[2]

      if h[o1] >= min[o1] and h[o1] <= max[o1] and
         h[o2] >= min[o2] and h[o2] <= max[o2] then
        return true
      end
    end
  end

  return false
end

function DoesLineIntersectEntityBoundingBox(p1, p2, entity)
  local model = GetEntityModel(entity)
  local min, max = GetModelDimensions(model)

  local l1 = GetOffsetFromEntityGivenWorldCoords(entity, p1)
  local l2 = GetOffsetFromEntityGivenWorldCoords(entity, p2)

  return DoesLineIntersectAABB(l1, l2, min, max)
end

--------------------------------------------------------------------------------

function RaytraceBoundingBox(p1, p2, ignoredEntity)
  local entities = GetVisibleEntities()
  local matches = filter(entities, function (entity)
    if entity == ignoredEntity then return false end
    if not IsEntityOnScreen(entity) then return false end
    if not IsEntityTargetable(entity) then return false end
    return DoesLineIntersectEntityBoundingBox(p1, p2, entity)
  end)

  table.sort(matches, function (a, b)
    local h1 = GetEntityCoords(a)
    local h2 = GetEntityCoords(b)
    return #(p1 - h1) < #(p1 - h2)
  end)

  if matches[1] then
    local pos = GetEntityCoords(matches[1])
    return pos, matches[1]
  end

  return nil, nil
end

function RaytraceShapeTest(p1, p2, ignoredEntity)
  local flags = 1 | 2 | 4 | 16 | 256
  local ray = StartShapeTestRay(p1, p2, flags, ignoredEntity, 7)
  local result, hit, pos, normal, entity = GetShapeTestResult(ray)

  if hit == 0 then
    return nil, nil
  end

  if not IsEntityTargetable(entity) then
    return pos, nil
  end

  return pos, entity
end

function Raytrace(p1, p2, ignoredEntity, checkBoundingBox, checkWater)
  if checkWater then
    local hit, pos = TestProbeAgainstWater(p1, p2)
    if hit then
      p2 = pos
    end
  end

  if checkBoundingBox then
    local pos1, entity1 = RaytraceShapeTest(p1, p2, ignoredEntity)
    local pos2, entity2 = RaytraceBoundingBox(p1, p2, ignoredEntity)

    if pos1 and not pos2 then return pos1, entity1 end
    if pos2 and not pos1 then return pos2, entity2 end
    if pos1 and pos2 then
      if #(p1 - pos1) < #(p1 - pos2) then
        return pos1, entity1
      else
        return pos2, entity2
      end
    end

    return p2, nil
  end

  local pos, entity = RaytraceShapeTest(p1, p2, ignoredEntity)
  return pos or p2, entity
end
