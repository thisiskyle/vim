vim9script

import autoload 'autopack.vim'

command AutoPackInstall call autopack.InstallAll()
command AutoPackUpdate call autopack.UpdateAll()
command AutoPackClean call autopack.Cleanup()
