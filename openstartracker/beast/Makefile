CC = g++

all: $(OBJ)
	swig -python -py3 -c++ beast.i
	$(CC) -g -std=c++11 -Ofast -fPIC -c beast_wrap.cxx -o beast_wrap.o -lstdc++ -I/usr/include/python3.6
	$(CC) -g -shared -fPIC beast_wrap.o -o _beast.so
	
clean:
	rm beast_wrap.cxx beast_wrap.o _beast.so beast.py
