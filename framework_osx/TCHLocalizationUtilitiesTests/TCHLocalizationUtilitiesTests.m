//
//  TCHLocalizationUtilitiesTests.m
//  TCHLocalizationUtilitiesTests
//
//  Created by Chen-Hai Teng on 2/5/14.
//  Copyright (c) 2014 Chen-Hai Teng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+LanguageCodeUtilities.h"
#import "NSBundle+LanguageCodeUtilities.h"
#import "NSBundle+Localizor.h"
#import "NSUserDefaults+SetupLanguages.h"

static NSString * const TESTSTRING = @"Unit Testing Data";
static NSString * const STRING_EN = @"Unit Testing Data(En)";
static NSString * const STRING_ZHHANT = @"單元測試資料";
static NSString * const STRING_JA = @"単体テストデータ";
static NSString * const STRING_ZHHANS = @"单元测试资料";
static NSString * const STRING_ZHHANT_HK = @"單元測試資料(粤)";

static NSString * const TESTSTRING_EN_ONLY = @"Unit Testing EN only";
static NSString * const STRING_EN_ONLY = @"Unit Testing EN only(En)";

@interface TCHLocalizationUtilitiesTests : XCTestCase
@property (strong, nonatomic, readonly) NSString * mockBundlePath;
@end

@implementation TCHLocalizationUtilitiesTests
@dynamic mockBundlePath;

static NSString * _mockBundlePath;
+ (void)setUp
{
    //Implement shared fixture.
    //Ref: http://xunitpatterns.com/Shared%20Fixture.html
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mockBundlePath = [[NSBundle bundleForClass:[TCHLocalizationUtilitiesTests class]] bundlePath];
    });
}

+ (NSString *)mockBundlePath
{
    return _mockBundlePath;
}

- (NSString *)mockBundlePath
{
    return [TCHLocalizationUtilitiesTests mockBundlePath];
}

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFindBundlePath
{
    
    XCTAssertNil([NSBundle findBundlePathForLocale:@"ru" inDirectory:self.mockBundlePath], @"Bundle path should be nil for [ru].");
    XCTAssertNotNil([NSBundle findBundlePathForLocale:@"en" inDirectory:self.mockBundlePath], @"The path for [en] is not exist.");
}

- (void)testSetAppLanguage
{
    NSUserDefaults *su = [NSUserDefaults standardUserDefaults];
    NSArray* curLanguages = [su valueForKey:@"AppleLanguages"];
    NSString * orgLanguage = [curLanguages firstObject];
    NSString * nextLanguage = [curLanguages objectAtIndex:1];
    [su setAppLanguage:nextLanguage];
    NSString * newLanguage = [[su valueForKey:@"AppleLanguages"] firstObject];
    XCTAssertEqualObjects(newLanguage, nextLanguage, @"%@ is not equal to %@", newLanguage, orgLanguage);
    [su setAppLanguage:orgLanguage];
}

- (void)testBundleLocaizor
{
    XCTAssertThrows([NSBundle bundleWithLanguageCode:@"Invalid"], @"No exception throws while language code is invalid.");
    XCTAssertThrows([NSBundle bundleWithLanguageCode:nil], @"No exception throws while locale is nil.");
    XCTAssertThrows([NSBundle bundleWithLanguageCode:@"en" inDirectory:@"-"], @"No assertion for invalid directory.");
    
    NSBundle * bundle_en = [NSBundle bundleWithLanguageCode:@"en" inDirectory:self.mockBundlePath];
    XCTAssertNotNil(bundle_en, @"Cannot create localized resource for [en]");
    NSBundle * bundle_zh_hant = [NSBundle bundleWithLanguageCode:@"zh_Hant" inDirectory:self.mockBundlePath];
    XCTAssertNotNil(bundle_zh_hant, @"Cannot create localized resource for [zh_Hant]");
    NSBundle * bundle_zh_hans = [NSBundle bundleWithLanguageCode:@"zh_Hans" inDirectory:self.mockBundlePath];
    XCTAssertNotNil(bundle_zh_hans, @"Cannot create localized resource for [zh_Hans]");
    NSBundle * bundle_zh_hant_hk = [NSBundle bundleWithLanguageCode:@"zh_Hant_HK" inDirectory:self.mockBundlePath];
    XCTAssertNotNil(bundle_zh_hant_hk, @"Cannot create localized resource for [zh_Hant_HK]");
}
@end
