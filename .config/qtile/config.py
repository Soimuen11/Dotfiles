# import os
# import re
# import subprocess
# from libqtile import hook
from libqtile import layout, bar, widget
from libqtile.config import Key, Screen, Group, Match, Drag, Click
from libqtile.dgroups import simple_key_binder
from libqtile.command import lazy
# from typing import List

### KEYBINDINGS ###
mod = "mod4"

keys = [
    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),

    #switch place of windows (left/right/bottom/up)
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),

    #Increase or decrease size of windows
    # Key([mod, "control"], "j", lazy.layout.grow_down()),
    # Key([mod, "control"], "k", lazy.layout.grow_up()),
    # Key([mod, "control"], "h", lazy.layout.grow_left()),
    # Key([mod, "control"], "l", lazy.layout.grow_right()),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod], "Return", lazy.spawn("termite")),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "w", lazy.window.kill()),

    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    # mod + control + s = shutdown machine
    Key([mod, "control"], "s", lazy.spawn("termite -e 'shutdown now' ")),

    # CUSTOM APP BINDINGS
    # d = dmenu
    Key([mod], "d", lazy.spawn("dmenu_run")),
    # t = thunderbird
    Key([mod], "t", lazy.spawn("thunderbird")),
    # o = libreoffice (o like office)
    Key([mod], "o", lazy.spawn("libreoffice")),
    # v = vlc
    Key([mod], "v", lazy.spawn("vlc")),
    # p = player
    Key([mod], "p", lazy.spawn("termite -e 'mocp -T /usr/share/moc/themes/darkdot_theme'")),
    # c = config #not working properly with nvim+termite
    Key([mod], "c", lazy.spawn("termite -e 'vim .config/qtile/config.py'")),
    # b = brave browser
    Key([mod], "b", lazy.spawn("termite -e brave")),
    # r = ranger
    Key([mod], "r", lazy.spawn("termite -e ranger")),
    # s = sound
    Key([mod], "s", lazy.spawn("pavucontrol")),
    # e = editor
    Key([mod], "e", lazy.spawn("termite -e vim")),
    # u = tmux
    Key([mod], "u", lazy.spawn("termite -e tmux")),
    # a = anki
    Key([mod], "a", lazy.spawn("anki")),
    # Lock screen
    Key([mod, "shift"], "space", lazy.spawn("i3lock-fancy")),

    # Sreen brightness controls with xbacklight
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 20")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 20")),

     # Sound with amixer
    Key([], "XF86AudioMute", lazy.spawn("amixer sset Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer sset Master 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer sset Master 5%+")),

     # Sound with pulseaudio
    # Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute 2 toggle")),
    # Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 2 -5%")),
    # Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 2 +5%")),

    # Key([], "XF86AudioPrev", lazy.spawn("moc --previous")),
    # Key([], "XF86AudioStop", lazy.spawn("moc --pause")),
    # Key([], "XF86AudioNext", lazy.spawn("moc --next")),

    # XF86Internet # toggle internet on/off
]

### GROUPS ###

# --> NAMED GROUPS <--
groups = [
    Group("Web", matches=[Match(wm_class=["google-chrome-stable"])]),
    Group("Mail", matches=[Match(wm_class=["thunderbird"])]),
    Group("Term"),
    Group("Media", matches=[Match(wm_class=["vlc"])]),
    Group("Extras"),
]
dgroups_key_binder = simple_key_binder("mod4")

# --> NUMBERED GROUPS <--
# groups = [Group(i) for i in "123456789"]
# for i in groups:
#     keys.extend([
#             # mod1 + nb of group = switch to group
#             Key([mod], i.name, lazy.group[i.name].toscreen()),
#             # mod1 + shift + nb of group = switch to & move focused window to group
#             Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
#         ])
# dgroups_key_binder = None

### LAYOUTS ###

layouts = [
    # red borders
    layout.MonadTall(border_width=3, border_focus="8B0000"),
    # transparent borders (adding 2 zeroes at the end of the color makes transparency)
    # layout.MonadTall(border_width=6, border_focus="8B000000"),
    #all windows => full screen
    layout.Max(),
]

##### DEFAULT WIDGET SETTINGS #####

widget_defaults = dict(
    font="Ubuntu Mono",
    fontsize = 12,
    padding = 5,
)
extension_defaults = widget_defaults.copy()

##### WIDGETS #####

screens = [
    Screen(
        #replace "bottom" by "top" to put bar at the top
        #(or "top" by "bottom")
        bottom=bar.Bar(
            [
                widget.GroupBox(font="Ubuntu Bold", borderwidth = 2, highlight_method = "line", highlight_color="000000", rounded=False, active="9400D3", inactive="c0c0c0"),
                widget.TextBox(text='', background="000000", foreground="8B0000", padding=0, fontsize=60, width=23),
                widget.WindowName(background="8B0000"),
                widget.TextBox(text='', background="8B0000", foreground="000000", padding=0, fontsize=60, width=23),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
                widget.TextBox(text='', background="000000", foreground="8B0000", padding=0, fontsize=60, width=23),
                widget.Battery(background="8B0000", format="{percent:2.0%} {hour:d}h{min:02d}"),
                widget.TextBox(text='', background="8B0000", foreground="000000", padding=0, fontsize=60, width=23),
                widget.CPUGraph(),
                widget.TextBox(text='', background="000000", foreground="8B0000", padding=0, fontsize=60, width=23),
                widget.CurrentLayout(background="8B0000", fontsize = 15),
                widget.TextBox(text='', background="8B0000", foreground="000000", padding=0, fontsize=60, width=23),
                widget.QuickExit(default_text="\u23FB", fontsize=18, countdown_format="{}", countdown_start=10),
                widget.Moc(background="0000FF",play_color="ffffff", max_chars=20),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

##### STARTUP APPLICATIONS #####
# @hook.subscribe.startup_once
# def autostart():
    # path to my script, under my user directory
    # home = os.path.expanduser('~/.config/qtile/autostart.sh')
    # subprocess.call([home])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
