//
//  NSBundle+Localizor.h
//  TCHLocalizationUtilities
//
//  Created by Chen-Hai Teng on 2/8/14.
//  Copyright (c) 2014 Chen-Hai Teng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (Localizor)
+ (NSBundle *)bundleWithLanguageCode:(NSString *)language;
+ (NSBundle *)bundleWithLanguageCode:(NSString *)language inDirectory:(NSString*)path;
@end


#define TCHLocalizedString(key, lang, comment) \
[[NSBundle bundleWithLanguageCode:(lang)] localizedStringForKey:(key) value:@"" table:nil]

#define TCHLocalizedStringFromTable(key, lang, tbl, comment) \
[[NSBundle bundleWithLanguageCode:(lang)] localizedStringForKey:(key) value:@"" table:(tbl)]