dopath("app")
dopath("xinerama_switcher")
dopath("move_current")
dopath("mod_notionflux")
dopath("net_client_list")
--dopath("min_tabs")

function toggle_tab_bar(frame)
    local mode = frame:mode()
    if mode == "tiled" then
        frame:set_mode('tiled-alt')
    else
        frame:set_mode('tiled')
    end
end

CTRL="Control+"
META="Mod1+"

ioncore.set {
  dblclick_delay=250,
  kbresize_delay=3600000,
}

defbindings("WMPlex.toplevel", {
    kpress("F2", "ioncore.exec_on(_, 'xterm')"),
    kpress("F6", "ioncore.create_ws(_)"),
    kpress("F12", "mod_query.query_menu(_, _sub, 'mainmenu', 'Main menu:')"),
    submap(CTRL.."K", {
       kpress("R", "ioncore.restart()"),
       kpress("T", "toggle_tab_bar(_)"),
       kpress("plus", "WMPlex.inc_index(_)"),
       kpress("minus", "WMPlex.dec_index(_)"),
    })
})

defbindings("WClientWin", {
    submap(CTRL.."K", {
       kpress("Q", "WClientWin.kill(_)"),
       kpress("semicolon", "WClientWin.quote_next(_)"),
    })
})

defbindings("WGroup", {
    submap(CTRL.."K", {
        kpress_wait("space", "WGroup.set_fullscreen(_, 'toggle')"),
    }),
})

defbindings("WFrame", {
    submap(CTRL.."K", {
        kpress("K", "ioncore.goto_next(_, 'up')"),
        kpress("L", "xinerama_switcher(_, 'right')"),
        kpress("H", "xinerama_switcher(_, 'left')"),
        kpress("J", "ioncore.goto_next(_, 'down')"),
        kpress("N", "WFrame.switch_prev(_)"),
        kpress("M", "WFrame.switch_next(_)"),
        kpress("U", "WFrame.set_mode(_, 'floating')"),
        kpress("Y", "WFrame.set_mode(_, 'tiled')"),
        kpress("0", "WFrame.begin_kbresize(_)"),
    }),
    mdrag(META.."Button1", "WFrame.p_tabdrag(_)"),
})

defbindings("WTiling", {
    submap(CTRL.."K", {
        kpress("V", "WTiling.split_at(_, _sub, 'right', true)"),
        kpress("S", "WTiling.split_at(_, _sub, 'bottom', true)"),
        kpress("X", "WTiling.unsplit_at(_, _sub)"),
        kpress("Up", "move_current.move(_, 'up')"),
        kpress("Down", "move_current.move(_, 'down')"),
        kpress("Left", "move_current.move(_, 'left')"),
        kpress("Right", "move_current.move(_, 'right')"),
    })
})

defbindings("WMoveresMode", {
    bdoc("Cancel the resize mode."),
    kpress("AnyModifier+Escape","WMoveresMode.cancel(_)"),

    bdoc("End the resize mode."),
    kpress("AnyModifier+Return","WMoveresMode.finish(_)"),

    bdoc("Grow in specified direction."),
    kpress("H", "WMoveresMode.resize(_, 1, 0, 0, 0)"),
    kpress("L", "WMoveresMode.resize(_, 0, 1, 0, 0)"),
    kpress("K", "WMoveresMode.resize(_, 0, 0, 1, 0)"),
    kpress("J", "WMoveresMode.resize(_, 0, 0, 0, 1)"),
    
    bdoc("Shrink in specified direction."),
    kpress("Shift+H", "WMoveresMode.resize(_,-1, 0, 0, 0)"),
    kpress("Shift+L", "WMoveresMode.resize(_, 0,-1, 0, 0)"),
    kpress("Shift+K", "WMoveresMode.resize(_, 0, 0,-1, 0)"),
    kpress("Shift+J", "WMoveresMode.resize(_, 0, 0, 0,-1)"),
})
    

defwinprop {
    class = "Pinentry",
    float = true,
}

defwinprop {
    class = "Firefox",
    role = "Manager",
    instance = "Download",
    float = true,
}

defwinprop {
    class = "Firefox",
    instance = "Navigator",
    target = "Firefox",
}

defwinprop {
    class = "Vmplayer",
    instance = "vmplayer",
    target = "Firefox",
}

defwinprop {
    class = "Gvim",
    instance = "gvim",
    target = "Terminals1-Left",
    jumpto = true,
    switchto = true,
}

defwinprop {
    class = "Gnome-terminal",
    instance = "gnome-terminal",
    role = "Terminals2-Left",
    target = "Terminals2-Left",
}

defwinprop {
    class = "Gnome-terminal",
    instance = "gnome-terminal",
    role = "Terminals2-UpperRight",
    target = "Terminals2-UpperRight",
}

defwinprop {
    class = "Gnome-terminal",
    instance = "gnome-terminal",
    role = "Terminals2-LowerRight",
    target = "Terminals2-LowerRight",
}

defwinprop {
    class = "Gnome-terminal",
    instance = "gnome-terminal",
    role = "Terminals1-Left",
    target = "Terminals1-Left",
}

defwinprop {
    class = "Gnome-terminal",
    instance = "gnome-terminal",
    role = "Terminals1-UpperRight",
    target = "Terminals1-UpperRight",
}

defwinprop {
    class = "Gnome-terminal",
    instance = "gnome-terminal",
    role = "Terminals1-LowerRight",
    target = "Terminals1-LowerRight",
}

defwinprop {
    class = "Google-chrome",
    role = "pop-up",
    instance = "google-chrome",
    float = true,
}

defwinprop {
    name = "Desktop Alert - [WinXPSP2]",
    class = "Microsoft Office Outlook",
    instance = "Microsoft Office Outlook.VMwareUnityWindow",
    float = true,
}

defwinprop {
    name = "Kupfer",
    class = "Kupfer.py",
    instance = "kupfer.py",
    float = true,
}

defwinprop {
    name = "T2L",
    target = "Terminals2-Left",
}

defwinprop {
    name = "T2UR",
    target = "Terminals2-UpperRight",
}

defwinprop {
    name = "T2LR",
    target = "Terminals2-LowerRight",
}

defwinprop {
    name = "T1L",
    target = "Terminals1-Left",
}

defwinprop {
    name = "T1LR",
    target = "Terminals1-LowerRight",
}

defwinprop {
    name = "T1UR",
    target = "Terminals1-UpperRight",
}

defwinprop {
    class = "SDL_App",
    instance = "SDL_App",
}

defwinprop {
    class = "stalonetray",
    instance = "stalonetray",
    target = "*dock*"
}

defwinprop {
    instance = "stalonetray",
    target = "*dock*"
}

defwinprop {
    class = "stalonetray",
    target = "*dock*",
}

defwinprop {
    is_dockapp = true,
    target = "*dock*"
}

