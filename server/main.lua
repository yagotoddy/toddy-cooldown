local cooldownTimers = {}

local function registerCooldown(name,timer)
  if timer <= 0 then
    return false,'invalid_timer'
  end

  cooldownTimers[name] = os.time() + timer
  return true
end

local function checkCooldown(name)
  if cooldownTimers[name] and os.time() < cooldownTimers[name] then
    return true,cooldownTimers[name] - os.time()
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