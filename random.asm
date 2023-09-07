org 40000

main:
  call $daf
  call random
  ld bc, (number)
  call $1a1b
  ld bc, 10
delay:
  halt
  djnz delay
  jr main

random:
  ld hl, (seed)
  ld a, h
  and 31
  ld a, (hl)
  ld (number), a
  inc hl
  ld (seed), hl
  ret

seed: dw 0

number: db 0