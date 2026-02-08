#include "global.h"
#include "unk_funcs.h"

#include <nitro.h>

#include "System/CPlaneVisibility.h"

CPlaneVisibility::CPlaneVisibility(bool isSub) {
    mUpdate = false;
    mIsSubEngine = isSub;
    mUnk0x0_bf2 = false;
    mFading = false;
    mPlaneMainScreen = mPlaneSubScreen = GX_PLANEMASK_NONE;
    mBgPalSub = 0;
    mBgPalMain = 0;
}

void CPlaneVisibility::update() {
    u16 *tmp1;
    GXPlaneMask tmp2;
    if (!mUpdate) return;

    if (mUnk0x0_bf2 || mFading) {
        tmp1 = &mBgPalSub;
        tmp2 = mPlaneSubScreen;
    } else {
        tmp1 = &mBgPalMain;
        tmp2 = mPlaneMainScreen;
    }

    if (!mIsSubEngine) {
        GX_SetVisiblePlane(tmp2);
        func_0202eff0(tmp1, 0, 2);
    } else {
        GXS_SetVisiblePlane(tmp2);
        func_0202f044(tmp1, 0, 2);
    }
}

void CPlaneVisibility::setUpdate(bool update) {
    mUpdate = update;
}

void CPlaneVisibility::disableBitfield2() {
    mUnk0x0_bf2 = 0;
}

void CPlaneVisibility::enableBitfield2() {
    mUnk0x0_bf2 = 1;
}

void CPlaneVisibility::setPlaneMain(GXPlaneMask plane) {
    mPlaneMainScreen = plane;
}

void CPlaneVisibility::setPlaneSub(GXPlaneMask plane) {
    mPlaneSubScreen = plane;
}

void CPlaneVisibility::setPalMain(u16 palette) {
    mBgPalMain = palette;
}

void CPlaneVisibility::setPalSub(u16 palette) {
    mBgPalSub = palette;
}

void CPlaneVisibility::setPalette(u16* src, u32 offset, u32 size) {
    if (offset != 0) {
        if (!mIsSubEngine) {
            func_0202eff0(src, offset, size);
        } else {
            func_0202f044(src, offset, size);
        }
    } else {
        setPalMain(src[0]);
        if (size >= 2)
            setPalette(&src[1],offset+2, size-2);
    }
}

void CPlaneVisibility::setFading(bool fading) {
    mFading = fading;
}

bool CPlaneVisibility::getFading() {
    return mFading | mUnk0x0_bf2;
}
