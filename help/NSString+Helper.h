//
//  NSString+Helper.h
//  02.用户登录&注册
//
//  Created by 刘凡 on 13-11-28.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)
#pragma mark - Get请求转换
/**
 *  将 nil 的字符串转 @""
 *
 *  @return 将 nil 的字符串转 @""
 */
-(NSString *)EmptyStringByWhitespace;
/**
 *  字符串转UTF-8
 *
 *  @return 字符串转UTF-8
 */
-(NSString *)getRequestString;
/**
 *  清空字符串中的空白字符
 *
 *  @return 清空空白字符串之后的字符串
 */
- (NSString *)trimString;
/**
 *
 *段前空两格
 */
-(NSString *)emptyBeforeParagraph;
/**
 *  是否空字符串
 *
 *  @return 如果字符串为nil或者长度为0返回YES
 */
- (BOOL)isEmptyString;

/**
 *  返回沙盒中的文件路径
 *
 *  @return 返回当前字符串对应在沙盒中的完整文件路径
 */
- (NSString *)documentsPath;

/**
 *  写入系统偏好
 *
 *  @param key 写入键值
 */
- (void)saveToNSDefaultsWithKey:(NSString *)key;
/**
 *    读出系统偏好
 *
 *  @param key 读出键值
 */
+ (NSString *)readToNSDefaultsWithKey:(NSString *)key;
/**
 *
 *判断是否是邮箱
 */
-(BOOL)isValidateEmail;
/**
 *
 *判断是否是手机号
 */
-(BOOL) isValidateMobile;
/**
 *
 *判断是否是手机号或固话
 */
-(BOOL) isValidateMobileAndTel;
/**
 *
 *判断是否是手机号或固话或400
 */
-(BOOL) isValidateMobileAndTelAnd400;
/**
 *
 *银行账号判断
 */
 -(BOOL)isValidateBank;
/**
 *
 *身份证号
 */
-(BOOL) isValidateIdentityCard;
/**
 *
 *判断是否是车牌号
 */
-(BOOL) isValidateCarNo;
/**
 *
 *车型号
 */
- (BOOL) isValidateCarType;
/**
 *
 *昵称
 */
- (BOOL) isValidateNickname;
/**
 *
 *密码（6~20位，数字，字母）
 */
-(BOOL) isValidatePassword;
/**
 *
 *用户名
 */
- (BOOL) isValidateUserName;
/*
 *判断汉字
 *
 */
-(BOOL)isChinese;
/*
 *字符串转日期
 *
 */
- (NSDate *)dateFromString;
/*
 *日期转字符串
 *
 */
+ (NSString *)stringFromDate:(NSDate *)date;


- (BOOL)validateMobile;
@end
