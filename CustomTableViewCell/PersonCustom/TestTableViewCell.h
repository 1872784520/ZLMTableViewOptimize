//
//  TestTableViewCell.h
//  TestOne
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 ruanmeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewCell : UITableViewCell

@property (assign,nonatomic) BOOL isHead;//这个cell是不是头像的
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;


-(void)createTestTableViewCell;

@end
