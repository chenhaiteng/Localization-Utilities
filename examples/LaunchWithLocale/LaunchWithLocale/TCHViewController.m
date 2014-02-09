//
//  TCHViewController.m
//  LaunchWithLocale
//
//  Created by Chen Hai Teng on 2/9/14.
//  Copyright (c) 2014 Chen-Hai Teng. All rights reserved.
//

#import "TCHViewController.h"
#import "Constants.h"
@interface TCHViewController ()

@end

@implementation TCHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)languageChanged:(id)sender {
    if ([sender isMemberOfClass:[UISegmentedControl class]]) {
        UISegmentedControl* segment = sender;
        NSString * localeCode = nil;
        switch (segment.selectedSegmentIndex) {
            case 0:
                localeCode = @"ja";
                break;
            case 1:
                localeCode = @"en";
                break;
            case 2:
                localeCode = @"zh-Hant";
                break;
            default:
                break;
        }
        if (localeCode) {
            [[NSUserDefaults standardUserDefaults] setObject:localeCode forKey:UserSpecifiedLocale];
            [[NSUserDefaults standardUserDefaults] synchronize];
            UIAlertView *theAlert = [[UIAlertView alloc]
                                     initWithTitle:@"App Language Changed"
                                     message:@"The interface would be changed after App restart."
                                     delegate:self
                                     cancelButtonTitle:@"OK"
                                     otherButtonTitles:nil];
            [theAlert show];
        }
    }
}
@end
