 --[[

     Rainbow-Dark Awesome WM theme 2.0
     Modified Rainbow theme from github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.default_dir                               = require("awful.util").get_themes_dir() .. "default"
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/rainbow-dark"
theme.wallpaper                                 = theme.dir .. "/wall.png"
theme.font                                      = "Terminus 10"
theme.fg_normal                                 = "#6f7ca0" --bleu clair
theme.fg_focus                                  = "#b4769a" --rose
theme.bg_normal                                 = "#31313a" --gris sombre
theme.bg_focus                                  = "#31313a" --gris sombre
theme.fg_urgent                                 = "#e0da37" --jaune
theme.bg_urgent                                 = "#b4769a" --rose
theme.border_width                              = dpi(2)
theme.border_normal                             = "#31313a" --gris sombre
theme.border_focus                              = "#31313a" --gris sombre
theme.taglist_fg_focus                          = "#e0da37" --jaune
theme.taglist_bg_focus                          = "#44454b" --gris 
theme.taglist_fg_empty                         = "#6f7ca0" --bleu clair
theme.taglist_bg_empty                         = "#31313a" --gris sombre
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.ocol                                      = "<span color='" .. theme.fg_normal .. "'>"
theme.tasklist_sticky                           = theme.ocol .. "[S]</span>"
theme.tasklist_ontop                            = theme.ocol .. "[T]</span>"
theme.tasklist_floating                         = theme.ocol .. "[F]</span>"
theme.tasklist_maximized_horizontal             = theme.ocol .. "[M] </span>"
theme.tasklist_maximized_vertical               = ""
theme.tasklist_disable_icon                     = false
theme.awesome_icon                              = theme.dir .."/icons/awesome.png"
theme.menu_submenu_icon                         = theme.dir .."/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.useless_gap                               = dpi(15)
theme.layout_txt_tile                           = "[t]"
theme.layout_txt_tileleft                       = "[l]"
theme.layout_txt_tilebottom                     = "[b]"
theme.layout_txt_tiletop                        = "[tt]"
theme.layout_txt_fairv                          = "[fv]"
theme.layout_txt_fairh                          = "[fh]"
theme.layout_txt_spiral                         = "[s]"
theme.layout_txt_dwindle                        = "[d]"
theme.layout_txt_max                            = "[m]"
theme.layout_txt_fullscreen                     = "[F]"
theme.layout_txt_magnifier                      = "[M]"
theme.layout_txt_floating                       = "[*]"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_uptime                             = theme.dir .. "/icons/ac.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_weather                            = theme.dir .. "/icons/dish.png"
theme.widget_fs                                 = theme.dir .. "/icons/fs.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_note                               = theme.dir .. "/icons/note.png"
theme.widget_note_on                            = theme.dir .. "/icons/note_on.png"
theme.widget_netdown                            = theme.dir .. "/icons/net_down.png"
theme.widget_netup                              = theme.dir .. "/icons/net_up.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_batt                               = theme.dir .. "/icons/bat.png"
theme.widget_clock                              = theme.dir .. "/icons/clock.png"
theme.widget_vol                                = theme.dir .. "/icons/spkr.png"



theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/closei.png"
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close.png"

theme.titlebar_minimize_button_normal           = theme.dir .. "/icons/titlebar/mini.png"
theme.titlebar_minimize_button_focus            = theme.dir .. "/icons/titlebar/min.png"

theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floati.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/float.png"

theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/tilei.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/tile.png"

theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maxi.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/max.png"

theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maxi.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/max.png"

-- lain related
theme.layout_txt_cascade                        = "[cascade]"
theme.layout_txt_cascadetile                    = "[cascadetile]"
theme.layout_txt_centerwork                     = "[centerwork]"
theme.layout_txt_termfair                       = "[termfair]"
theme.layout_txt_centerfair                     = "[centerfair]"

local markup = lain.util.markup
local white  = theme.fg_focus
local gray   = theme.fg_normal

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e33a6e", cpu_now.usage .. "% "))
    end
})

-- CORE TEMP
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#f1af5f", coretemp_now .. "°C "))
    end
})

