//
//  MomentModel.h
//  TestOne
//
//  Created by Apple on 2018/9/1.
//  Copyright © 2018年 ruanmeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MomentModel : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)UIImage *headImage;
@property(nonatomic,strong)UIImage *showImage;

@property(nonatomic,assign) CGFloat cellHeight;
@property(nonatomic,assign) CGFloat showImageHeight;


@property(nonatomic,assign) BOOL isOpen;

-(void)modeCellHeightSet;
@end
