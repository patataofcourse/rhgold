#include "System/String.h"

char *strCopy(char *dest,  char *src) {
    char *tmp = dest;
    while (*src) {
        *dest++ = *src++;
    }
    *dest = '\0';
    return tmp;
}

