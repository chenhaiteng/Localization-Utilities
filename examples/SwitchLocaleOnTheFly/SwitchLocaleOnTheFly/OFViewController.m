//
//  OFViewController.m
//  SwitchLocaleOnTheFly
//
//  Created by Chen Hai Teng on 2/11/14.
//  Copyright (c) 2014 Chen-Hai Teng. All rights reserved.
//

#import "OFViewController.h"
#import "NSBundle+Localizor.h"

@interface OFViewController ()
@property (strong, nonatomic) NSString * langCode;
@end

@implementation OFViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _langCode = @"en";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)switchLanguage:(id)sender {
    UISegmentedControl* seg = sender;
//    NSString* langCode;
    switch(seg.selectedSegmentIndex) {
        case 0:
            self.langCode = @"en";
            break;
        case 1:
            self.langCode = @"zh_Hant";
            break;
        default:
            break;
    }
    UINib * nib = [UINib nibWithNibName:@"OFViewController" bundle:[NSBundle bundleWithLanguageCode:self.langCode]];
    [nib instantiateWithOwner:self options:nil];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
        
    }
    if(indexPath.row == 0) {
        cell.textLabel.text = NSLocalizedString(@"FirstData", @"");
    } else {
        cell.textLabel.text = [[NSBundle bundleWithLanguageCode:self.langCode] localizedStringForKey:@"Data" value:nil table:nil];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}
@end
