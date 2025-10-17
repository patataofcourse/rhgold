#ifndef _SYSTEM_CLIST_H_
#define _SYSTEM_CLIST_H_

#include "global.h"

class CList {
public:
    CList(void);
    virtual ~CList(void);

    // insert into given list, following priority (or otherwise at the end)
    void insertInto(CList** other);

private:
    void init(void);
    void destroy(void);
    
    CList **mHead;
    CList *mPrev;
    CList *mNext;
    int mPriorityMaybe;
};

#endif
