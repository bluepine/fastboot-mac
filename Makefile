OBJ := adler32.o crc32.o inffast.o   protocol.o  usb_osx.o zipfile.o bootimg.o engine.o    inflate.o util_osx.o  zutil.o centraldir.o  fastboot.o  inftrees.o    

LDLIBS += -lpthread -framework CoreFoundation -framework IOKit -framework Carbon -lz
DEPS = bootimg.h
INC = -I.
%.o: %.c $(DEPS)
	gcc -c -o $@ $< $(CFLAGS) $(INC)

all: $(OBJ)
	gcc -o fastboot $^ $(CFLAGS) $(LDLIBS)

clean: 
	rm -f *.o fastboot
