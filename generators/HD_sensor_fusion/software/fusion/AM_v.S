## Hwacha computeNgram code

.text

.globl hamming_v


#

.align 3
hamming_v:
	vpset vp0
	vld vv0, va0			# vv0 = aM[0][j]
	vld vv3, va1			# vv1 = q[j]
	vxor vv0, vv0, vv3		# i = aM[0][j] ^ q[j]
	vsrl vv1, vv0, vs1		# vv1 = i >> 1
	vand vv1, vv1, vs2		# vv1 = (i >> 1) & const5
	vsub vv0, vv0, vv1		# i = i - (i >> 1) & const5
	vand vv1, vv0, vs3		# vv1 = (i & const3)
	vsrl vv2, vv0, vs4		# vv2 = (i >> const4)
	vand vv2, vv2, vs3		# vv2 = ((i >> const4) & const3)
	vadd vv0, vv1, vv2		# i = (i & const3) + ((i >> const4) & const3)
	vsrl vv1, vv0, vs5		# vv1 = (i >> const5)
	vadd vv0, vv0, vv1		# i = (i & const5) + i
	vand vv0, vv0, vs6		# vv0 = ((i >> const4) & const6)
	vmul vv0, vv0, vs7		# vv0 = ((i >> const4) & const6) * const7
	vsrl vv0, vv0, vs8		# vv0 = (((i >> const4) & const6) * const7) >> const8
	vsd vv0, va2			# vv0 = tmp0[j]
	vld vv0, va4			# vv0 = aM[1][j]
	vxor vv0, vv0, vv3		# i = aM[1][j] ^ q[j]
	vsrl vv1, vv0, vs1		# vv1 = i >> 1
	vand vv1, vv1, vs2		# vv1 = (i >> 1) & const5
	vsub vv0, vv0, vv1		# i = i - (i >> 1) & const5
	vand vv1, vv0, vs3		# vv1 = (i & const3)
	vsrl vv2, vv0, vs4		# vv2 = (i >> const4)
	vand vv2, vv2, vs3		# vv2 = ((i >> const4) & const3)
	vadd vv0, vv1, vv2		# i = (i & const3) + ((i >> const4) & const3)
	vsrl vv1, vv0, vs5		# vv1 = (i >> const5)
	vadd vv0, vv0, vv1		# i = (i & const5) + i
	vand vv0, vv0, vs6		# vv0 = ((i >> const4) & const6)
	vmul vv0, vv0, vs7		# vv0 = ((i >> const4) & const6) * const7
	vsrl vv0, vv0, vs8		# vv0 = (((i >> const4) & const6) * const7) >> const8
	vsd vv0, va3			# vv0 = tmp1[j]
	vstop
