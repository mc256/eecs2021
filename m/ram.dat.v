@20 00000000 // the sum
@24 00000000 // the or reduction

@50 00000001 // array[0]
@54 00000003 // array[1]
@58 00000005 // array[2]
@5C 00000007 // array[3]
@60 00000009 // array[4]
@64 0000000B // array[5]
@68 00000000 // null terminator 

@80 00006820 // add $t5, $0, $0 # t5 = index
@84 00008020 // add $s0, $0, $0 # s0 = sum
@88 00002020 // add $a0, $0, $0 # a0 = or reduction
@8C 8da80050 // loop: 	// lw $t0, 0x50($t5) # loop: t0 = array[t5]
@90 11000004 // beq $t0, $0, done # if (t0 == 0) done // Over counts?
@94 02088020
@98 00882025
@9C 21ad0004
@a0 08000023 // j loop // it was 10000c
@a4 ac100020 // done:
@a8 ac040024
