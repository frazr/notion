-- 6.9 Hooks
-- http://notion.sourceforge.net/notionconf/node7.html

local function get_tiling_frame()
    local name=""
    local cur=ioncore.find_manager(ioncore.current(), "WFrame")
    if cur ~= nil then
        name = cur:name()
        ioncore.warn(name)
    end
end

local function hookhandler(reg, how)
    ioncore.defer(function() get_tiling_frame() end)
end

ioncore.get_hook("region_notify_hook"):add(hookhandler)
