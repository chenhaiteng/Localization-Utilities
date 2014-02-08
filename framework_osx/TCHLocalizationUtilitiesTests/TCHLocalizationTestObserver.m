//
//  TCHLocalizationTestObserver.m
//  TCHLocalizationUtilities
//
//  Created by Chen Hai Teng on 2/7/14.
//  Copyright (c) 2014 Chen-Hai Teng. All rights reserved.
//

#import "TCHLocalizationTestObserver.h"

@implementation TCHLocalizationTestObserver
- (void)stopObserving
{
    [super stopObserving];
    extern void __gcov_flush(void);
    __gcov_flush();
}
@end
