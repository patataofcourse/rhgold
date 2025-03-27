#include "System/String.h"
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

void str020016f4(char *dest, char *arg1, char *arg2, char *src, int arg4) {
    int arg2Len = strLen(arg2);
    int srcLen = strLen(src);
    arg4--;

    while (*arg1) {
        if (strCmpN(arg1, arg2, arg2Len)) {
            *dest++ = *arg1++;
            arg4--;
        } else {
            for (int i = 0; i < srcLen; i++) {
                dest[i] = src[i];
            }
            dest += srcLen;
            arg1 += arg2Len;
            arg4 -= srcLen;
        }
        if (arg4 < 0) {
            OS_Panic("");
        }
    }
    *dest = '\0';
}
