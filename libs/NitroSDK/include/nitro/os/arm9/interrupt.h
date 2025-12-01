#ifndef _OS_INTERRUPT_H
#define _OS_INTERRUPT_H

typedef int OSIntrMode;

OSIntrMode OS_EnableInterrupts(void);
OSIntrMode OS_DisableInterrupts(void);
OSIntrMode OS_RestoreInterrupts(OSIntrMode);

#endif 