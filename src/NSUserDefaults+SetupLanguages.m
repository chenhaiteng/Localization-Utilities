//
//  NSUserDefaults+SetupLanguages.m
//  TCHLocalizationUtilities
//
//  Created by Chen-Hai Teng on 1/28/14.
//  Copyright (c) 2014 Chen-Hai Teng. All rights reserved.
//

#import "NSUserDefaults+SetupLanguages.h"

NSString * const keyLanguages = @"AppleLanguages";

@implementation NSUserDefaults (SetupLanguages)
- (void)setAppLanguage:(NSString *)lan
{
    NSMutableArray* langs = [NSMutableArray arrayWithArray:[self valueForKey:keyLanguages]];
    NSUInteger index = [langs indexOfObject:lan];
    if(NSNotFound != index) {
        [langs removeObjectAtIndex:index];
        [langs insertObject:lan atIndex:0];
        [self setValue:[langs copy] forKey:keyLanguages];
        [self synchronize];
    }
}
@end
