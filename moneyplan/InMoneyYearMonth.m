//
//  InMoneyYearMonth.m
//  moneyplan
//
//  Created by HIRATSUKA SHUNSUKE on 2013/09/15.
//  Copyright (c) 2013年 HIRATSUKA SHUNSUKE. All rights reserved.
//

#import "InMoneyYearMonth.h"
#import "InMoneyAdminService.h"

@interface InMoneyYearMonth ()
{
    InMoneyAdminService *imym;
}

@end

@implementation InMoneyYearMonth

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
    imym = [[InMoneyAdminService alloc] init];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
