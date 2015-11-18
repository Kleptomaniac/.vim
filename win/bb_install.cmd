:: Installs Boombox (themes, _vimrc,
:: etc.) on Vim for Windows
::
:: Ensure this script is run when
:: git repo is first added

:: Turn off command printing
@echo off

:: Change working directory to parent of
:: repo, add link to internal vimrc
pushd %dp0\..\..
echo "so $VIM/vimfiles/vimrc" > _vimrc
popd
