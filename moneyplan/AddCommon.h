//
//  AddCommon.h
//  moneyplan
//
//  Created by HIRATSUKA SHUNSUKE on 2013/09/16.
//  Copyright (c) 2013年 HIRATSUKA SHUNSUKE. All rights reserved.
//

#import "SmpCommonViewController.h"

@interface AddCommon : SmpCommonViewController

@property(weak,nonatomic) IBOutlet UITableView *addView;
@property(weak,nonatomic) NSString *year;
@property(weak,nonatomic) NSString *month;
@property(weak,nonatomic) NSString *day;
@property(weak,nonatomic) NSString *categoryId;
@property(weak,nonatomic) NSString *categoryName;
@property(weak,nonatomic) NSString *money;
@property(assign,nonatomic) BOOL maitsukiFlag;

@end
