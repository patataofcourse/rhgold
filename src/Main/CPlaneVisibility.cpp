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

void CPlaneVisibility::update(void) {
    u16 *pal;
    GXPlaneMask plane;

    if (!mUpdate) {
        return;
    }

    if (mUnk0x0_bf2 || mFading) {
        pal = &mBgPalSub;
        plane = mPlaneSubScreen;
    } else {
        pal = &mBgPalMain;
        plane = mPlaneMainScreen;
    }

    if (!mIsSubEngine) {
        GX_SetVisiblePlane(plane);
        GX_LoadBGPltt(pal, 0, sizeof(*pal));
    } else {
        GXS_SetVisiblePlane(plane);
        GXS_LoadBGPltt(pal, 0, sizeof(*pal));
    }
}

void CPlaneVisibility::setUpdate(bool update) {
    mUpdate = update;
}

void CPlaneVisibility::disableBitfield2(void) {
    mUnk0x0_bf2 = false;
}

void CPlaneVisibility::enableBitfield2(void) {
    mUnk0x0_bf2 = true;
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

void CPlaneVisibility::setPalette(u16 *src, u32 offset, u32 size) {
    if (offset != 0) {
        if (!mIsSubEngine) {
            GX_LoadBGPltt(src, offset, size);
        } else {
            GXS_LoadBGPltt(src, offset, size);
        }
    } else {
        setPalMain(src[0]);
        if (size >= sizeof(*src)) {
            setPalette(&src[1], offset + sizeof(*src), size - sizeof(*src));
        }
    }
}

void CPlaneVisibility::setFading(bool fading) {
    mFading = fading;
}

bool CPlaneVisibility::getFading(void) {
    return mFading | mUnk0x0_bf2;
}
