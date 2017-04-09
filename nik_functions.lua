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