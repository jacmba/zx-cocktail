org 40000
  ld hl, 16384
  ld a, 162
  ld (hl), a
  ld de, 16385
  ld bc, 6911
  ldir
  ret
end 40000