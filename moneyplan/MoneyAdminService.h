//
//  MoneyAdminService.h
//  moneyplan
//
//  Created by HIRATSUKA SHUNSUKE on 2013/09/07.
//  Copyright (c) 2013年 HIRATSUKA SHUNSUKE. All rights reserved.
//

#import "SqliteBaseService.h"

@interface MoneyAdminService : SqliteBaseService

- (BOOL)insertMoneyAdmin:(NSMutableDictionary *)item;
- (BOOL)updateMoneyAdmin:(NSMutableDictionary *)item
                 withWhere:(NSMutableDictionary *)whereItem
;
- (BOOL)deleteMoneyAdmin:(NSMutableDictionary *)whereItem
;

- (void)selectMoneyAdminGroupYear;
- (void)selectMoneyAdmin:(NSMutableDictionary *)whereDict;

@end
