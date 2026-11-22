#include "global.h"

#include "System/CBrightness.h"

void CBrightness::init(BOOL isSubScreen) {
    mIsSubScreen = isSubScreen;
    mCurrentBrightness = 0;
    mSurfaceMask = GX_BLEND_PLANEMASK_BG0 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 |
                   GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_OBJ | GX_BLEND_PLANEMASK_BD;
    mUpdateBrightness = FALSE;
}

void CBrightness::update(void) {
    fx32 targetBright;

    if (mUpdateBrightness) {
        if (mIncreaseBrightness) {
            mCurrentBrightness += mStepCount;
            if (mCurrentBrightness >= 0) {
                mUpdateBrightness = FALSE;
            }
        } else {
            mCurrentBrightness -= mStepCount;
            if (mCurrentBrightness < FX32_CONST(-16.0)) {
                mUpdateBrightness = FALSE;
            }
        }
    }

    if (mCurrentBrightness > 0) {
        targetBright = 0;
    } else if (mCurrentBrightness < FX32_CONST(-16.0)) {
        targetBright = FX32_CONST(-16.0);
    } else {
        targetBright = mCurrentBrightness;
    }

    mCurrentBrightness = targetBright;

    if (mIsSubScreen) {
        G2S_SetBlendBrightness(mSurfaceMask, FX_Whole(mCurrentBrightness));
    } else {
        G2_SetBlendBrightness(mSurfaceMask, FX_Whole(mCurrentBrightness));
    }

}

void CBrightness::set(s32 brightness) {
    mCurrentBrightness = TOFX32(brightness);
    mUpdateBrightness = FALSE;
}

void CBrightness::setInc(s32 time) {
    if (time == 0) {
        set(0);
    } else {
        mCurrentBrightness = FX32_CONST(-16.0);
        mUpdateBrightness = TRUE;
        mIncreaseBrightness = TRUE;
        mStepCount = FX32_CONST(16.0) / time;
    }
}

void CBrightness::setDec(s32 time) {
    if (time == 0) {
        set(-16);
    } else {
        mCurrentBrightness = FX32_CONST(0.0);
        mUpdateBrightness = TRUE;
        mIncreaseBrightness = FALSE;
        mStepCount = FX32_CONST(16.0) / time;
    }
}
BOOL CBrightness::isUpdating(void) {
    return mUpdateBrightness;
}