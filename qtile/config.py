from libqtile import hook
from os import path

from settings.keys import mod, keys
from settings.groups import groups
from settings.layouts import layouts, floating_layout
from settings.mouse import mouse
from settings.path import qtile_path
from settings.widgets import widget_defaults, widgets_list
from settings.screens import screens

import subprocess
#
# @lazy.function
# def window_to_prev_group(qtile):
#     if qtile.currentWindow is not None:
#         i = qtile.groups.index(qtile.currentGroup)
#         qtile.currentWindow.togroup(qtile.groups[i - 1].name)
#
#
# @lazy.function
# def window_to_next_group(qtile):
#     if qtile.currentWindow is not None:
#         i = qtile.groups.index(qtile.currentGroup)
#         qtile.currentWindow.togroup(qtile.groups[i + 1].name)
#
#
# def window_to_previous_screen(qtile, switch_group=False, switch_screen=False):
#     i = qtile.screens.index(qtile.current_screen)
#     if i != 0:
#         group = qtile.screens[i - 1].group.name
#         qtile.current_window.togroup(group, switch_group=switch_group)
#         if switch_screen == True:
#             qtile.cmd_to_screen(i - 1)
#
#
# def window_to_next_screen(qtile, switch_group=False, switch_screen=False):
#     i = qtile.screens.index(qtile.current_screen)
#     if i + 1 != len(qtile.screens):
#         group = qtile.screens[i + 1].group.name
#         qtile.current_window.togroup(group, switch_group=switch_group)
#         if switch_screen == True:
#             qtile.cmd_to_screen(i + 1)
#
#
# # hides the top bar when the archlinux-logout widget is opened
# @hook.subscribe.client_new
# def new_client(window):
#     if window.name == "ArchLinux Logout":
#         qtile.hide_show_bar()
#
#
# # shows the top bar when the archlinux-logout widget is closed
# @hook.subscribe.client_killed
# def logout_killed(window):
#     if window.name == "ArchLinux Logout":
#         qtile.hide_show_bar()
#
#
# @hook.subscribe.startup_once
# def start_once():
#     subprocess.call([path + "/.config/qtile/scripts/autostart.sh"])
#
#
# @hook.subscribe.startup
# def start_always():
#     # Set the cursor to something sane in X
#     subprocess.Popen(["xsetroot", "-cursor_name", "left_ptr"])
#
#
# @hook.subscribe.client_new
# def set_floating(window):
#     if (
#         window.window.get_wm_transient_for()
#         or window.window.get_wm_type() in floating_types
#     ):
#         window.floating = True


@hook.subscribe.startup_once
def autostart():
    subprocess.call(path.join(qtile_path, "/.config/qtile/scripts/autostart.sh"))


# dgroups_key_binder = None
# dgroups_app_rules = []
# main = None
# floating_types = ["notification", "toolbar", "splash", "dialog"]
# follow_mouse_focus = True
# bring_front_click = False
# cursor_warp = False
# auto_fullscreen = True
# focus_on_window_activation = "focus"  # or smart
# wmname = "LG3D"

main = None
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "urgent"
wmname = "LG3D"
