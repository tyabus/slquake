program_NAME := slquake
program_SRCS := $(wildcard src/*.c)
program_OBJS := ${program_SRCS:.c=.o}

CFLAGS := -O2 -funsafe-math-optimizations -funsafe-loop-optimizations -fomit-frame-pointer -Wall
LDFLAGS := -lX11 -lXext -lm

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
