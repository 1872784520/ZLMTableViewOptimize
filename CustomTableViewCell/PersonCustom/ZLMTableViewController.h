//
//  ZLMTableViewController.h
//  TestOne
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 ruanmeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLMTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;
-(void)initData;
-(void)createView;

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;

@end



















