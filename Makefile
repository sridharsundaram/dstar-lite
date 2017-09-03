FLAGS=-O2
#DEFS= -D USE_OPEN_GL -D MACOS
DEFS= -D USE_OPEN_GL

#LIBS= -framework OpenGL -framework GLUT -lm -L/usr/local/lib -L"/C/Program Files/Common Files/MinGW/freeglut/lib"
LIBS= -L/usr/local/lib -L"/C/Program Files/Common Files/MinGW/freeglut/lib/x64" -lfreeglut -lopengl32 -Wl,--subsystem,windows -lm
INCLUDE="/C/Program Files/Common Files/MinGW/freeglut/include"
UNAME= $(shell uname)
ifeq ($(UNAME), Linux)
LIBS= -lGL -lGLU -lglut
DEFS= -D USE_OPEN_GL
endif


all:dstar

dstar: Dstar.h Dstar.cpp DstarDraw.cpp
	g++ ${FLAGS} Dstar.cpp DstarDraw.cpp -I${INCLUDE} -o dstar ${LIBS} ${DEFS}

clean:
	rm -f dstar