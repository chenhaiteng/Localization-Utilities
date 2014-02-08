//
//  initialization.c
//  TCHLocalizationUtilities
//
//  Created by Chen-Hai Teng on 2/7/14.
//  Copyright (c) 2014 Chen-Hai Teng. All rights reserved.
//

#import <Foundation/Foundation.h>

#if COVERAGE
__attribute__((constructor))

static void initializer() {
    [[NSUserDefaults standardUserDefaults] setValue:@"XCTestLog, TCHLocalizationTestObserver" forKey:@"XCTestObserverClass"];
//    printf("[%s] [%s]\n", __FILE__, __FUNCTION__);
    
}
#endif