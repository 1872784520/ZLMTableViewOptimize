//
//  Factory.h
//  StopWatchDemo
//
//  Created by Hailong.wang on 15/7/28.
//  Copyright (c) 2015年 Hailong.wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Factory : NSObject

//创建Button的工厂，将特殊的元素传入，生产相对应的Button
+ (UIButton *)createButtonWithTitle:(NSString *)title
                              frame:(CGRect)frame
                             target:(id)target
                           selector:(SEL)selector;
+ (UIButton *)createButtonWithTitle:(NSString *)title
                              frame:(CGRect)frame
                          titleFont:(CGFloat)size
                          textColor:(UIColor *)textColor
                    backgroundColor:(UIColor *)bgColor
                             target:(id)target
                           selector:(SEL)selector;
+ (UIButton *)createButtonWithFrame:(CGRect)frame target:(id)target sel:(SEL)sel tag:(NSInteger)tag image:(NSString *)name title:(NSString *)title;



//创建Label的工厂，将特殊的元素传入，生产相对应的Label
+ (UILabel *)createLabelWithTitle:(NSString *)title frame:(CGRect)frame;
+ (UILabel *)createLabelWithTitle:(NSString *)title frame:(CGRect)frame textColor:(UIColor *)color;
+ (UILabel *)createLabelWithTitle:(NSString *)title frame:(CGRect)frame fontSize:(CGFloat)size;
+ (UILabel *)createLabelWithTitle:(NSString *)title frame:(CGRect)frame textColor:(UIColor *)color fontSize:(CGFloat)size;

//创建View的工厂，将特殊的元素传入，生产相应的View
+ (UIView *)createViewWithBackgroundColor:(UIColor *)color frame:(CGRect)frame;

//创建textField的工厂，将特殊的元素传入，生产响应的textField
+ (UITextField *)createViewWithText:(NSString *)text frame:(CGRect)frame placeholder:(NSString *)placeholder textColor:(UIColor *)color borderStyle:(UITextBorderStyle)borderStyle;


//根据字符串内容的多少  在固定宽度 下计算出实际的行高
+ (CGSize)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size;
//获取 当前设备版本
+ (double)getCurrentIOS;

+ (NSString*)deviceVersion;//检测设备eg:iPhone 4s


//判断是否为空或空字符串
+(BOOL)isString:(NSString*)string;


+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;






@end