-- CLOCK
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local mytextclock = wibox.widget.textclock(markup("#7788af", "%A %d %B ") .. markup("#ab7367", ">") .. markup("#de5e1e", " %H:%M "))
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "Terminus 11",
        fg   = gray,
        bg   = theme.bg_normal
    }
})

-- NET
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widget.net({
    settings = function()
        --[[ uncomment if using the weather widget
        if iface ~= "network off" and
           string.match(theme.weather.widget.text, "N/A")
        then
            theme.weather.update()
        end
        --]]

        widget:set_markup(markup.fontfg(theme.font, "#e54c62", net_now.sent .. " kb/s"))
        netdowninfo:set_markup(markup.fontfg(theme.font, "#87af5f", net_now.received .. " kb/s"))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e0da37", mem_now.used .. "M "))
    end
})

-- SEPARATORS
local first = wibox.widget.textbox(markup.font("Terminus 4", " "))
local spr   = wibox.widget.textbox(' ')

local function update_txt_layoutbox(s)
    -- Writes a string representation of the current layout in a textbox widget
    local txt_l = theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))] or ""
    s.mytxtlayoutbox:set_text(txt_l)
end

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Textual layoutbox
    s.mytxtlayoutbox = wibox.widget.textbox(theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))])
    awful.tag.attached_connect_signal(s, "property::selected", function () update_txt_layoutbox(s) end)
    awful.tag.attached_connect_signal(s, "property::layout", function () update_txt_layoutbox(s) end)
    s.mytxtlayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function() awful.layout.inc(1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function() awful.layout.inc(-1) end),
                           awful.button({}, 4, function() awful.layout.inc(1) end),
                           awful.button({}, 5, function() awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(18), bg = theme.bg_focus, fg = theme.fg_focus })
    
    -- My Lauchers icon on Wibox
    
    pamac = awful.widget.launcher({ image = "/home/akze/.config/awesome/themes/rainbow-dark/icons/App/pamac.png",
                                     command = "pamac-manager" })
    
    molotov = awful.widget.launcher({ image = "/home/akze/.config/awesome/themes/rainbow-dark/icons/App/molotov.png",
                                     command = "/home/akze/Applications/./molotov_5b199c8affc65fb40ec566cdba11df97.AppImage" })
    
    writer = awful.widget.launcher({ image = "/home/akze/.config/awesome/themes/rainbow-dark/icons/App/writer.png",
                                     command = "soffice --writer" })
    
    kdenlive = awful.widget.launcher({ image = "/home/akze/.config/awesome/themes/rainbow-dark/icons/App/kdenlive.png",
                                     command = "kdenlive" })
                                     
	gcolor = awful.widget.launcher({ image = "/home/akze/.config/awesome/themes/rainbow-dark/icons/App/gcolor.png",
                                     command = "gcolor2" })
                                     
   -- Menu Wibar
myawesomemenu = {
  { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "Restart", awesome.restart },
   { "Quit", function() awesome.quit() end },
   { "reboot", "systemctl reboot" },
   { "shutdown", "systemctl poweroff" },
}

mymainmenu = awful.menu({ items = { { 'awesome', myawesomemenu, theme.awesome_icon },
                                    { "Term", "alacritty", "/home/akze/.config/awesome/themes/rainbow-dark/icons/App/terminal.svg" },
                                    { "firefox", "firefox", "/home/akze/.config/awesome/themes/rainbow-dark/icons/App/firefox.svg" },
                                    { "Thunar", "thunar", "/home/akze/.config/awesome/themes/rainbow-dark/icons/App/thunar.svg" }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = theme.awesome_icon,
                                     menu = mymainmenu })
    
    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            first,
            mylauncher,
            spr,
            s.mytaglist,
            spr,
            s.mytxtlayoutbox,
            spr,
            pamac,
            spr,
            molotov,
            spr,
            writer,
            spr,
            kdenlive,
            spr,
            gcolor,
            spr,
            s.mypromptbox,
            spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spr,
            netdownicon,
            netdowninfo,
            netupicon,
            netupinfo.widget,
            memicon,
            memory.widget,
            cpuicon,
            cpu.widget,
            tempicon,
            temp.widget,
            clockicon,
            mytextclock,
            wibox.widget.systray(),
            
        },
    }
end

return theme
