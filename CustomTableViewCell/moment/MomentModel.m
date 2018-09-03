//
//  MomentModel.m
//  TestOne
//
//  Created by Apple on 2018/9/1.
//  Copyright © 2018年 ruanmeng. All rights reserved.
//

#import "MomentModel.h"
#import "Factory.h"
@implementation MomentModel

//防止键值崩溃
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}



-(void)modeCellHeightSet
{
    _isOpen = YES;
    
    CGFloat hhhh = 0;
    hhhh+=38;
    
    
    hhhh+= [Factory textHeightFromTextString:_content width:ScreenWidth-80 fontSize:13.0f].height;
    
    hhhh += 7;
    
    if (!_showImage) {
        _cellHeight = hhhh + 57 + 15;
        return ;
    }
    
    CGFloat imageheight =  ((ScreenWidth-80)*_showImage.size.height)/_showImage.size.width;
    hhhh += imageheight;
    _showImageHeight = imageheight;
    
    _cellHeight = hhhh + 15;
}


@end
