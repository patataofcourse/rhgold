#ifndef _SYSTEM_CBRIGHTNESS_H_
#define _SYSTEM_CBRIGHTNESS_H_

#include <nitro.h>

typedef struct {
    int mIsSubScreen;
    int mCurrentBrightness;
    int mSurfaceMask;
    BOOL mUpdateBrightness;
    BOOL mIncreaseBrightness;
    int mStepCount; // ?
} CBrightness;

#endif