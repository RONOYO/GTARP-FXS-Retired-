local _TestProbeAgainstWater = TestProbeAgainstWater
function TestProbeAgainstWater(p1, p2)
  return _TestProbeAgainstWater(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z)
end
