# toddy-cooldown

A simple Lua library for managing cooldowns in **FiveM** servers. Ideal for scenarios where you need to restrict command usage or limit repeated player actions.

## Features
- Easy-to-use functions for registering, checking, and deleting cooldowns.
- Lightweight and efficient for use in **FiveM** servers.
---

## Example Usage
```lua
RegisterCommand('cooldown', function()
  local toddy_cooldown = exports['toddy-cooldown']

  -- Check if a cooldown is active for the player
  local active, expiration = toddy_cooldown:check('player')
  if active then
    return print(("Cooldown time remaining: %d seconds"):format(expiration))
  end

  -- Register a new cooldown for 10 seconds
  toddy_cooldown:register('player', 10)

  -- Your code here
end, false)
```

---
## Available Functions
`:register(name, duration)`
Registers a new cooldown for the given `name`.
```lua
local toddy_cooldown = exports['toddy-cooldown']
local success, message = toddy_cooldown:register('player', 10)
if not success then
  return print(message)
end
```
- **Parameters:**
  - `name` (string): Unique identifier for the cooldown (e.g., player ID).
  - `duration` (number): Duration of the cooldown in seconds.
- **Returns:**
  - `success` (boolean): `true` if the cooldown was successfully registered, `false` otherwise.
  - `message` (string): Additional information about the result.`

---

`:check(name)`
Checks if a cooldown is active for the given `name`.
```lua
local toddy_cooldown = exports['toddy-cooldown']
local active, expiration = toddy_cooldown:check('player')
if active then
  print(("Cooldown time remaining: %d seconds"):format(expiration))
end
```
- **Parameters:**
  - `name` (string): The identifier to check for an active cooldown.
- **Returns:**
  - `active` (boolean): `true` if a cooldown is active, `false` otherwise.
  - `expiration` (number): Remaining time in seconds (if active).

---

`:deleteCooldown(name)`
Deletes an existing cooldown.
```lua
local toddy_cooldown = exports['toddy-cooldown']
local success, message = toddy_cooldown:deleteCooldown('player')
if not success then
  return print(message)
end
```
- **Parameters:**
  - `name` (string): The identifier of the cooldown to delete.
- **Returns:**
  - `success` (boolean): `true` if the cooldown was successfully deleted, `false` otherwise.
  - `message` (string): Additional information about the result.