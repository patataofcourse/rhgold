#include "Main/String.h"
#include <string.h>

char *strCopy(char *dest, char *src) {
    char *tmp = dest;
    while (*src) {
        *dest++ = *src++;
    }
    *dest = '\0';
    return tmp;
}

char *strCopyN(char *dest, char *src, int n) {
    char *tmp = dest;
    while (*src) {
        n--;
        *dest++ = *src++;
        if (n <= 0) {
            break;
        }
    }
    *dest = '\0';
    return tmp;
}

char *strCat(char *dest, char *src) {
    char *tmp = dest;
    while (*dest) {
        dest++;
    }
    while (*src) {
        *dest++ = *src++;
    }
    *dest = '\0';
    return tmp;
}

char *strCopyDec(char *dest, char *src) {
    return std::strcpy(dest, src);
}

char *strGetDec(char *dest, int n) {
    char tmp[100];
    OS_SNPrintf(tmp, NELEMU(tmp), "%d", n);
    return strCopyDec(dest, tmp);
}

int strLen(char *str) {
    int i = 0;
    if (!str) {
        return i;
    }
    while (str[i]) {
        i++;
    }
    return i;
}

BOOL strCmpN(char *str1, char *str2, int n) {
    while (*str1 == *str2) {
        n--;
        if (n == 0) {
            return FALSE;
        }
        if ((*str1 == '\0') && (*str2 == '\0')) {
            return FALSE;
        }
        str2++;
        str1++;
    }
    return TRUE;
}

char *strStr(char *str, char *substr) {
    int subLen = strLen(substr);
    while (*str) {
        if (!strCmpN(str, substr, subLen)) {
            return str;
        }
        str++;
    }
    return NULL;
}

void strReplace(char *dest, char *src, char *substr, char *substrRep, int len) {
    int subLen = strLen(substr);
    int subRepLen = strLen(substrRep);
    len--;

    while (*src) {
        if (strCmpN(src, substr, subLen)) {
            *dest++ = *src++;
            len--;
        } else {
            for (int i = 0; i < subRepLen; i++) {
                dest[i] = substrRep[i];
            }
            dest += subRepLen;
            src += subLen;
            len -= subRepLen;
        }
        if (len < 0) {
            OS_Panic("");
        }
    }
    *dest = '\0';
}
