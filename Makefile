SOURCE=mem_alloc.c
MYPROGRAM=mem_alloc
CC=gcc

all: $(MYPROGRAM)

$(MYPROGRAM): $(SOURCE)
	$(CC) $(SOURCE) -o $(MYPROGRAM) -Wall

clean:
	rm -f $(MYPROGRAM)



