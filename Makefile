program_NAME := x11quake
program_SRCS := $(wildcard src/*.c)
program_OBJS := ${program_SRCS:.c=.o}
program_LIBRARIES := X11 Xext m

CFLAGS := -Wall -m32 -O2

LDFLAGS += -lX11 -lXext -lm -m32

.PHONY: all clean

all: $(program_NAME)

$(program_NAME): $(program_OBJS)
	$(CC) $(program_OBJS) -o $(program_NAME) $(LDFLAGS)

clean:
	@- $(RM) $(program_NAME)
	@- $(RM) $(program_OBJS)
