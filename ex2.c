#include <unistd.h>
#include <sys/syscall.h>

extern ssize_t write(int file_descriptor, const void *buffer, size_t buffer_size) {
    
    syscall(SYS_write, file_descriptor, buffer, buffer_size);
    
    return 0;
}
