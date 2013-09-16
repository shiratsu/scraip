//
//  CustomTableView.h
//  moneyplan
//
//  Created by HIRATSUKA SHUNSUKE on 2013/09/08.
//  Copyright (c) 2013年 HIRATSUKA SHUNSUKE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemContentCell.h"

@interface CustomTableView : UIViewController
{
    __strong IBOutlet ItemContentCell *icCell;
}
@property(strong,readwrite) IBOutlet ItemContentCell *icCell;

@end
