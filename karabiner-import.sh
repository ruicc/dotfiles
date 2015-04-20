#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set option.emacsmode_ex_controlW 1
/bin/echo -n .
$cli set remap.jis_command2eisuukana_prefer_command 1
/bin/echo -n .
$cli set repeat.wait 30
/bin/echo -n .
$cli set repeat.initial_wait 300
/bin/echo -n .
$cli set option.emacsmode_controlLeftbracket 1
/bin/echo -n .
$cli set option.emacsmode_ex_controlU_delete 1
/bin/echo -n .
$cli set remap.space2shiftL_space_keyrepeat 1
/bin/echo -n .
$cli set option.emacsmode_controlPNBF_nomodifiers 1
/bin/echo -n .
$cli set remap.swap_number_and_symbol 1
/bin/echo -n .
/bin/echo
