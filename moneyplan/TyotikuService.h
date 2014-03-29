//
//  TyotikuService.h
//  moneyplan
//
//  Created by HIRATSUKA SHUNSUKE on 2013/09/07.
//  Copyright (c) 2013年 HIRATSUKA SHUNSUKE. All rights reserved.
//

#import "SqliteBaseService.h"

@interface TyotikuService : SqliteBaseService

- (BOOL)insertTyotiku:(NSMutableDictionary *)item;
- (BOOL)updateTyotiku:(NSMutableDictionary *)item
               withWhere:(NSMutableDictionary *)whereItem;
- (BOOL)deleteTyotiku:(NSMutableDictionary *)whereItem;

- (void)selectTyotikuGroupYear;
- (void)selectTyotiku:(NSMutableDictionary *)whereDict;


@end
