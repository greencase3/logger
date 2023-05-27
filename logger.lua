function playerActionsSetup(pid)
  local ip = players.get_connect_ip(pid)
  local name = players.get_name(pid)
  local os = os.date("%Y-%m-%d %H:%M:%S")
  local get_ips = string.format("[%i.%i.%i.%i]", ip >> 24 & 255, ip >> 16 & 255, ip >> 8 & 255, ip & 255)
  local vpn = players.is_using_vpn(pid)
  
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

if name == players.get_name(players.user()) then
    return
else if get_ips == "[255.255.255.255]" then
  local filename = filesystem.store_dir() .. "logg.txt"
  local file = io.open(filename, "a")

  file:write("[" ..os.."]".."Player " .. name .. " [error]\n")
  file:close()
  return

else if not lines[get_ips] then
    local file = io.open(filename, "a") 
    file:write("[" ..os.."]".."Player " .. name .. " " ..get_ips .."[VPN="..vpn.."]\n")
     file:close()
     end
    end
  end
end

players.dispatch_on_join()
players.on_join(playerActionsSetup)
