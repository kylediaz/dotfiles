# Keybindings

Important Rules:

1. Never use more than two modifier keys for any shortcut. Anything more is overkill.
2. Conceptually separate global and application-specific keybindings.
3. Map <kbd>⌘⌥⌃</kbd> to caps lock/hyper key <kbd>⇪/✦</kbd>.
4. Use <kbd>✦</kbd> exclusively for global keybindings.

## OS Keybindings

I go to `Settings > Keyboard > Keyboard Shortcuts` and unbind everything. There
are some shortcuts you can't unbind (e.g., <kbd>⌘</kbd> + <kbd>Q</kbd>) but
that's not an issue.

## Hyper Key

I use [Karabiner](https://karabiner-elements.pqrs.org/) to remap <kbd>⇪/✦</kbd>
to <kbd>⌘⌥⌃</kbd>.

Traditionally, <kbd>✦</kbd> = <kbd>⌘⌥⌃</kbd> + <kbd>⇧</kbd> because those four
modifier keys are hard to press simultaneously. On my keyboard, <kbd>✦</kbd> is only <kbd>⌘⌥⌃</kbd> so I
can use <kbd>⇧</kbd> as a modifier for it.

## Global Keybindings

Global keybindings are actions that occur regardless of which application you
have open. An example is the keybindings for my window manager.

I exclusively use <kbd>✦</kbd> for global keybindings so they
don't interfere with application-specific keybindings.

| Window Manager Shortcuts                | Maps To                             |
| --------------------------------------- | ----------------------------------- |
| <kbd>✦</kbd> + hjkl;uiop                | Switch to workspace                 |
| <kbd>✦</kbd> + <kbd>⇧</kbd> + hjkl;uiop | Move current window to workspace    |
| <kbd>✦</kbd> + <kbd>hl</kbd>            | Switch between windows in workspace |

| Shortcuts                           | Maps To                                |
| ----------------------------------- | -------------------------------------- |
| <kbd>⌘</kbd> + space                | Open Raycast                           |
| <kbd>⌃</kbd> + <kbd>⌘</kbd> + space | Raycast emoji selector                 |
| <kbd>✦</kbd> + <kbd>m</kbd>         | Toggle mute/unmute in Zoom/Discord/etc |
|                                     | And so on...                           |

<kbd>Right ⌘</kbd> is special. It can be used to activate a vim-like experience so I
never have to use the arrow keys.

| Vim Key Combination (right ⌘ +)  | Maps To                     |
| -------------------------------- | --------------------------- |
| <kbd>hjkl</kbd>                  | Arrow keys                  |
| <kbd>e</kbd>                     | <kbd>⌥</kbd> + <kbd>→</kbd> |
| <kbd>b</kbd>                     | <kbd>⌥</kbd> + <kbd>←</kbd> |
| <kbd>Left ⇧</kbd> + <kbd>d</kbd> | <kbd>⌫</kbd>                |
| <kbd>$</kbd> or <kbd>A</kbd>     | <kbd>⌘</kbd> + <kbd>→</kbd> |
| <kbd>0</kbd> or <kbd>I</kbd>     | <kbd>⌘</kbd> + <kbd>←</kbd> |

Some amazingly-designed applications like Arc and Raycast let you use
<kbd>⌃+hjkl</kbd> to navigate instead of using the arrow keys. The
first row's bindings let you have this UX anywhere.

## Application-Specific Keybindings

Self explanatory.

For all apps, I unbind anything that uses three or more modifiers. Instead, I
use command palettes over shortcuts for any infrequent actions.

### Unifying Modern Application Design Patterns

My most commonly used applications are multidimensional --- they have some sort
of tab feature alongside other dimensions you can navigate in.

1. Zed has left/right/bottom/middle docks, each can be split into panels. Each
   panel has tabs.
2. Arc has spaces that contain tabs. Additionally, each tab can be split.
3. Warp has tabs that can be split into panes.
4. Aerospace has workspaces that contain windows.

Software clearly has its own kind of curse of dimensionality. Zed has 4
dimensions on top of being nested within the 3D space of Aerospace! This sucks
big time. I don't want to play 7D chess every time I want to navigate.

Additionally, the structures aren't even the same. In Warp and Arc, each tab
can be split. In Zed and VSCode, you can split the window into panes, and each
pane has multiple tabs. In Zed and VSCode, tabs are the "lowest axis" you can
navigate on. In Warp and Arc, tabs contain nested elements you can navigate in.

Fixes:

1. Reduce dimensionality. I don't vertically split anything --- only horizontally.
2. Make things consistent.
