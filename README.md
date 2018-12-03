*CtrlXA*
=========

This Vim plug-in makes the key bindings `<Ctrl-X/A>` additionally cycle through keywords in lists such as `true/false`, `yes/no`, `set/unset` or `yesterday/today/tomorrow`.

These keywords are configurable by the variable `g:CtrlXA_Toggles` which defaults to

```vim
  let g:CtrlXA_Toggles = [
      \ ['true', 'false'], ['True', 'False'], ['TRUE', 'FALSE'],
      \ ['yes', 'no'], ['Yes', 'No'], ['YES', 'NO'],
      \ ['on', 'off'], ['On', 'Off'], ['ON', 'OFF'],
      \ ['set', 'unset'],
      \ ['enable', 'disable'],
      \ ['is', 'isnot'] ,
      \ ['==', '!='] , ['<', '>'], ['<=', '>='], ['=~', '!~'],
      \ ['up', 'down'], ['Up', 'Down'] ,['UP', 'DOWN'],
      \ ['right', 'left'], ['Right', 'Left'], ['RIGHT', 'LEFT'] ,
      \ ['next', 'previous'],
      \ ['first', 'last'],
      \ ['before', 'after'],
      \ ['enabled', 'disabled'],
      \ ['more', 'less'],
      \ ]
```

There is also its buffer-local analogue, which allows for file-type specific
keyword cycles by, for example, as included by default,

```vim
  autocmd FileType gitrebase
              \ let b:CtrlXA_Toggles = [
              \ ['pick', 'fixup', 'squash', 'break', 'reword', 'edit', 'drop'],
              \ ] + g:CtrlXA_Toggles
  autocmd FileType vim
              \ let b:CtrlXA_Toggles = [
              \ ['if', 'else', 'elseif', 'endif'],
              \ ] + g:CtrlXA_Toggles
  autocmd FileType sh
              \ let b:CtrlXA_Toggles = [
              \ ['if', 'elif', 'else', 'fi'],
              \ ] + g:CtrlXA_Toggles
```
This will

- include all keyword cycles of the global variable, and
- add (buffer-)local keyword cycles which have precedence over the global cycles.

There are many more toggles that could be useful, for example, to switch between the draft and final version of a `TeX` document, add:
```vim
  autocmd FileType tex
              \ let b:CtrlXA_Toggles = [
              \ ['final', 'draft'],
              \ ] + g:CtrlXA_Toggles
```
