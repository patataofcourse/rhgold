#ifndef NITRO_HW_MMAP_TCM_H_
#define NITRO_HW_MMAP_TCM_H_

#ifdef __cplusplus
extern "C" {
#endif


//----------------------------------------------------------------------
//  size definition in DTCM
//----------------------------------------------------------------------
//---- stack size
#define HW_SYS_AND_IRQ_STACK_SIZE_MAX   (HW_DTCM_SIZE - HW_SVC_STACK_SIZE - HW_DTCM_SYSRV_SIZE)
#define HW_SVC_STACK_SIZE               0x40

//---- system reserved size
#define HW_DTCM_SYSRV_SIZE              0x40


//----------------------------------------------------------------------
//  structure of DTCM
//----------------------------------------------------------------------
#ifndef SDK_ASM
#include <nitro/types.h>

typedef volatile struct
{
    //---- stack/heap area
    u8      sys_and_irq_stack[HW_SYS_AND_IRQ_STACK_SIZE_MAX];   // 0000-3f80 system & irq stack
    u8      svc_stack[HW_SVC_STACK_SIZE];       // 3f80-3fbf svc stack

    //---- system reserved area
    u8      reserved[HW_DTCM_SYSRV_SIZE - 8];   // 3fc0-3ff7 ????
    u32     intr_check;                // 3ff8-3ffb intr_check for svc
    void   *intr_vector;               // 3ffc-3fff intr handler

}
OS_DTCM;
#endif

//----------------------------------------------------------------------
//  other definition
//----------------------------------------------------------------------
//---- stack address ( for initial stack pointer )
#define HW_DTCM_SYS_STACK_DEFAULT       (HW_DTCM)
#define HW_DTCM_IRQ_STACK_END           (HW_DTCM_SVC_STACK)
#define HW_DTCM_SVC_STACK               (HW_DTCM_SVC_STACK_END - HW_SVC_STACK_SIZE)
#define HW_DTCM_SVC_STACK_END           (HW_DTCM + 0x00003fc0)

//---- offset in system reserved area
#define HW_DTCM_SYSRV_OFS_DEBUGGER      0x00
#define HW_DTCM_SYSRV_OFS_EXCP_VECTOR   0x1c
#define HW_DTCM_SYSRV_OFS_RESERVED      0x20
#define HW_DTCM_SYSRV_OFS_INTR_CHECK    0x38
#define HW_DTCM_SYSRV_OFS_INTR_VECTOR   0x3c

//---- system reserved area
#define HW_DTCM_SYSRV                   (HW_DTCM + 0x00003fc0)
#define HW_EXCP_VECTOR_BUF              (HW_DTCM_SYSRV + HW_DTCM_SYSRV_OFS_EXCP_VECTOR)
#define HW_INTR_CHECK_BUF               (HW_DTCM_SYSRV + HW_DTCM_SYSRV_OFS_INTR_CHECK)
#define HW_INTR_VECTOR_BUF              (HW_DTCM_SYSRV + HW_DTCM_SYSRV_OFS_INTR_VECTOR)

#ifdef  SDK_CWBUG_VSNPRINTF
// workaround until vsnprintf supports anti-strb
// allocate DTCM for string buffer
#define HW_DTCM_STRING_SIZE             256
#define HW_DTCM_STRING                  HW_DTCM
#endif

//----------------------------------------------------------------------
//  definition for Arena
//----------------------------------------------------------------------
//---- default address for DTCM Arena
#define HW_DTCM_ARENA_LO_DEFAULT        HW_DTCM
#define HW_DTCM_ARENA_HI_DEFAULT        HW_DTCM

//---- default address for ITCM Arena
#define HW_ITCM_ARENA_LO_DEFAULT        HW_ITCM
#define HW_ITCM_ARENA_HI_DEFAULT        HW_ITCM_END


#ifdef __cplusplus
} /* extern "C" */
#endif
/* NITRO_HW_MMAP_TCM_H_ */
#endif
