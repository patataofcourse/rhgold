#include "System/CList.h"

CList::CList(void) {
    init();
}

CList::~CList(void) {
    destroy();
}

void CList::init(void) {
    mHead = NULL;
    mNext = NULL;
    mPrev = NULL;
    mPriorityMaybe = 0;
}

void CList::insertInto(CList **other) {
    if (other == NULL)
        OS_Panic("");
    mHead = other;

    CList *cur;
    CList *prev = NULL;
    cur = *other;
    while (cur != 0) {
        prev = cur;
        if (mPriorityMaybe >= cur->mPriorityMaybe)
            break;
        cur = cur->mNext;
    }

    if (cur != NULL) {
        mPrev = cur->mPrev;
        mNext = cur;
        cur->mPrev = this;
        if (mPrev != NULL) {
            mPrev->mNext = this;
        } else {
            *other = this;
        }
    } else {
        if (prev != NULL) {
            prev->mNext = this;
            mPrev = prev;
            mNext = NULL;
        } else {
            *other = this;
            mPrev = NULL;
            mNext = NULL;
        }
    }
}

void CList::destroy(void) {
    if (mHead != NULL) {
        if (mPrev != NULL) {
            mPrev->mNext = mNext;
        } else {
            *mHead = mNext;
        }
        
        if (mNext != NULL) {
            mNext->mPrev = mPrev;
        }

        mHead = NULL;
        mNext = NULL;
        mPrev = NULL;   
    }
}