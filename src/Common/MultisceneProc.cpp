#include "global.h"
#include "unk_funcs.h"

#include <nitro.h>

#include "System/CPlaneVisibility.h"

#include "Common/MultisceneProc.h"

extern CPlaneVisibility data_02053620;
extern CPlaneVisibility data_02053634;
extern int data_0205357c;

CMultisceneProc::CMultisceneProc(int a) : CProc(a) {
    func_0200c70c(&mUnk0x178);
    func_0200dc44(&mUnkStruct0x8d8[0]);
    func_0200dc44(&mUnkStruct0x8d8[1]);
    mUnk0x8d4 = 0;
    func_02009d98(1, 1);
    func_0200b9a0(1);
    func_0200b3f0(this);
    func_02008aec(1);
    func_ov000_02280630();

    data_02053620.setUpdate(true);
    data_02053620.setPlaneSub(GX_PLANEMASK_OBJ);
    data_02053620.setPalSub(0);
    data_02053620.enableBitfield2();
    func_0200b33c(0, 1);

    data_02053634.setUpdate(true);
    data_02053634.setPlaneSub(GX_PLANEMASK_OBJ);
    data_02053634.setPalSub(0);
    data_02053634.enableBitfield2();
    func_0200b33c(1, 1);

    mUnk0x128 = func_0200c684(data_0205357c);
    mUnk0x98 = 0;
    mUnk0x9c = -1;
    mUnk0xa0 = 0;
    mUnk0x10c = -1;

    CSub0xa4 *sub = new CSub0xa4(this);
    mUnk0xa4 = sub;
    mTickFlowId_ = mTickFlowId;
}