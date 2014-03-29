//
//  InMoneyAdminService.h
//  moneyplan
//
//  Created by HIRATSUKA SHUNSUKE on 2013/09/07.
//  Copyright (c) 2013年 HIRATSUKA SHUNSUKE. All rights reserved.
//

#import "SqliteBaseService.h"

@interface InMoneyAdminService : SqliteBaseService

- (BOOL)insertInMoneyAdmin:(NSMutableDictionary *)item;
- (BOOL)updateInMoneyAdmin:(NSMutableDictionary *)item
                 withWhere:(NSMutableDictionary *)whereItem
                ;
- (BOOL)deleteInMoneyAdmin:(NSMutableDictionary *)whereItem
;
- (void)selectInMoneyAdminGroupYear;
- (void)selectInMoneyAdmin:(NSMutableDictionary *)whereDict;

@end
