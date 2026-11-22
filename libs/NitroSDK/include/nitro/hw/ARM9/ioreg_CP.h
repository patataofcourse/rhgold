//
//  I was generated automatically, don't edit me directly!!!
//
#ifndef NITRO_HW_ARM9_IOREG_CP_H_
#define NITRO_HW_ARM9_IOREG_CP_H_

#ifndef SDK_ASM
#include <nitro/types.h>
#include <nitro/hw/ARM9/mmap_global.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Definition of Register offsets, addresses and variables.
 */


/* DIVCNT */

#define REG_DIVCNT_OFFSET                                  0x280
#define REG_DIVCNT_ADDR                                    (HW_REG_BASE + REG_DIVCNT_OFFSET)
#define reg_CP_DIVCNT                                      (*( REGType16v *) REG_DIVCNT_ADDR)

/* DIV_NUMER */

#define REG_DIV_NUMER_OFFSET                               0x290
#define REG_DIV_NUMER_ADDR                                 (HW_REG_BASE + REG_DIV_NUMER_OFFSET)
#define reg_CP_DIV_NUMER                                   (*( REGType64v *) REG_DIV_NUMER_ADDR)

/* DIV_NUMER_L */

#define REG_DIV_NUMER_L_OFFSET                             0x290
#define REG_DIV_NUMER_L_ADDR                               (HW_REG_BASE + REG_DIV_NUMER_L_OFFSET)
#define reg_CP_DIV_NUMER_L                                 (*( REGType32v *) REG_DIV_NUMER_L_ADDR)

/* DIV_NUMER_H */

#define REG_DIV_NUMER_H_OFFSET                             0x294
#define REG_DIV_NUMER_H_ADDR                               (HW_REG_BASE + REG_DIV_NUMER_H_OFFSET)
#define reg_CP_DIV_NUMER_H                                 (*( REGType32v *) REG_DIV_NUMER_H_ADDR)

/* DIV_DENOM */

#define REG_DIV_DENOM_OFFSET                               0x298
#define REG_DIV_DENOM_ADDR                                 (HW_REG_BASE + REG_DIV_DENOM_OFFSET)
#define reg_CP_DIV_DENOM                                   (*( REGType64v *) REG_DIV_DENOM_ADDR)

/* DIV_DENOM_L */

#define REG_DIV_DENOM_L_OFFSET                             0x298
#define REG_DIV_DENOM_L_ADDR                               (HW_REG_BASE + REG_DIV_DENOM_L_OFFSET)
#define reg_CP_DIV_DENOM_L                                 (*( REGType32v *) REG_DIV_DENOM_L_ADDR)

/* DIV_DENOM_H */

#define REG_DIV_DENOM_H_OFFSET                             0x29c
#define REG_DIV_DENOM_H_ADDR                               (HW_REG_BASE + REG_DIV_DENOM_H_OFFSET)
#define reg_CP_DIV_DENOM_H                                 (*( REGType32v *) REG_DIV_DENOM_H_ADDR)

/* DIV_RESULT */

#define REG_DIV_RESULT_OFFSET                              0x2a0
#define REG_DIV_RESULT_ADDR                                (HW_REG_BASE + REG_DIV_RESULT_OFFSET)
#define reg_CP_DIV_RESULT                                  (*( REGType64v *) REG_DIV_RESULT_ADDR)

/* DIV_RESULT_L */

#define REG_DIV_RESULT_L_OFFSET                            0x2a0
#define REG_DIV_RESULT_L_ADDR                              (HW_REG_BASE + REG_DIV_RESULT_L_OFFSET)
#define reg_CP_DIV_RESULT_L                                (*( REGType32v *) REG_DIV_RESULT_L_ADDR)

/* DIV_RESULT_H */

#define REG_DIV_RESULT_H_OFFSET                            0x2a4
#define REG_DIV_RESULT_H_ADDR                              (HW_REG_BASE + REG_DIV_RESULT_H_OFFSET)
#define reg_CP_DIV_RESULT_H                                (*( REGType32v *) REG_DIV_RESULT_H_ADDR)

/* DIVREM_RESULT */

#define REG_DIVREM_RESULT_OFFSET                           0x2a8
#define REG_DIVREM_RESULT_ADDR                             (HW_REG_BASE + REG_DIVREM_RESULT_OFFSET)
#define reg_CP_DIVREM_RESULT                               (*( REGType64v *) REG_DIVREM_RESULT_ADDR)

/* DIVREM_RESULT_L */

#define REG_DIVREM_RESULT_L_OFFSET                         0x2a8
#define REG_DIVREM_RESULT_L_ADDR                           (HW_REG_BASE + REG_DIVREM_RESULT_L_OFFSET)
#define reg_CP_DIVREM_RESULT_L                             (*( REGType32v *) REG_DIVREM_RESULT_L_ADDR)

