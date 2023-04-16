require "natives-1627063482"

function playerActionsSetup(pid)
  local ip = players.get_connect_ip(pid)
  local name = players.get_name(pid)
  local id = tostring(name)
  local get_ips= string.format("[%i.%i.%i.%i]", ip >> 24 & 255, ip >> 16 & 255, ip >> 8 & 255, ip & 255)

  if get_ips == "[255.255.255.255]" then
    local filename = filesystem.store_dir() .. "logg.txt"
    local file = io.open(filename, "a")
  
    file:write("Player " .. id .. " [error]\n")
    file:close()
    return
  end
  local filename = filesystem.store_dir() .. "logg.txt"
  local file = io.open(filename, "r")
  local lines = {}
  if file then
    for line in file:lines() do
      local parts = line:split("")
      if parts[3] then
        lines[parts[3]] = true
      end
    end
    file:close()
  end

  if not lines[get_ips] then
    local file = io.open(filename, "a") 

    file:write("Player " .. id .. " " ..get_ips .. "\n")
    file:close()
  end
end

players.dispatch_on_join()
players.on_join(playerActionsSetup)
