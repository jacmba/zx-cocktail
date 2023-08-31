org 40000
  ld a, 2
  call 5633

  ld a, 21
  ld (ycoord), a

loop:
  call setxy
  ld a, '*'
  rst 16
  call delay
  call setxy
  ld a, ' '
  rst 16
  ld hl, ycoord
  dec (hl)
  ld a, (hl)
  cp 255
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
end 40000