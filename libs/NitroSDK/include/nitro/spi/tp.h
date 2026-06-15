#ifndef _NITRO_TP_H_
#define _NITRO_TP_H_

#include "global.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
	TP_REQUEST_COMMAND_SAMPLING         = 0x0,
	TP_REQUEST_COMMAND_AUTO_ON          = 0x1,
	TP_REQUEST_COMMAND_AUTO_OFF         = 0x2,
	TP_REQUEST_COMMAND_SET_STABILITY    = 0x3,
	TP_REQUEST_COMMAND_AUTO_SAMPLING    = 0x10
} TPRequestCommand;

typedef enum {
	TP_RESULT_SUCCESS = 0,
	TP_RESULT_INVALID_PARAMETER,
	TP_RESULT_ILLEGAL_STATUS,
	TP_RESULT_EXCLUSIVE,
	TP_RESULT_PXI_BUSY
} TPRequestResult;

#define TP_VALIDITY_VALID           0
#define TP_VALIDITY_INVALID_X       1
#define TP_VALIDITY_INVALID_Y       2
#define TP_VALIDITY_INVALID_XY      (TP_VALIDITY_INVALID_X | TP_VALIDITY_INVALID_Y)

typedef void (*TouchPadCallback)(TPRequestCommand, TPRequestResult, u16);

typedef struct TPData {
    u16 x;
    u16 y;
    u16 touch;
    u16 validity;
} TPData;

typedef struct NvTpData {
	s16 x0;
	s16 y0;
	s16 xDotSize;
	s16 yDotSize;
} TPCalibrateParam;

typedef struct TouchPad {
    u16 mUnk0x0; // initialized state?
    TouchPadCallback mCallback;
    TPData mUnk0x8;
    u16 mUnk0x10;
    TPData *mUnk0x14;
    u16 mUnk0x18; // maximum for mUnk0x10?
    u32 mUnk0x1c;
    u32 mUnk0x20;
    u32 mUnk0x24;
    u32 mUnk0x28;
    u32 mUnk0x2c;
    u32 mUnk0x30;
    u16 mUnk0x34;
    u16 mUnk0x36;
    u16 mErrorFlags;
    u16 mBusyFlags;
} TouchPad;

void TP_Init(void);
BOOL TP_GetUserInfo(TPCalibrateParam *arg0);
void TP_SetCalibrateParam(TPCalibrateParam *arg0);
void TP_SetCallback(void *callback);
BOOL TP_RequestAutoSamplingStart(u32 param_1,u32 param_2,TPData[8],u32 param_4);
int TP_CalcCalibrateParam(TPCalibrateParam *arg0, u16 arg1, u16 arg2, u16 arg3, u16 arg4, u16 arg5, u16 arg6, u16 arg7, u16 arg8);
void TP_GetCalibratedPoint(TPData * disp, const TPData * raw);
void TP_WaitBusy(u16 bitMask);
u32 TP_CheckError(u16 bitMask);

#ifdef __cplusplus
};
#endif

#endif
