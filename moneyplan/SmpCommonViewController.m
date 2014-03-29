//
//  SmpCommonViewController.m
//  Targets100
//
//  Created by  on 12/02/02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SmpCommonViewController.h"
#import "Common.h"
#import "TableDefine.h"


@implementation SmpCommonViewController
@synthesize HUD;
@synthesize aryDate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

#pragma mark -
#pragma mark 親クラスの初期ロード
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [Common hexToUIColor:@"f0b029" alpha:1.0];
	

}

-(NSMutableArray *)feedNowDateAry{
    aryDate = [Common feedNowDate];
}

-(void)viewWillAppear:(BOOL)animated{
    
}


#pragma mark -
#pragma mark 初期処理
-(void)initData{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
}






#pragma mark -
#pragma mark アカウントを保存


#pragma mark -
#pragma mark 複数ボタン付きアラート（タグ付き）
-(void)alertShow:(NSString *)message 
	  withButton:(NSString *)buttonInfo 
	   withOther:(NSString *)other
		 withTag:(int)tagId{
	UIAlertView *errorAlert = [[UIAlertView alloc] 
							   initWithTitle:nil 
							   message:message  
							   delegate:self  
							   cancelButtonTitle:buttonInfo  
							   otherButtonTitles:other, nil];
	errorAlert.tag=tagId;
	[errorAlert show];  
	
}


#pragma mark -
#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
	HUD = nil;
}




#pragma mark -
#pragma mark エンコード情報が書かれたテーブル辞書を取得
-(NSDictionary *)feedTableEncode:(NSString *)tableName{
	
	// tableDefineのクラスオブジェクトを取得
	Class tableDefine;
	tableDefine = NSClassFromString(tableName);
	
	//クラスがあるかどうか確認
	if(tableDefine != nil){
		
		//初期化
		id object = [[tableDefine alloc] init];
		
		[object initEncode];
        
		return [object encode];
		
		// tableDefineがメソッドinitEncodeを実装しているかどうかを確認
		/*
         if ([object respondsToSelectlr:@selector(initEncode)]) {
         //初期化して返却
         [object performSelector:@selector(initEncode)];
         return [object encode];
         }
         */
	}	
	
	return nil;
}


#pragma mark -
#pragma mark 取得データを処理。子に実装
-(void)responseDataHandle:(NSMutableArray *)xmlData{
}    

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if(interfaceOrientation == UIInterfaceOrientationPortrait){
		return YES;
	}else if(interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){
		return YES;
	}else{
		return NO;
	}	
	
}

#pragma mark -
#pragma mark NSUserDefaultsにデータをセット
-(void)setNSUserDefaults:(NSString *)key withString:(NSString *)val{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:val forKey:key];
    defaults=nil;
}

#pragma mark -
#pragma mark NSUserDefaultsにデータをセット
-(void)setNSUserDefaultsForBool:(NSString *)key withBOOL:(BOOL)val{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:val forKey:key];
    defaults=nil;
}


#pragma mark -
#pragma mark NSUserDefaultsからデータを取得
-(NSString *)getStringNSUserDefaults:(NSString *)key{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *val = [defaults objectForKey:key];
    return val;
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



@end
