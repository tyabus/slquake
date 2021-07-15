program_NAME := slquake
program_SRCS := $(wildcard src/*.c)
program_OBJS := ${program_SRCS:.c=.o}

CFLAGS := -DSDL -pipe -Wall
LDFLAGS := -lm -lSDL

ifneq ($(DEBUG),1)
	CFLAGS += -O2 -funsafe-math-optimizations -funsafe-loop-optimizations -fomit-frame-pointer
else
	CFLAGS += -O0 -g -ggdb
endif

ifneq ($(64BIT),1)
	LDFLAGS += -m32
	CFLAGS += -m32
endif

.PHONY: all clean

all: $(program_NAME)

$(program_NAME): $(program_OBJS)
	$(CC) $(program_OBJS) -o $(program_NAME) $(LDFLAGS)

clean:
	@- $(RM) $(program_NAME)
	@- $(RM) $(program_OBJS)
