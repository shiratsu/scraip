//
//  InMoneyAdmin.m
//  moneyplan
//
//  Created by HIRATSUKA SHUNSUKE on 2013/09/05.
//  Copyright (c) 2013年 HIRATSUKA SHUNSUKE. All rights reserved.
//

#import "InMoneyAdmin.h"

@implementation InMoneyAdmin

- (id)init
{
    if(self = [super init]){
		self.columnAry = [[NSArray alloc] initWithObjects:
                          @"id",
                          @"YearMonth",
                          @"Year",
                          @"Month",
                          @"CategoryId",
                          @"CategoryName",
                          @"Money",
                          nil];
    }
    return self;
}



#pragma mark エンコード系
-(void)initEncode{
	
	[super initEncode];
	
    
}

#pragma mark 必須入力系
-(void)initInput{
	
	[super initInput];
	
}

#pragma mark 更新系
-(void)initEdit{
	[super initEdit];
	
	
}


@end
