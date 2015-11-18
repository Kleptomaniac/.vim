:: Installs Boombox (themes, _vimrc,
:: etc.) on Vim for Windows
::
:: Ensure this script is run when
:: git repo is first added

:: Turn off command printing
@ECHO OFF

rmdir ../../vimfiles /s /q
rename ../../ vimfiles
echo "source $VIM/vimfiles/vimrc" > ../../_vimrc
