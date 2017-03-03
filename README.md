# Termboy

Termboy is LEGO-like fancy vivid theme for Vim and vim-airline.

## Install (Pathogen)

```bash
git clone https://github.com/retorillo/termboy.vim ~/.vim/bundle
```

## Usage

To enable theme, add the following line to your `~/.vimrc`

```viml
" Should before pathogen#infect (if you use pathogen)
let g:airline_theme = 'termboy'
" Should after pathogen#infect (if you use pathogen)
color termboy
```

Or, execute the following command.

```viml
:AirlineTheme termboy
:color termboy
```

When theme never be appiled, try to add `set t_Co=16` to your `~/.vimrc`.

## Color configuration

On terminal, change settings of terminal emulator to configure theme colors.

On gvim, this plugin convert 16 colors to better RGB colors by using
`g:airline#themes#termboy`.

The following examples, change mapping of "DarkRed" to `#ff5555`.

```viml
" Example1: Before color command and loading airline plugin
let g:termboy#guiColors = {
  \ 'DarkRed': '#ff5555'
  \ }

" Example2: After color command and airline plugin was loaded
let g:termboy#guiColors.Red = '#ff5555'
color termboy
AirlineRefresh
```

| 16 Color Names | Default GUI Mapping |
|----------------|---------------------|
| Black          | #1e1e1e             |
| DarkBlue       | #3c50be             |
| DarkGreen      | #508c3c             |
| DarkCyan       | #3c8cb4             |
| DarkRed        | #b43c3c             |
| DarkMagenta    | #7846a0             |
| DarkYellow     | #b4af50             |
| LightGray      | #b4b4b4             |
| DarkGray       | #787878             |
| Blue           | #5078f0             |
| Green          | #64b450             |
| Cyan           | #64a0f0             |
| Red            | #f05050             |
| Magenta        | #b464f0             |
| Yellow         | #f0e678             |
| White          | #ffffff             |


## License

The MIT License

Copyright (C) 2017 Retorillo
