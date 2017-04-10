dopath("app")
dopath("xinerama_switcher")
dopath("move_current")
dopath("mod_notionflux")
dopath("net_client_list")

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
META2="Mod4+"
KUBECTLBINARY="/home/nik/downloads/google-cloud-sdk/bin/kubectl"

-- Terminal emulator
if os and os.execute("test -x /usr/bin/urxvt") == 0 then
    XTERM="/usr/bin/urxvt"
else
    XTERM="/usr/bin/xterm"
end

ioncore.set {
  dblclick_delay=250,
  kbresize_delay=3600000,
}

-- Custom menus
defmenu("kubectl", {
  menuentry("get-pods", "ioncore.exec(get_pods())"),
  menuentry("web1", "ioncore.exec(enter_pod('web1'))"),
  menuentry("web2", "ioncore.exec(enter_pod('web2'))"),
  menuentry("web3", "ioncore.exec(enter_pod('web3'))"),
  menuentry("web4", "ioncore.exec(enter_pod('web4'))"),
  menuentry("web5", "ioncore.exec(enter_pod('web5'))"),
  menuentry("web6", "ioncore.exec(enter_pod('web6'))"),
  menuentry("web7", "ioncore.exec(enter_pod('web7'))"),
  menuentry("web8", "ioncore.exec(enter_pod('web8'))"),
  menuentry("web9", "ioncore.exec(enter_pod('web9'))"),
})

defmenu("session", {
  menuentry("Restart", "ioncore.restart()"),
  menuentry("Exit",  "ioncore.shutdown()"),
})

defmenu("ssh", {
  menuentry("nik", "ioncore.exec(ssh('nik'))"),
  menuentry("s03", "ioncore.exec(ssh('s03'))"),
})

defmenu("mysql", {
  menuentry("dump", "xdo_command('dump')"),
  menuentry("helpa", "xdo_command('h_con')"),
  menuentry("wondr", "xdo_command('w_con')"),
  menuentry("oashosting", "xdo_command('o_con')"),
})


defmenu("custommenu", {
  submenu("Kubectl", "kubectl"),
  submenu("Session", "session"),
  submenu("Ssh", "ssh"),
  submenu("Mysql", "mysql"),
})


-- Defbindings
defbindings("WScreen", {
  kpress("F12", nil),
})

defbindings("WMPlex.toplevel", {
  kpress(META2.."R", "ioncore.exec('rofi -show run')"),
  kpress(META2.."P", "ioncore.exec('rofi -show window')"),
  kpress(META2.."Return", "ioncore.exec_on(_, XTERM)"),
  kpress("F1", "mod_query.query_menu(_, _sub, 'custommenu', 'Shortcut:')"),
  kpress("F2", "ioncore.exec_on(_, XTERM)"),
  kpress("F5", nil),
  kpress("F6", "ioncore.create_ws(_)"),
  submap(CTRL.."K", {
    kpress("R", "ioncore.restart()"),
    kpress("T", "toggle_tab_bar(_)"),
    kpress("plus", "WMPlex.inc_index(_)"),
    kpress("minus", "WMPlex.dec_index(_)"),
  })
})

defbindings("WClientWin", {
  submap(CTRL.."K", {
    kpress("Q", "ioncore.shutdown()"),
    kpress("semicolon", "WClientWin.quote_next(_)"),
  })
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
  mdrag(META2.."Button1", "WFrame.p_tabdrag(_)"),
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

-- Window properties
defwinprop {
  class = "Firefox",
  role = "Manager",
  instance = "Download",
  float = true,
}

defwinprop {
  class = "Gvim",
  instance = "gvim",
  target = "Terminals1-Left",
  jumpto = true,
  switchto = true,
}
