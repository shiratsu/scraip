//
//  YearMonthCommon.m
//  moneyplan
//
//  Created by HIRATSUKA SHUNSUKE on 2013/09/16.
//  Copyright (c) 2013年 HIRATSUKA SHUNSUKE. All rights reserved.
//

#import "YearMonthCommon.h"

@interface YearMonthCommon ()

@end

@implementation YearMonthCommon
@synthesize ymView;
@synthesize aryData;

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
