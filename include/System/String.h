#ifndef _SYSTEM_STRING_H_
#define _SYSTEM_STRING_H_

#include "global.h"

extern char *strCopy(char *dest, char *src);
extern char *strCopyN(char *dest, char *src, int n);
extern char *strCat(char *dest, char *src);
extern char *strGetDec(char *dest, int n);
extern int strLen(char *str);
extern BOOL strCmpN(char *str1, char *str2, int n);
extern char *strStr(char *str, char *substr);
extern void str020016f4(char *dest, char *arg1, char *arg2, char *src, int arg4);

#endif
