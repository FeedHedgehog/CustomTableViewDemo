//
//  LuLuTableViewCell.h
//  TableViewDemo1
//
//  Created by lulu on 15/10/30.
//  Copyright © 2015年 cdlulu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LuLuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellDetails;

@end
