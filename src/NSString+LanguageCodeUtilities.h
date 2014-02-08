//
//  NSString+LanguageCodeUtilities.h
//  TCHLocalizationUtilities
//
//  Created by Chen-Hai Teng on 2/4/14.
//  Copyright (c) 2014 Chen-Hai Teng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LanguageCodeUtilities)
- (NSString*)rfc1766String;
- (NSString*)appleISOString;
@end
