## Hwacha computeNgram code

.text

.globl ngram_bind_v
#.globl xor_ngram_v


#

.align 3
ngram_bind_v:
	vpset vp0
	vld vv0, va0			# q[0], ngram 0
	vld vv1, va1			# q[z], ngram 1
	vld vv2, va2			# q[z], ngram 1
	vsrl vv0, vv0, vs1		# permute: q[0] >> 1, logical fill w/0s every 64 bits
	vxor vv0, vv0, vv1		# vv3 = permuted(q[0]) ^ q[1]
	vsrl vv0, vv0, vs1		# permute: q[0] >> 1, logical fill w/0s every 64 bits
	vxor vv0, vv0, vv2		# vv3 = permuted(q[0]) ^ q[2]
	vsd vv0, va0			# write vv3 into q[0]
	vstop

#.align 3
#xor_ngram_v:
#	vpset vp0
#	vld vv0, va1 # q[x][b]
#	vld vv1, va2 # xor[b]
#	vxor vv2, vv0, vv1 # vv2 = q[x][b] ^ xor[b]
#	vsd vv2, va0 # q[0][b] = vv2
#	vstop