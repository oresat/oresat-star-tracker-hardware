testsrc=testprucam.c camera-i2c.c qdbmp.c
TESTOUT=test_camera
CCFLAGS="-D_GNU_SOURCE" # for test, get rid of

all: 
	$(CC) $(CCFLAGS) $(testsrc) -o $(TESTOUT)

clean:
	rm -f $(TESTOUT)
	rm -f capture*
