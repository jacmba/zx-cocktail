org 40000

  ld hl, $5c08
  ld (hl), 0

loop:
  ld a, (hl)
  cp 0
  jr z, loop

  ld (key), a

  ld a, 2
  call 5633

  ld bc, (key)
  call $1a1b

  ret

key:
  db 0