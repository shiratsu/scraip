//
//  ItemContentCell.h
//  moneyplan
//
//  Created by HIRATSUKA SHUNSUKE on 2013/09/08.
//  Copyright (c) 2013年 HIRATSUKA SHUNSUKE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemContentCell : UITableViewCell
{
    __strong IBOutlet UILabel *itemLabel;
    __strong IBOutlet UILabel *categoryLabel;
    __strong IBOutlet UILabel *moneyLabel;
}
@property(strong,readwrite) IBOutlet UILabel *moneyLabel;
@property(strong,readwrite) IBOutlet UILabel *categoryLabel;
@property(strong,readwrite) IBOutlet UILabel *itemLabel;

@end
