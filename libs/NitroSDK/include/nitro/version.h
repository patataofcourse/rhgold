#ifndef NITROSDK_VERSION_H_
#define NITROSDK_VERSION_H_

#define SDK_VERSION_DATE        20080118
#define SDK_VERSION_TIME        1051
#define SDK_VERSION_MAJOR       4
#define SDK_VERSION_MINOR       2
#ifdef SDK_PATCH3
#define SDK_VERSION_RELSTEP     30003
#else
#define SDK_VERSION_RELSTEP     30001
#endif
#define SDK_BUILDVER_CW_CC      3.0
#define SDK_BUILDVER_CW_LD      2.0
#define SDK_BUILDNUM_CW_CC      127
#define SDK_BUILDNUM_CW_LD      85

#ifndef SDK_VERSION_NUMBER
    #define SDK_VERSION_NUMBER(major, minor, relstep) \
	    (((major) << 24) | ((minor) << 16) | ((relstep) << 0))

    #define SDK_CURRENT_VERSION_NUMBER \
	    SDK_VERSION_NUMBER(SDK_VERSION_MAJOR, SDK_VERSION_MINOR, SDK_VERSION_RELSTEP)
#endif

#endif
