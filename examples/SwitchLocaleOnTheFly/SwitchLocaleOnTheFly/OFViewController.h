//
//  OFViewController.h
//  SwitchLocaleOnTheFly
//
//  Created by Chen Hai Teng on 2/11/14.
//  Copyright (c) 2014 Chen-Hai Teng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OFViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView * tableView;
@end
