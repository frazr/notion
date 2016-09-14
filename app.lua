app={}

function app.match_class(class, instance)
   -- Return matching client windows as a table.
   -- If the current window is among them, it's placed last on the list
   -- and its successor at the beginning of the list. This facilitates
   -- cycling multiple windows of an application.
   local result = {}
   local offset = 0
   local currwin = ioncore.current()
   ioncore.clientwin_i(function (win)
      if class == win:get_ident().class then
        if instance then
            if instance == win:get_ident().instance then
                table.insert(result, table.getn(result)-offset+1, win)
            end
        else
            table.insert(result, table.getn(result)-offset+1, win)
        end
      end
      if win == currwin then
	 -- Current client window found, continue filling the table from
	 -- the beginning.
	 offset = table.getn(result)
      end
      return true
   end)

   return result
end