/* DIVREM_RESULT_H */

#define REG_DIVREM_RESULT_H_OFFSET                         0x2ac
#define REG_DIVREM_RESULT_H_ADDR                           (HW_REG_BASE + REG_DIVREM_RESULT_H_OFFSET)
#define reg_CP_DIVREM_RESULT_H                             (*( REGType32v *) REG_DIVREM_RESULT_H_ADDR)

/* SQRTCNT */

#define REG_SQRTCNT_OFFSET                                 0x2b0
#define REG_SQRTCNT_ADDR                                   (HW_REG_BASE + REG_SQRTCNT_OFFSET)
#define reg_CP_SQRTCNT                                     (*( REGType16v *) REG_SQRTCNT_ADDR)

/* SQRT_RESULT */

#define REG_SQRT_RESULT_OFFSET                             0x2b4
#define REG_SQRT_RESULT_ADDR                               (HW_REG_BASE + REG_SQRT_RESULT_OFFSET)
#define reg_CP_SQRT_RESULT                                 (*( REGType32v *) REG_SQRT_RESULT_ADDR)

/* SQRT_PARAM */

#define REG_SQRT_PARAM_OFFSET                              0x2b8
#define REG_SQRT_PARAM_ADDR                                (HW_REG_BASE + REG_SQRT_PARAM_OFFSET)
#define reg_CP_SQRT_PARAM                                  (*( REGType64v *) REG_SQRT_PARAM_ADDR)

/* SQRT_PARAM_L */

#define REG_SQRT_PARAM_L_OFFSET                            0x2b8
#define REG_SQRT_PARAM_L_ADDR                              (HW_REG_BASE + REG_SQRT_PARAM_L_OFFSET)
#define reg_CP_SQRT_PARAM_L                                (*( REGType32v *) REG_SQRT_PARAM_L_ADDR)

/* SQRT_PARAM_H */

#define REG_SQRT_PARAM_H_OFFSET                            0x2bc
#define REG_SQRT_PARAM_H_ADDR                              (HW_REG_BASE + REG_SQRT_PARAM_H_OFFSET)
#define reg_CP_SQRT_PARAM_H                                (*( REGType32v *) REG_SQRT_PARAM_H_ADDR)


/*
 * Definitions of Register fields
 */


/* DIVCNT */

#define REG_CP_DIVCNT_BUSY_SHIFT                           15
#define REG_CP_DIVCNT_BUSY_SIZE                            1
#define REG_CP_DIVCNT_BUSY_MASK                            0x8000

#define REG_CP_DIVCNT_DIV0_SHIFT                           14
#define REG_CP_DIVCNT_DIV0_SIZE                            1
#define REG_CP_DIVCNT_DIV0_MASK                            0x4000

#define REG_CP_DIVCNT_MODE_SHIFT                           0
#define REG_CP_DIVCNT_MODE_SIZE                            2
#define REG_CP_DIVCNT_MODE_MASK                            0x0003

#ifndef SDK_ASM
#define REG_CP_DIVCNT_FIELD( busy, div0, mode ) \
    (u16)( \
    ((u32)(busy) << REG_CP_DIVCNT_BUSY_SHIFT) | \
    ((u32)(div0) << REG_CP_DIVCNT_DIV0_SHIFT) | \
    ((u32)(mode) << REG_CP_DIVCNT_MODE_SHIFT))
#endif


/* DIV_NUMER */

/* DIV_NUMER_L */

/* DIV_NUMER_H */

/* DIV_DENOM */

/* DIV_DENOM_L */

/* DIV_DENOM_H */

/* DIV_RESULT */

/* DIV_RESULT_L */

/* DIV_RESULT_H */

/* DIVREM_RESULT */

/* DIVREM_RESULT_L */

/* DIVREM_RESULT_H */

/* SQRTCNT */

#define REG_CP_SQRTCNT_BUSY_SHIFT                          15
#define REG_CP_SQRTCNT_BUSY_SIZE                           1
#define REG_CP_SQRTCNT_BUSY_MASK                           0x8000

#define REG_CP_SQRTCNT_MODE_SHIFT                          0
#define REG_CP_SQRTCNT_MODE_SIZE                           1
#define REG_CP_SQRTCNT_MODE_MASK                           0x0001

#ifndef SDK_ASM
#define REG_CP_SQRTCNT_FIELD( busy, mode ) \
    (u16)( \
    ((u32)(busy) << REG_CP_SQRTCNT_BUSY_SHIFT) | \
    ((u32)(mode) << REG_CP_SQRTCNT_MODE_SHIFT))
#endif


/* SQRT_RESULT */

/* SQRT_PARAM */

/* SQRT_PARAM_L */

/* SQRT_PARAM_H */

#ifdef __cplusplus
} /* extern "C" */
#endif

/* NITRO_HW_ARM9_IOREG_CP_H_ */
#endif
