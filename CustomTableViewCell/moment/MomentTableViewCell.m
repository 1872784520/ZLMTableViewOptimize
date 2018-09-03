//
//  MomentTableViewCell.m
//  TestOne
//
//  Created by Apple on 2018/9/1.
//  Copyright © 2018年 ruanmeng. All rights reserved.
//

#import "MomentTableViewCell.h"
#import "MomentModel.h"


@implementation MomentTableViewCell






-(void)createMomentTableViewCell:(MomentModel*)model
{
    _headImage.image = model.headImage;
    _nameLabel.text = model.name;
    
    _contentLabel.text = model.content;
    _showImage.image = model.showImage;
    
    if (model.cellHeight) {
        CGSize size = [Factory textHeightFromTextString:model.content width:ScreenWidth-80 fontSize:13.0f];
        [_contentLabel setHeight:size.height];
        
        [_showImage setYOffset:_contentLabel.bottom + 7];
        [_showImage setHeight:model.showImageHeight];
        
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
