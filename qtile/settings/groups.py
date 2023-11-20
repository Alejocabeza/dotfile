from libqtile.config import Key, Group
from libqtile.command import lazy
from .keys import mod1, keys


groups = [
    Group(i)
    for i in [
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
    ]
]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend(
        [
            Key(["mod1"], "Tab", lazy.screen.next_group()),
            Key(["mod1", "shift"], "Tab", lazy.screen.prev_group()),
        ]
    )
