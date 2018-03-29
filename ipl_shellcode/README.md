BUILD INSTRUCTIONS: 

main.S

For 0.6.0 and below kbooti: 

    li     $t0, 0xBFC00000   #boot vector/loader

For 0.7.0 and onward: 

    li      $t0, 0xa0010000 #payload address referenced in boot vector
