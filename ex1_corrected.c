#include <ex2.h>

char string[6] = "Hello\n";

int main() {
    write(1, string, 6);
    return 0;
}
