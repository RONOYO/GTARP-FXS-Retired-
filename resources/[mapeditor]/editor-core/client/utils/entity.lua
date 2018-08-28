function ApplyEntityPosition(entity, posX, posY, posZ, relativeToWorld)
  if posX == 0.0 and posY == 0.0 and posZ == 0.0 then
    return
  end

  local offset = vector3(posX, posY, posZ)

  if relativeToWorld then
    local position = GetEntityCoords(entity) + offset
    SetEntityCoordsNoOffset(entity, position)
  else
    local position = GetOffsetFromEntityInWorldCoords(entity, offset)
    SetEntityCoordsNoOffset(entity, position)
  end
end

function ApplyEntityRotation(entity, rotX, rotY, rotZ, relativeToWorld)
  if rotX == 0.0 and rotY == 0.0 and rotZ == 0.0 then
    return
  end

  local qx, qy, qz, qw = GetEntityQuaternion(entity)
  local inQuat = quat(qw, qx, qy, qz)

  local vecX = vector3(1, 0, 0)
  local vecY = vector3(0, 1, 0)
  local vecZ = vector3(0, 0, 1)

  if relativeToWorld then
    inQuat = quat(rotX, vecX) * inQuat
    inQuat = quat(rotY, vecY) * inQuat
    inQuat = quat(rotZ, vecZ) * inQuat
  else
    inQuat = inQuat * quat(rotX, vecX)
    inQuat = inQuat * quat(rotY, vecY)
    inQuat = inQuat * quat(rotZ, vecZ)
  end

  -- Unfortunately, setting a quaternion seems to be broken in GTAV at certain
  -- angles. But fortunately (and perhaps, surprisingly), converting the
  -- quaternion to euler angles works fine.
  -- Problem with quaternions: https://streamable.com/ujpdg
  local rot = QuaternionToEuler(inQuat.w, inQuat.x, inQuat.y, inQuat.z)
  SetEntityRotation(entity, rot)
end
