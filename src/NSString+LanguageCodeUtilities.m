//
//  NSString+LanguageCodeUtilities.m
//  TCHLocalizationUtilities
//
//  Created by Chen-Hai Teng on 2/4/14.
//  Copyright (c) 2014 Chen-Hai Teng. All rights reserved.
//

#import "NSString+LanguageCodeUtilities.h"

@implementation NSString (LanguageCodeUtilities)
- (NSString*)rfc1766String
{
    return [self stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
}

- (NSString*)appleISOString
{
    return [self stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
}
@end
