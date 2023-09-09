org 40000

; Setup black screen with white ink
  ld a, 71
  ld ($5c8d), a

; Setup black border
  ld a, 0
  call $229b

;Setup graphics
  ld hl, blocks
  ld ($5c7b), hl

; Clear screen and open CH 2
  call $daf

; Initialise coordinates
  ld hl, 21 + 15 * 256
  ld (ply), hl

  call basexy
  call splayr

; Fill play area with mushrooms
  ld a, 68
  ld ($5c8d), a
  ld b, 50
mush_loop:
  ld a, 22
  rst 16
  call random
  and 15
  rst 16
  call random
  and 31
  rst 16
  ld a, $91
  rst 16
  djnz mush_loop

; Main loop
main: equ $
; Delete player
  call basexy
  call wspace

; Move player
  ld bc, 63486
  in a, (c)         ; Check keypress
  rra
  push af
    call nc, mpl    ; Key 1, move left
  pop af
  rra
  push af
    call nc, mpr    ; Key 2, move right
  pop af
  rra
  push af
    call nc, mpd    ; Key 3, move down
  pop af
  rra
  call nc, mpu      ; Key 4, move up

; Redisplay player
  call basexy
  call splayr

  ld b, 2
delay:
  halt
  djnz delay

  jp main

; Move player left
mpl:
  ld hl, plx
  ld a, (hl)
  and a
  ret z
  dec (hl)
  ret

; Move player right
mpr:
  ld hl, plx
  ld a, (hl)
  cp 31
  ret z
  inc (hl)
  ret

; Move player down
mpd:
  ld hl, ply
  ld a, (hl)
  cp 21
  ret z
  inc (hl)
  ret

;Move player up
mpu:
  ld hl, ply
  ld a, (hl)
  cp 4
  ret z
  dec (hl)
  ret

; Setup player coordinates
basexy:
  ld a, 22
  rst 16
  ld a, (ply)
  rst 16
  ld a, (plx)
  rst 16
  ret

; Player coordinates
plx: db 0
ply: db 0

; Show player at current position
splayr:
  ld a, 69
  ld ($5c8d), a
  ld a, $90
  rst 16
  ret
wspace:
  ld a, 71
  ld ($5c8d), a
  ld a, 32          ; Space char
  rst 16
  ret

; Generate pseudo-random number
random:
  ld hl, (seed)
  ld a, h
  and 31
  ld h, a
  ld a, (hl)
  inc hl
  ld (seed), hl
  ret
seed: db 0

; User graphics
blocks:
  db 16, 16, 56, 56, 124, 124, 254, 254   ; Player
  db 24,126,255,255,60,60,60,60           ; Mushroom

end 40000