include config.mk

VERBOSE ?= 0

ifeq (${VERBOSE},1)
	Q =
else
	Q = @
endif

OBJS = main.o term.o buffer.o range.o command.o vars.o \
	util/list.o util/alloc.o util/io.o util/pipe.o \
	ncurses/view.o ncurses/ncurses.o ncurses/motion.o \
	ncurses/marks.o


uvi: ${OBJS} config.mk
	@echo LD $@
	$Q${LD} -o $@ ${OBJS} ${LDFLAGS}

%.o:%.c
	@echo CC $@
	$Q${CC} ${CFLAGS} -c -o $@ $<


options:
	@echo "CC      = ${CC}"
	@echo "CFLAGS  = ${CFLAGS}"
	@echo "LDFLAGS = ${LDFLAGS}"
	@echo "PREFIX  = ${PREFIX}"

clean:
	${Q}rm -f *.o util/*.o ncurses/*.o uvi

.PHONY: clean options

buffer.o: buffer.c util/alloc.h range.h buffer.h util/list.h util/io.h \
 config.h
command.o: command.c config.h range.h buffer.h command.h util/list.h \
 vars.h util/alloc.h util/pipe.h
main.o: main.c term.h ncurses/ncurses.h range.h buffer.h command.h main.h \
 config.h util/alloc.h
range.o: range.c range.h
term.o: term.c util/list.h range.h buffer.h term.h command.h vars.h \
 util/alloc.h config.h
vars.o: vars.c config.h util/alloc.h range.h buffer.h vars.h
marks.o: ncurses/marks.c ncurses/marks.h
ncurses/motion.o: ncurses/motion.c ncurses/../util/list.h ncurses/../range.h \
 ncurses/../buffer.h ncurses/motion.h ncurses/marks.h
ncurses/ncurses.o: ncurses/ncurses.c ncurses/../config.h ncurses/../range.h \
 ncurses/../buffer.h ncurses/../command.h ncurses/../util/list.h \
 ncurses/../main.h ncurses/motion.h ncurses/view.h \
 ncurses/../util/alloc.h ncurses/../vars.h ncurses/marks.h \
 ncurses/ncurses.h
ncurses/view.o: ncurses/view.c ncurses/../util/list.h ncurses/../range.h \
 ncurses/../buffer.h ncurses/motion.h ncurses/view.h \
 ncurses/../util/alloc.h ncurses/../config.h
view_colourscreen.o: ncurses/view_colourscreen.c ncurses/../config.h \
 ncurses/../util/list.h ncurses/../range.h ncurses/../buffer.h \
 ncurses/view.h ncurses/../util/alloc.h
alloc.o: util/alloc.c util/alloc.h
io.o: util/io.c util/alloc.h util/io.h
list.o: util/list.c util/list.h util/alloc.h
pipe.o: util/pipe.c util/list.h util/io.h util/pipe.h util/alloc.h
