# Examples on the use of the futex syscall.

CC = gcc
CCFLAGS = -std=gnu99 -Wall -O3 -g -DNDEBUG -pthread

LDFLAGS = -lpthread


EXECUTABLES = \
	basic_process \
	basic_thread \
	wait_timeout \

all: $(EXECUTABLES)

basic_process: basic_process.c
	$(CC) $(CCFLAGS) $^ -o $@ $(LDFLAGS)

basic_thread: basic_thread.c
	$(CC) $(CCFLAGS) $^ -o $@ $(LDFLAGS)

wait_timeout: wait_timeout.c
	$(CC) $(CCFLAGS) $^ -o $@ $(LDFLAGS)

.PHONY: clean format

clean:
	rm -f $(EXECUTABLES) *.o

format:
	clang-format -style=file -i *.c