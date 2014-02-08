//
//  NSBundle+LanguageCodeUtilities.h
//  TCHLocalizationUtilities
//
//  Created by Chen-Hai Teng on 2/8/14.
//  Copyright (c) 2014 Chen-Hai Teng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (LanguageCodeUtilities)
+ (NSString *)findBundlePathForLocale:(NSString*)local inDirectory:(NSString *)bundlePath;
@end
