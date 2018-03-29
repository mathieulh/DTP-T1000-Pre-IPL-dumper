	.set noreorder
	.global start
	.ent    start

start:
#Store 0xBFE01100 to register $29 and jump to it

    li      $29, 0xBFE01100
    jr      $29
    nop

   .end start
	.set reorder
