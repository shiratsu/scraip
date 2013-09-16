//
//  MoneyAdminService.m
//  moneyplan
//
//  Created by HIRATSUKA SHUNSUKE on 2013/09/07.
//  Copyright (c) 2013年 HIRATSUKA SHUNSUKE. All rights reserved.
//

#import "MoneyAdminService.h"

@implementation MoneyAdminService

- (BOOL)insertMoneyAdmin:(NSMutableDictionary *)item{
    FMDatabase* db = [self _getDB:DBFILE];
    @try {
		[db beginTransaction];
		
        
        [self executeInsert:item withTable:@"MoneyAdmin" withDb:db];
        
		[db commit];
		[db close];
	}
	@catch (NSException * e) {
		
		// 例外処理を書く
		NSLog(@"例外名[%@] 例外の理由[%@]", [e name], [e reason]);
		
		// メソッド名とそのメソッドが属するクラス名を表示
		NSLog(@"%s", __func__);
		// ソースファイル名と行番号を表示
		NSLog(@"[%s][%d]", __FILE__, __LINE__);
		
		
		[db rollback];
		[db close];
		return NO;
	}
	return YES;
}

- (BOOL)updateMoneyAdmin:(NSMutableDictionary *)item
               withWhere:(NSMutableDictionary *)whereItem{
    
    FMDatabase* db = [self _getDB:DBFILE];
    @try {
		[db beginTransaction];
		[self executeUpdate:item where:whereItem withTable:@"MoneyAdmin" withDb:db];
		[db commit];
		[db close];
	}
	@catch (NSException * e) {
		
		// 例外処理を書く
		NSLog(@"例外名[%@] 例外の理由[%@]", [e name], [e reason]);
		
		// メソッド名とそのメソッドが属するクラス名を表示
		NSLog(@"%s", __func__);
		// ソースファイル名と行番号を表示
		NSLog(@"[%s][%d]", __FILE__, __LINE__);
		
		
		[db rollback];
		[db close];
		return NO;
	}
	return YES;
    
}

- (void)selectMoneyAdmin:(NSMutableDictionary *)whereDict{
    
    checkListAry = [[NSMutableArray alloc] init];
	
    FMDatabase *db = [self _getDB:DBFILE];
    
    NSString *queryWhere = [self createWhereParam:whereDict];
	
    
    NSString *query = [NSString stringWithFormat:@"select Day,CategoryId,CategoryName,YearMonth,sum(Money) from MoneyAdmin %@ group by Day,CategoryId order by Day desc",queryWhere];
    NSLog(@"%@",query);
    FMResultSet *rs = [db executeQuery:query];
    NSLog(@"%@",query);
	while ([rs next]) {
		
		
		NSMutableDictionary *hDict = [NSMutableDictionary dictionary];
		
		for (id obj in columnAry) {
			
			if([rs stringForColumn:obj] != nil){
				[hDict setObject:[rs stringForColumn:obj] forKey:obj];
			}else{
				[hDict setObject:@"" forKey:obj];
			}
		}
		
		[checkListAry addObject:hDict];
	}
	NSLog(@"%@",checkListAry);
    return;
    
}

#pragma mark すべての一覧を取得
- (void)selectMoneyAdminGroupYear{
    checkListAry = [[NSMutableArray alloc] init];
	
    FMDatabase *db = [self _getDB:DBFILE];
    
	NSString *selectColumn = [self createSelectColumn:@"InMoneyAdmin"];
    
    NSString *query = [NSString stringWithFormat:@"select YearMonth,sum(Money) from MoneyAdmin group by YearMonth order by YearMonth desc",selectColumn];
    NSLog(@"%@",query);
    FMResultSet *rs = [db executeQuery:query];
    NSLog(@"%@",query);
	while ([rs next]) {
		
		
		NSMutableDictionary *hDict = [NSMutableDictionary dictionary];
		
		for (id obj in columnAry) {
			
			if([rs stringForColumn:obj] != nil){
				[hDict setObject:[rs stringForColumn:obj] forKey:obj];
			}else{
				[hDict setObject:@"" forKey:obj];
			}
		}
		
		[checkListAry addObject:hDict];
	}
	NSLog(@"%@",checkListAry);
    return;
}



@end
