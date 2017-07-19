! ~/.xres/rofi.x
! Config file for rofi. Site @ https://davedavenport.github.io/rofi/

!rofi.modi:		window, drun
!rofi.combi-modi:	window, drun

! [Interface]
rofi.bw:		1
rofi.hide-scrollbar:	true
rofi.terminal:		termite

! [Colors] 
! See ~/.xres/colors.x for variables

! bg = background, bgalt = bg alternating row, hlbg = bg selected row
! fg = foreground, hlfg = fg selected row
!			bg	fg	bgalt	hlbg		hlfg
rofi.color-normal:	bg,	fg,	bg,	magenta13,	fg
rofi.color-urgent:	bg,	fg,	bg,	magenta13,	fg
rofi.color-active:	bg,	fg,	bg,	magenta13,	fg

!			bg	border		separator
rofi.color-window:	bg,	blue12,		blue12
