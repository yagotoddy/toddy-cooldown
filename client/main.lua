local cooldownTimers = {}
local floor = math.floor

local function registerCooldown(name,timer)
  if timer <= 0 then
    return false,'invalid_timer'
  end

  cooldownTimers[name] = GetGameTimer() + (timer * 1000)
  return true
end

local function checkCooldown(name)
  if cooldownTimers[name] and GetGameTimer() < cooldownTimers[name] then
    return true,floor((cooldownTimers[name] - GetGameTimer()) / 1000)
  end

  return false,0
end

local function deleteCooldown(name)
  if not cooldownTimers[name] then
    return false,'cooldown_not_found'
  end

  cooldownTimers[name] = nil
  return true,'cooldown_deleted'
end

exports('register',registerCooldown)
exports('check',checkCooldown)
exports('delete',deleteCooldown)