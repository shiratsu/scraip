//
//  SmpCommonViewController.h
//  Targets100
//
//  Created by  on 12/02/02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"




@interface SmpCommonViewController : UIViewController
<MBProgressHUDDelegate>
{
    __strong MBProgressHUD *HUD;
    __strong NSArray *aryDate;
    
}

@property(strong,readwrite) MBProgressHUD *HUD;
@property(strong,readwrite) NSArray *aryDate;

-(NSMutableArray *)feedNowDateAry;
-(NSDictionary *)feedTableEncode:(NSString *)tableName;
-(void)setNSUserDefaults:(NSString *)key withString:(NSString *)val;
-(void)setNSUserDefaultsForBool:(NSString *)key withBOOL:(BOOL)val;
-(NSString *)getStringNSUserDefaults:(NSString *)key;
-(void)initData;
-(void)initSearchData;

-(void)returnDataHandle:(NSMutableArray *)xmlData;

-(void)alertShow:(NSString *)message 
	  withButton:(NSString *)buttonInfo 
	   withOther:(NSString *)other
		 withTag:(int)tagId;


@end
