//
//  TestTableViewCell.m
//  TestOne
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 ruanmeng. All rights reserved.
//

#import "TestTableViewCell.h"


@implementation TestTableViewCell


-(void)createTestTableViewCell
{
    
    [self setUI];
}

-(void)setUI{
    
    if (self.isHead == YES) {
        self.contentLabel.hidden = YES;
        self.headImage.hidden = NO;
    }else{
        self.headImage.hidden = YES;
        self.contentLabel.hidden = NO;
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
