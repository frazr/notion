-- Lua functions
function ssh(name)
  return "xterm -e ssh " .. name
end

function get_pods()
  return "xterm -e \"" .. KUBECTLBINARY .. " get pods;bash\""
end

function enter_pod(pod)
  local cmd=KUBECTLBINARY .. " get pods | grep -e \"" .. pod .. "\" | tail -n1 | awk '{print $1}'"
  local pod_identifier=os.customexec(cmd)
  return "xterm -e \"" .. KUBECTLBINARY .. " exec -it " .. pod_identifier .. " bash;bash\""
end

function os.customexec(cmd, raw)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    if raw then return s end
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
    return s
end

function xdo_command(type)
  local str=""
  if type == "dump" then str="U= P= H= DB= mysql-dump -u$U -p$P -h$H $DB > dump.sql"
  end
  if type == "h_con" then str="mysql -u helpa -p$MYSQL_PASSWORD -hdatabase helpa"
  end
  
  if type == "w_con" then str="mysql -u wondr -p$MYSQL_PASSWORD -hdatabase wondr"
  end
  if type == "o_con" then str="mysql -u nik -p -hdb.oashosting.net"
  end
  ioncore.exec("printf '" .. str .. "' | xsel -i && xdotool selectwindow click 2 && stty echo")
end