org 40000
  call 3503
  ld a, 2
  call 5633
loop:
  ld de, string
  ld bc, eostr-string
  call 8252
  ;jp loop
  ret

string:
  db 17, 0, 16, 3, "Hello world!!"
eostr:
end 40000