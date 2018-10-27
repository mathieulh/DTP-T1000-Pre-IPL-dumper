
#include <stdio.h>
#include <stdint.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <fcntl.h>

// old
// #define PROM_ADDR 0x1FC00000
// #define PROM_LEN (512 * 1024)

int main(int argc, const char **argv) {
	uint8_t *addr;
	if (argc != 4) {
		return -2;
	}
	const char *devname = argv[1];
	off_t dump_addr = (off_t)strtol(argv[2], NULL, 16);
	size_t dump_size = (size_t)strtol(argv[3], NULL, 16);
	printf("dev: %s dump_addr: 0x%08x dump_size: 0x%08x\n", devname, dump_addr, 
dump_size);
	int fd;
	ssize_t sz;
	if ((fd = open(devname, O_RDONLY | O_SYNC)) < 0 ) {
		printf("Error opening file. \n");
		close(fd);
		return -1;
	}
	addr = (uint8_t *)mmap(0, dump_size, PROT_READ, MAP_SHARED,
				fd, dump_addr);
	if (addr == (void*)-1) {
		perror("mmap");
		return -1;
	}
	sz = write(STDOUT_FILENO, addr, dump_size);
	assert(sz == dump_size);

	return 0;
}
