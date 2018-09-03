//
//  ZLMTableViewController.m
//  TestOne
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 ruanmeng. All rights reserved.
//

#import "ZLMTableViewController.h"

@interface ZLMTableViewController ()
{
    UITableViewStyle _style;
    CGRect _frame;
}
@end

@implementation ZLMTableViewController

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super init]) {
        _style = style;
        _frame = frame;
        
        [self.view addSubview:self.tableView];
    }
    
    return self;
}
-(NSMutableArray*)dataArr
{
    if (!_dataArr){
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}
-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:_style];
//        CGRect frame=self.view.frame;
//        
        self.tableView.frame=_frame;
        
        self.tableView.delegate=self;
        self.tableView.dataSource=self;
        
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
        
        self.tableView.backgroundColor=WhiteColor;
        //无线
        self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        //
        self.tableView.showsVerticalScrollIndicator = NO;
        
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    
    
    [self createView];
    
}

-(void)initData
{
    
}

-(void)createView
{
    
}



#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    return nil;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end


















