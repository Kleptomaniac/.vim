:: Installs Boombox (themes, _vimrc,
:: etc.) on Vim for Windows
::
:: Ensure this script is run when
:: git repo is first added

:: Turn off command printing
@echo off

cd ../../
rmdir vimfiles /s /q
rename boombox vimfiles
echo "source $VIM/vimfiles/vimrc" > _vimrc
