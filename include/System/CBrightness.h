#ifndef _SYSTEM_CBRIGHTNESS_H_
#define _SYSTEM_CBRIGHTNESS_H_

#include "global.h"

class CBrightness {
public:
    void init(BOOL isSubScreen);
    void update(void);
    void set(s32 brightness);
    void setInc(s32 time);
    void setDec(s32 time);
    BOOL isUpdating(void);

protected:
    BOOL mIsSubScreen;
    fx32 mCurrentBrightness;
    u32 mSurfaceMask;
    BOOL mUpdateBrightness;
    BOOL mIncreaseBrightness;
    s32 mStepCount;

};

#endif