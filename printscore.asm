org 40000
ld a, 2
call 5633

ld bc, (score)
call $1a1b
ret

score:
  dw 1500