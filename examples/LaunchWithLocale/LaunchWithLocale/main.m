//
//  main.m
//  LaunchWithLocale
//
//  Created by Chen Hai Teng on 2/9/14.
//  Copyright (c) 2014 Chen-Hai Teng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TCHAppDelegate.h"
#import "NSUserDefaults+SetupLanguages.h"
#import "Constants.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        
        NSString* myLocale = [[NSUserDefaults standardUserDefaults] valueForKey:UserSpecifiedLocale];
        if (myLocale) {
            [[NSUserDefaults standardUserDefaults] setAppLanguage:myLocale];
        }
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([TCHAppDelegate class]));
    }
}
