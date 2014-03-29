//
//  AddCommon.m
//  moneyplan
//
//  Created by HIRATSUKA SHUNSUKE on 2013/09/16.
//  Copyright (c) 2013年 HIRATSUKA SHUNSUKE. All rights reserved.
//

#import "AddCommon.h"

@interface AddCommon ()

@end

@implementation AddCommon
@synthesize addView;
@synthesize year;
@synthesize month;
@synthesize day;
@synthesize categoryId;
@synthesize categoryName;
@synthesize money;
@synthesize maitsukiFlag;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


#pragma mark -
#pragma mark Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 5;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
