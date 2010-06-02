PREFIX  = /usr
VERBOSE = 0

# gcc
CC			= gcc
LD			= gcc
CFLAGS	= -g -pipe -W -Wall -Wcast-align -Wcast-qual -Wshadow -Wnested-externs \
	-Waggregate-return -Wbad-function-cast -Wpointer-arith -Wcast-align \
	-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Winline \
	-Wredundant-decls -Wextra -pedantic -ansi

# tcc
#CFLAGS = -Wimplicit-function-declaration -Wunsupported -Wwrite-strings -Wall
