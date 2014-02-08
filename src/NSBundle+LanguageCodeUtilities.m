//
//  NSBundle+LanguageCodeUtilities.m
//  TCHLocalizationUtilities
//
//  Created by Chen-Hai Teng on 2/8/14.
//  Copyright (c) 2014 Chen-Hai Teng. All rights reserved.
//

#import "NSBundle+LanguageCodeUtilities.h"
#import "Constants.h"

NSString * const LocalProjectExt = @"lproj";

@implementation NSBundle (LanguageCodeUtilities)

+ (NSString *)findBundlePathForLocale:(NSString*)local inDirectory:(NSString *)bundlePath
{
    NSBundle* topLevelBundle;
    NSFileManager* fm = [NSFileManager defaultManager];
    NSString* resPathForLang = [local stringByAppendingPathExtension:LocalProjectExt];
    NSString* result = nil;
    if (bundlePath) {
        topLevelBundle = [NSBundle bundleWithPath:bundlePath];
    } else {
        topLevelBundle = [NSBundle mainBundle];
    }
    
    NSAssert(topLevelBundle, @"Cannot create bundle for ""%@""",bundlePath);
    result = [[topLevelBundle resourcePath] stringByAppendingPathComponent:resPathForLang];
    
    BOOL isDir = NO;
    if ((NO == [fm fileExistsAtPath:result isDirectory:&isDir]) || (NO == isDir)) {
        result = nil;
    }
    return result;
}

@end
