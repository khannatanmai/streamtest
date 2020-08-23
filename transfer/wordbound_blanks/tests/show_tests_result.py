import sys

f1 = open(sys.argv[1]).readlines()
f2 = open(sys.argv[2]).readlines()

for i in range(0,len(f1)):
	if(f1[i].strip() == '' or f2[i].strip() == ''):
		continue
	else:
	 	print("\n\n***********\n\nlt-proc output:")

	 	print(f1[i])

	 	print("\n\npostchunk output:")
	 	print(f2[i])
