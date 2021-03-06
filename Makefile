# compiler flags
CCFLAGS := -O2 -flto
DEBUGFLAGS = -DDEBUG -fsanitize=address -ggdb

# object files
OBJ := src/main.o

.PHONY: all
all: lambda
debug: CCFLAGS += $(DEBUGFLAGS)
debug: lambda

lambda: $(OBJ)
	$(CC) $(CCFLAGS) $(OBJ) -o $@

%.o: %.c
	$(CC) $(CCFLAGS) -c $^ -o $@

.PHONY: clean
clean:
	find -name "*.o" -delete
	rm -f -- lambda debug

