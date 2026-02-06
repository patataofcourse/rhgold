#ifndef _SYSTEM_CPLANEVISIBILITY_H_
#define _SYSTEM_CPLANEVISIBILITY_H_

#include <nitro.h>

class CPlaneVisibility {
public:
    CPlaneVisibility(bool isSub);

    void update();

    void setUpdate(bool update);
    void disableBitfield2();
    void enableBitfield2();
    void setFading(bool fading);
    bool getFading();

    void setPlaneMain(GXPlaneMask plane);
    void setPlaneSub(GXPlaneMask plane);

    void setPalMain(u16 palette);
    void setPalSub(u16 palette);
    void setPalette(u16* src, u32 offset, u32 size);

    
private:
    u32 mUpdate:1;
    u32 mIsSubEngine:1;
    u32 mUnk0x0_bf2:1;
    u32 mFading:1;
    GXPlaneMask mPlaneMainScreen;
    u16 mBgPalMain;
    GXPlaneMask mPlaneSubScreen;
    u16 mBgPalSub;
};

#endif
