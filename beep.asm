org 40000

loop:
  ld hl, (pitchscale)
  ld de, (durationscale)
  call 949

durationscale:
  dw 65, 73, 82, 87, 98, 110, 123
pitchscale:
  dw 1642, 1460, 1297, 1223, 1086, 964, 856