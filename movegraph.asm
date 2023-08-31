org $9c40
  ; Define User Defined Graphics
  ld hl, udg
  ld ($5c7b), hl

  ; Open channel
  ld a, 2
  call 5633

  ; Set screen colors
  ld a, 4
  ld ($5c8d), a

  ; Set black border
  ld a, 0
  call $229b

  ; Clear screen
  call $daf

  ; Start displaying graphic
  ld a, 21
  ld (ycoord), a

loop:
  call setxy
  ld a, $90
  rst 16
  call delay
  call setxy
  ld a, ' '
  rst 16
  ld hl, ycoord
  dec (hl)
  ld a, (hl)
  cp 0
  jr nz, loop
  ret

delay:
  ld b, 10
delay0:
  halt
  djnz delay0
  ret

setxy:
  ld a, 22
  rst 16
  ld a, (ycoord)
  rst 16
  ld a, (xcoord)
  rst 16
  ret

ycoord:
  db 0
xcoord:
  db 15

udg:
  db %00111100
  db %01111110
  db %11011011
  db %11111111
  db %11111111
  db %10000001
  db %01111110
  db %00111100

end $9c40