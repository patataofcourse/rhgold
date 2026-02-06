#include "global.h"

#include <nitro/hw/io_reg.h>

#include "System/CBrightness.h"

void CBrightness_init(CBrightness *this, BOOL isSubScreen) {
    this->mIsSubScreen = isSubScreen;
    this->mCurrentBrightness = 0;
    this->mSurfaceMask = 0x3f;
    this->mUpdateBrightness = FALSE;
}

void CBrightness_update(CBrightness* this) {
    int targetBright;

    if (this->mUpdateBrightness) {
        if (this->mIncreaseBrightness) {
            this->mCurrentBrightness += this->mStepCount;
            if (this->mCurrentBrightness >= 0) {
                this->mUpdateBrightness = FALSE;
            }
        } else {
            this->mCurrentBrightness -= this->mStepCount;
            if (this->mCurrentBrightness < -0x10000) {
                this->mUpdateBrightness = FALSE;
            }
        }
    }

    if (this->mCurrentBrightness > 0) {
        targetBright = 0;
    } else if (this->mCurrentBrightness < -0x10000) {
        targetBright = -0x10000;
    } else {
        targetBright = this->mCurrentBrightness;
    }

    this->mCurrentBrightness = targetBright;

    if (this->mIsSubScreen) {
        G2S_SetBlendBrightness(this->mSurfaceMask, this->mCurrentBrightness >> 12);
    } else {
        G2_SetBlendBrightness(this->mSurfaceMask, this->mCurrentBrightness >> 12);
    }

}

void CBrightness_set(CBrightness* this, int brightness) {
    this->mCurrentBrightness = brightness << 12;
    this->mUpdateBrightness = FALSE;
}

void CBrightness_setInc(CBrightness* this, int time) {
    if (time == 0) {
        CBrightness_set(this, 0);
    } else {
        this->mCurrentBrightness = -0x10000;
        this->mUpdateBrightness = TRUE;
        this->mIncreaseBrightness = TRUE;
        this->mStepCount = 0x10000 / time;
    }
}

void CBrightness_setDec(CBrightness* this, int time) {
    if (time == 0) {
        CBrightness_set(this, -0x10);
    } else {
        this->mCurrentBrightness = 0;
        this->mUpdateBrightness = TRUE;
        this->mIncreaseBrightness = FALSE;
        this->mStepCount = 0x10000 / time;
    }
}
BOOL CBrightness_isUpdating(CBrightness* this) {
    return this->mUpdateBrightness;
}