include config.mk

OBJS = main.o buffer.o range.o command.o vars.o \
	util/list.o util/alloc.o util/io.o util/pipe.o util/str.o \
	gui/gui.o gui/motion.o gui/marks.o gui/base.o gui/intellisense.o \
	global.o rc.o preserve.o


uvi: ${OBJS} config.mk
	${LD} -o $@ ${OBJS} ${LDFLAGS}

%.o:%.c
	${CC} ${CFLAGS} -c -o $@ $<

clean:
	rm -f uvi `find -iname \*.o`

.PHONY: clean

# :r!for d in . util gui; do cc -MM $d/*.c | sed "s;^[^ \t];$d/&;"; done
./buffer.o: buffer.c util/alloc.h range.h buffer.h util/list.h util/io.h
./command.o: command.c range.h buffer.h command.h util/list.h vars.h \
 util/alloc.h util/pipe.h global.h gui/motion.h gui/intellisense.h \
 gui/gui.h util/io.h
./global.o: global.c range.h buffer.h global.h
./main.o: main.c main.h range.h buffer.h global.h gui/motion.h \
 gui/intellisense.h gui/gui.h rc.h command.h util/io.h preserve.h
./preserve.o: preserve.c range.h buffer.h preserve.h util/alloc.h
./range.o: range.c range.h
./rc.o: rc.c rc.h range.h buffer.h vars.h global.h util/io.h
./vars.o: vars.c util/alloc.h range.h buffer.h vars.h global.h gui/motion.h \
 gui/intellisense.h gui/gui.h
util/alloc.o: util/alloc.c util/alloc.h util/../main.h
util/io.o: util/io.c util/alloc.h util/../range.h util/../buffer.h util/io.h \
 util/../main.h util/../gui/motion.h util/../gui/intellisense.h \
 util/../gui/gui.h util/../util/list.h
util/list.o: util/list.c util/list.h util/alloc.h
util/pipe.o: util/pipe.c util/list.h util/io.h util/pipe.h util/alloc.h
util/str.o: util/str.c util/list.h util/str.h util/alloc.h
gui/base.o: gui/base.c gui/../range.h gui/../buffer.h gui/../command.h \
 gui/../util/list.h gui/../global.h gui/motion.h gui/../util/alloc.h \
 gui/intellisense.h gui/gui.h gui/marks.h gui/../main.h gui/../util/str.h
gui/gui.o: gui/gui.c gui/../range.h gui/../util/list.h gui/../buffer.h \
 gui/motion.h gui/intellisense.h gui/gui.h gui/../global.h \
 gui/../util/alloc.h
gui/intellisense.o: gui/intellisense.c gui/intellisense.h gui/../range.h \
 gui/../buffer.h gui/../global.h gui/../util/str.h gui/../util/list.h \
 gui/../util/alloc.h gui/motion.h gui/gui.h
gui/marks.o: gui/marks.c gui/marks.h
gui/motion.o: gui/motion.c gui/../range.h gui/../util/list.h gui/../buffer.h \
 gui/motion.h gui/intellisense.h gui/gui.h gui/marks.h gui/../global.h
