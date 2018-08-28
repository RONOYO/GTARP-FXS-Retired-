function GetBoundingBox(min, max, pad)
  local pad = pad or 0.001

  return {
    -- Bottom
    vector3(min.x - pad, min.y - pad, min.z - pad), -- back right
    vector3(max.x + pad, min.y - pad, min.z - pad), -- back left
    vector3(max.x + pad, max.y + pad, min.z - pad), -- front left
    vector3(min.x - pad, max.y + pad, min.z - pad), -- front right

    -- Top
    vector3(min.x - pad, min.y - pad, max.z + pad), -- back right
    vector3(max.x + pad, min.y - pad, max.z + pad), -- back left
    vector3(max.x + pad, max.y + pad, max.z + pad), -- front left
    vector3(min.x - pad, max.y + pad, max.z + pad), -- front right
  }
end

function GetBoundingBoxEdgeMatrix(box)
  return {
    -- Bottom
    { box[1], box[2] },
    { box[2], box[3] },
    { box[3], box[4] },
    { box[4], box[1] },

    -- Top
    { box[5], box[6] },
    { box[6], box[7] },
    { box[7], box[8] },
    { box[8], box[5] },

    -- Sides
    { box[1], box[5] },
    { box[2], box[6] },
    { box[3], box[7] },
    { box[4], box[8] },
  }
end

function GetBoundingBoxPolyMatrix(box)
  return {
    -- Bottom
    { box[3], box[2], box[1] },
    { box[4], box[3], box[1] },

    -- Top
    { box[5], box[6], box[7] },
    { box[5], box[7], box[8] },

    -- Front
    { box[3], box[4], box[7] },
    { box[8], box[7], box[4] },

    -- Back
    { box[1], box[2], box[5] },
    { box[6], box[5], box[2] },

    -- Left
    { box[2], box[3], box[6] },
    { box[3], box[7], box[6] },

    -- Right
    { box[5], box[8], box[4] },
    { box[5], box[4], box[1] },
  }
end

function GetModelBoundingBox(model)
  local min, max = GetModelDimensions(model)
  return GetBoundingBox(min, max)
end

function GetEntityBoundingBox(entity)
  local model = GetEntityModel(entity)
  local box = GetModelBoundingBox(model)

  return map(box, function (corner)
    return GetOffsetFromEntityInWorldCoords(entity, corner)
  end)
end

--------------------------------------------------------------------------------

function Clamp(x, min, max)
  return math.min(math.max(x, min), max)
end

function SnapAngle(angle, snap)
  return math.floor(angle / 360 * snap + 0.5) % snap * (360 / snap)
end

function EulerToQuaternion(rotX, rotY, rotZ)
  local radX = math.rad(rotX) * 0.5
  local radY = math.rad(rotY) * 0.5
  local radZ = math.rad(rotZ) * 0.5

  local cosX = math.cos(radX)
  local sinX = math.sin(radX)
  local cosY = math.cos(radY)
  local sinY = math.sin(radY)
  local cosZ = math.cos(radZ)
  local sinZ = math.sin(radZ)

  local w = cosZ * cosX * cosY + sinZ * sinX * sinY
  local x = cosZ * sinX * cosY - sinZ * cosX * sinY
  local y = cosZ * cosX * sinY + sinZ * sinX * cosY
  local z = sinZ * cosX * cosY - cosZ * sinX * sinY

  return quat(w, x, y, z);
end

function QuaternionToEuler(w, x, y, z)
  local sinX = 2.0 * (w * x + y * z)
  local cosX = 1.0 - 2.0 * (x * x + y * y)
  local rotX = math.deg(math.atan(sinX, cosX))

  local sinY = 2.0 * (w * y - z * x)
  local fixY = Clamp(sinY, -1.0, 1.0)
  local rotY = math.deg(math.asin(fixY))

  local sinZ = 2.0 * (w * z + x * y)
  local cosZ = 1.0 - 2.0 * (y * y + z * z)
  local rotZ = math.deg(math.atan(sinZ, cosZ))

  return vector3(rotX, rotY, rotZ)
end

--------------------------------------------------------------------------------

function GetVisibleEntities()
  local entities = {}
  local iterators = {
    EnumerateObjects,
    EnumeratePeds,
    EnumerateVehicles,
    EnumeratePickups
  }

  for Enumerate in values(iterators) do
    for entity in Enumerate() do
      table.insert(entities, entity)
    end
  end

  return entities
end

function IsEntityModelBlacklisted(entity)
  local model = GetEntityModel(entity)
  local blacklist = {
     -- https://i.gyazo.com/099abb816415bda4e1c6bf99c58ac3a2.jpg
    [GetHashKey('prop_sprink_park_01')] = true
  }

  return blacklist[model] or false
end

function CanEntityReturnModel(entity)
  return
    IsEntityAnObject(entity) or
    IsEntityAVehicle(entity) or
    IsEntityAPed(entity) or
    DoesEntityHaveDrawable(entity)
end

function IsEntityTargetable(entity)
  return
    CanEntityReturnModel(entity) and
    not IsEntityModelBlacklisted(entity)
end
