import os
import re
from libqtile.config import Key, Screen, Group, Match, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget
# from libqtile import hook
from typing import List  # noqa: F401

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
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),

    # Move windows up or down in current stack
    Key([mod, "control"], "k", lazy.layout.shuffle_down()),
    Key([mod, "control"], "j", lazy.layout.shuffle_up()),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next()),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),

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

    # Specific apps bindings
    Key([mod], "d", lazy.spawn("dmenu_run")),
    Key([mod], "t", lazy.spawn("thunderbird")),
    Key([mod], "q", lazy.spawn("qutebrowser")),
    Key([mod], "g", lazy.spawn("google-chrome-stable")),

     # Sound
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 0 sset Master 1- unmute")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -c 0 sset Master 1+ unmute"))
]

# WORKSPACES (TERM, WEB, MAIL...) TO-BE-DONE
# workspaces = [
#       Group("1. Term"),
#       Group("2. Web"),
#       Group("3. Mail"), 
#       Group("4. VBox"),
#       Group("5. Music"),
#       Group("6. Video"),
#       Group("7. None"),
#       Group("8. None"),
#       Group("9. None"),
# ]

# groups = [Group(i) for i in workspaces]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
            # mod1 + nb of group = switch to group
            Key([mod], i.name, lazy.group[i.name].toscreen()),
            # mod1 + shift + nb of group = switch to & move focused window to group
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
        ])

### LAYOUTS ###

layouts = [
    layout.MonadTall(),
    layout.Bsp(border_focus="ffffff", border_width=2),
    layout.Max(),
    # layout.Stack(),
    # layout.Floating(border_focus="ffffff", border_width=2, fullscreen_border_width=2),
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
                widget.GroupBox(font="Ubuntu Bold", borderwidth = 1, highlight_method = "block", rounded=False),
                widget.TextBox(text='', background="000000", foreground="2F4F4F", padding=0, fontsize=60, width=23),
                # widget.Prompt(),
                widget.WindowName(background="2F4F4F"),
                widget.TextBox(text='', background="2F4F4F", foreground="000000", padding=0, fontsize=60, width=23),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
                widget.TextBox(text='', background="000000", foreground="2F4F4F", padding=0, fontsize=60, width=23),
                widget.Battery(background="2F4F4F", format="{percent:2.0%} {hour:d}h{min:02d}"),
                widget.TextBox(text='', background="2F4F4F", foreground="000000", padding=0, fontsize=60, width=23),
                widget.CPUGraph(),
                widget.TextBox(text='', background="000000", foreground="2F4F4F", padding=0, fontsize=60, width=23),
                widget.CurrentLayout(background="2F4F4F", fontsize = 15),
                widget.TextBox(text='', background="2F4F4F", foreground="000000", padding=0, fontsize=60, width=23),
                widget.QuickExit(default_text="\u23FB", fontsize=18, countdown_format="{}", countdown_start=10),
                # widget.TextBox(text='', background="000000", foreground="0000FF", padding=0, fontsize=60, width=23),
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

dgroups_key_binder = None
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

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
