function LoadModel(model)
  local hash = GetHashKey(model)

  while not HasModelLoaded(hash) do
    Citizen.Wait(0)
    RequestModel(hash)
  end

  return hash
end
