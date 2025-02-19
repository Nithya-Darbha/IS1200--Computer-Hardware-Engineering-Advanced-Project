  # analyze.asm
  # This file written 2015 by F Lundevall
  # Copyright abandoned - this file is in the public domain.

	.text
main:
	li	$s0,0x30
loop:
	move	$a0,$s0		# copy from s0 to a0
	
	li	$v0,11		# syscall with v0 = 11 will print out
	syscall			# one byte from a0 to the Run I/O window

	addi	$s0,$s0,3	# what happens if the constant is changed? The addess of the $s0 register changes or increments by that constant
	# adding 1 to the initial address
	
	li	$t0,0x5d #had to change the address from 5b to 5d because it ($s0) never equals to 5b because the address increments by 3 after Z, and 5d is the next incremented address after Z (5a).
	bne	$s0,$t0,loop
	nop			# delay slot filler (just in case)

stop:	j	stop		# loop forever here
	nop			# delay slot filler (just in case)

