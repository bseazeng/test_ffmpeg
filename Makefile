.PHONY:all clean
TEST_SRC_FILE=test.c
TEST_OBJ=$(patsubst %.c,%.o,$(TEST_SRC_FILE))

INCLUDE=-I /home/zh/build/ffmpeg/build/include
LIB+=/home/zh/build/ffmpeg/build/lib/libavformat.a
LIB+=/home/zh/build/ffmpeg/build/lib/libavcodec.a
LIB+=/home/zh/build/ffmpeg/build/lib/libavfilter.a
LIB+=/home/zh/build/ffmpeg/build/lib/libavutil.a
LIB+=/home/zh/build/ffmpeg/build/lib/libswresample.a
LIB+=/home/zh/build/ffmpeg/build/lib/libavdevice.a
LIB+=/home/zh/build/ffmpeg/build/lib/libswscale.a
LIB+=-lpthread
LIB+=-lm
LIB+=-lz
LIB+=-llzma
all: test

%.o:%.c
	gcc $(INCLUDE) -c $< -o $@
test:$(TEST_OBJ)
	gcc $(TEST_OBJ) $(LIB) -o $@ 

clean:
	rm -rf $(TEST_OBJ) test
