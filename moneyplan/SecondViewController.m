//
//  SecondViewController.m
//  moneyplan
//
//  Created by HIRATSUKA SHUNSUKE on 2013/09/03.
//  Copyright (c) 2013年 HIRATSUKA SHUNSUKE. All rights reserved.
//

#import "SecondViewController.h"
#import "MoneyAdminService.h"
#import "ItemContentCell.h"
#import "CustomTableView.h"
#import "MoneyYearMonth.h"

@interface SecondViewController ()
{
    MoneyAdminService *_mas;
    NSMutableArray *aryData;
}

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //初期化
    _mas = [[MoneyAdminService alloc] init];
    [_mas initData];
    
    //日時情報を取得
    [self feedNowDateAry];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"First");
    [self initData];
    [self initSearchData];
    NSString *strYearMonth = [NSString stringWithFormat:@"%@%@",[aryDate objectAtIndex:1],[aryDate objectAtIndex:2]];
    NSDictionary *whereDict = @{
                                @"YearMonth" : strYearMonth
                                };
    [_mas selectMoneyAdmin:whereDict];
    aryData = [_mas checkListAry];
    
    [_dataView reloadData];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    int returnCount = 0;
    if(section == 1){
        returnCount = [aryData count];
    }else{
        returnCount = 1;
    }
    return returnCount;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    static NSString *tCellIdentifier = @"ItemContentCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    ItemContentCell *icell = (ItemContentCell *)[tableView dequeueReusableCellWithIdentifier:tCellIdentifier];
    if (icell == nil) {
        CustomTableView *controller = [[CustomTableView alloc] initWithNibName:tCellIdentifier bundle:nil];
		icell = (ItemContentCell *)controller.view;
        
    }
    
    NSLog(@"testetstsst");
    
    if(indexPath.section == 0){
        cell.textLabel.text = @"他の月を見る";
        return cell;
        
    }
    if(indexPath.section == 1){
        NSString *year = [[aryData objectAtIndex:[indexPath row]] objectForKey:@"Year"];
        NSString *month = [[aryData objectAtIndex:[indexPath row]] objectForKey:@"Month"];
        NSString *day = [[aryData objectAtIndex:[indexPath row]] objectForKey:@"Day"];
        NSString *categoryName = [[aryData objectAtIndex:[indexPath row]] objectForKey:@"CategoryName"];
        NSString *sumMoney = [[aryData objectAtIndex:[indexPath row]] objectForKey:@"sum(Money)"];
        icell.itemLabel.text = [NSString stringWithFormat:@"%@年%@月%@日",year,month,day];
        icell.categoryLabel.text = categoryName;
        icell.moneyLabel.text = [NSString stringWithFormat:@"%@円",sumMoney];
        return icell;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0){
        MoneyYearMonth  *imym = [[MoneyYearMonth alloc] initWithNibName:@"MoneyYearMonth" bundle:nil];
        [self.navigationController pushViewController:imym animated:YES];
        imym=nil;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
