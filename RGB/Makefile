all: compare name

compare: compare.s
	gcc -gstabs -o compare compare.s

name: name.s
	gcc -gstabs -o name name.s

clean:
	@rm -f compare name total.out total.txt ./tests/test1.out ./tests/test2.out ./tests/test3.out ./tests/test4.out ./tests/test5.out ./tests/test6.out ./tests/test7.out diff.out