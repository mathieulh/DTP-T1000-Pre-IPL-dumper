BUILD INSTRUCTIONS: 

Modify main.S

For 0.6.0 and below kbooti: 

    li     $t0, 0xBFC00000   #boot vector
#    li      $t0, 0xa0010000 #referenced in boot vector (code is copied to this addr by boot vector)

For 0.7.0 and onward: 

#    li     $t0, 0xBFC00000   #boot vector
    li      $t0, 0xa0010000 #referenced in boot vector (code is copied to this addr by boot vector)