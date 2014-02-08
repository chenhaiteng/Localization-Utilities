//
//  NSBundle+Localizor.m
//  TCHLocalizationUtilities
//
//  Created by Chen-Hai Teng on 2/8/14.
//  Copyright (c) 2014 Chen-Hai Teng. All rights reserved.
//

#import "NSBundle+Localizor.h"
#import "NSBundle+LanguageCodeUtilities.h"
#import "NSString+LanguageCodeUtilities.h"
#import "Constants.h"

@implementation NSBundle (Localizor)

+ (NSBundle *)bundleWithLanguageCode:(NSString *)language inDirectory:(NSString*)path
{
    NSBundle * bundle = nil;
    if ([[NSLocale availableLocaleIdentifiers] containsObject:language]) {
        bundle = [NSBundle bundleWithPath:[NSBundle findBundlePathForLocale:[language rfc1766String] inDirectory:path]];
    } else {
        NSCAssert(false, @"Invalid language code %@",language);
    }
    return bundle;
}

+ (NSBundle *)bundleWithLanguageCode:(NSString *)language
{
    return [NSBundle bundleWithLanguageCode:language inDirectory:nil];
}
@end
