//
//  MoneyCategoryService.h
//  moneyplan
//
//  Created by HIRATSUKA SHUNSUKE on 2013/09/07.
//  Copyright (c) 2013年 HIRATSUKA SHUNSUKE. All rights reserved.
//

#import "SqliteBaseService.h"

@interface MoneyCategoryService : SqliteBaseService

- (void)selectCategory;
- (BOOL)insertCategory:(NSMutableDictionary *)item;

@end
