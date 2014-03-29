//
//  FirstViewController.h
//  moneyplan
//
//  Created by HIRATSUKA SHUNSUKE on 2013/09/03.
//  Copyright (c) 2013年 HIRATSUKA SHUNSUKE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmpCommonViewController.h"
#import "InMoneyAdminService.h"

@interface FirstViewController : SmpCommonViewController
{
    InMoneyAdminService *imas;
    NSMutableArray *aryData;
}

@property(weak,readonly) IBOutlet UITableView *dataView;

@end
