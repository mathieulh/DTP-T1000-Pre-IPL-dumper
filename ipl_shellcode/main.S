	.set noreorder
	.global start
	.ent    start
#entrypoint is 0x40E0000
start:
#copy reset vector
    li     $t0, 0xBFC00000   #boot vector
#    li      $t0, 0xa0010000 #referenced in boot vector (code is copied to this addr by boot vector)
    addiu   $t3, $t0, 0x1000 #don't go over 0x1000 bytes at a time
    li      $t1, 0xBFE50000
loop:
    lw      $t2, 0($t0)
    sw      $t2, 0($t1)
    addiu   $t0, 4
    bne     $t3, $t0, loop
    addiu   $t1, 4

   .end start
	.set reorder
