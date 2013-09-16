//
//  MoneyYearMonth.m
//  moneyplan
//
//  Created by HIRATSUKA SHUNSUKE on 2013/09/16.
//  Copyright (c) 2013年 HIRATSUKA SHUNSUKE. All rights reserved.
//

#import "MoneyYearMonth.h"
#import "MoneyAdminService.h"

@interface MoneyYearMonth ()
{
    MoneyAdminService *mas;
}

@end

@implementation MoneyYearMonth

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
    mas = [[MoneyAdminService alloc] init];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
