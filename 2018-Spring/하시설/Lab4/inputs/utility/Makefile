cc = gcc
target1 = converter
target2 = generator

csrcs1 = converter.c
cobjs1 = $(csrcs1:.c=.o)

csrcs2 = generator.c
cobjs2 = $(csrcs2:.c=.o)

cflags = -Wall -Werror -std=c99
ldflags = 

all : $(target1) $(target2)

$(target1):	$(cobjs1)
		$(cc) $(cobjs1) $(ldflags) -o $(target1)

$(target2):	$(cobjs2)
		$(cc) $(cobjs2) $(ldflags) -o $(target2)

.c.o:
	$(cc) $(cflags) -c $< -o $@

clean:
	rm -f $(cobjs1) $(cobjs2) $(target1) $(target2)
