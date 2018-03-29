	.set noreorder
	.global start
	.ent    start
#entrypoint is 0x40F0000 for 0.7.0+ 0x8400000 for older
start:
#copy reset vector
    li     $t0, 0xBFC00000   #boot vector/Lib-PSP iplloader loader code
#    li      $t0, 0xa0010000 #Lib-PSP iplloader payload referenced in boot vector/loader
    addiu   $t3, $t0, 0x1000 #don't go over 0x1000 bytes at a time
    li      $t1, 0xBFE50000 #Tachyon Shared memory offset+0x50000 mapped to 0x1D600000+0x50000 on the communication processor
loop:
    lw      $t2, 0($t0)
    sw      $t2, 0($t1)
    addiu   $t0, 4
    bne     $t3, $t0, loop
    addiu   $t1, 4

   .end start
	.set reorder
