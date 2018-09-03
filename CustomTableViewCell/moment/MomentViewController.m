//
//  MomentViewController.m
//  TestOne
//
//  Created by Apple on 2018/9/1.
//  Copyright © 2018年 ruanmeng. All rights reserved.
//

#import "MomentViewController.h"
#import "MomentTableViewCell.h"

#import "MomentModel.h"


typedef void(^SaveFuncBlock)(void);

@interface MomentViewController ()
{
    NSInteger cellNum;
    
}

//存放任务的数组
@property (nonatomic, strong) NSMutableArray *saveTaskMarr;

//最大任务数（超过最大任务数的任务就停止执行）
@property (nonatomic, assign) NSInteger maxTasksNumber;

//任务执行的代码块
@property (nonatomic, copy) SaveFuncBlock saveFuncBlock;



@end

@implementation MomentViewController
static NSString * const kCellIdentifier = @"MomentTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nibCell = [UINib nibWithNibName:NSStringFromClass([MomentTableViewCell class]) bundle:nil];
    [self.tableView registerNib:nibCell forCellReuseIdentifier:kCellIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)initData
{
    
    _saveTaskMarr = [NSMutableArray array];
    self.maxTasksNumber = 18;
    
    for (NSInteger i = 0 ; i< 1000 ; i++) {
        MomentModel *model = [[MomentModel alloc] init];
        model.name = [NSString stringWithFormat:@"赵路铭%ld",i];
        model.content = @"蜀绣又名“川绣”，是在丝绸或其他织物上采用蚕丝线绣出花纹图案的中国传统工艺，18107891687主要指以四川成都为中心的川西平原一带的刺绣。😁蜀绣最早见于西汉的记载，当时的工艺已相当成熟，同时传承了图案配色鲜艳、常用红绿颜色的特点。😁蜀绣又名“川绣”，是在丝绸或其他织物上采用蚕丝线绣出花纹图案的中国传统工艺，https://www.baidu.com，主要指以四川成都为中心的川西平原一带的刺绣。蜀绣最早见于西汉的记载，当时的工艺已相当成熟，同时传承了图案配色鲜艳、常用红绿颜色的特点。";
        model.headImage = [UIImage imageNamed:@"1"];
        [self.dataArr addObject:model];
    }
    
}

- (void)createView
{
    
    cellNum = 0;
    //[self createRightNavBtn];
    
    
    [self RunLoopOptimization];
    
}



-(void)RunLoopOptimization
{
    //1、先获取当前的Runloop
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    //定义观察者
    CFRunLoopObserverRef observer;
    CFRunLoopObserverContext context = {
        0,
        (__bridge void *)self,
        &CFRetain,
        &CFRelease,
        NULL
    };
    //创建观察者 参数一：分配空间的方式，参数二：运行循环状态，参数三：是否一直监听，参数四：优先级 参数五：回调函数的地址，参数六：上下文
    observer = CFRunLoopObserverCreate(kCFAllocatorMalloc, kCFRunLoopBeforeWaiting, YES, 0, &Callback, &context);
    //添加观察者，添加在common模式下面
    CFRunLoopAddObserver(runloop, observer, kCFRunLoopCommonModes);

    
    
    //创建定时器 (保证runloop回调函数一直在执行)
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self
                                                             selector:@selector(notDoSomething)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    
}
- (void)notDoSomething {
    // 不做事情,就是为了让 callBack() 函数一直相应
}
//MARK: 回调函数
//定义一个回调函数  一次RunLoop来一次
static void Callback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    MomentViewController * vcSelf = (__bridge MomentViewController *)(info);
    
    if (vcSelf.saveTaskMarr.count > 0) {
        
        //获取一次数组里面的任务并执行
        SaveFuncBlock funcBlock = vcSelf.saveTaskMarr.firstObject;
        funcBlock();
        [vcSelf.saveTaskMarr removeObjectAtIndex:0];
    }

}







-(void)createRightNavBtn
{
    //导航右侧按钮
    UIButton *saveButton=[UIButton buttonWithType:UIButtonTypeCustom];
    saveButton.frame = CGRectMake(0, 0, 40, 30);
    [saveButton setTitle:@"编辑" forState:UIControlStateNormal];
    saveButton.hidden=false;
    [saveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveIDCard:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:saveButton];
    [self.navigationItem setRightBarButtonItem:rightItem];
    
    
    
}
- (void) saveIDCard:(UIButton*)saveButton{
    for (NSInteger i = 0; i < 1000 ; i ++) {
        MomentModel *model = self.dataArr[i];
        NSString * str = [NSString stringWithFormat:@"%ld",(i+1)%10];
        model.showImage = [UIImage imageNamed:str];
        [model modeCellHeightSet];
        
    }
    
    [self.tableView reloadData];
}
#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //NSLog(@"%ld",self.dataArr.count);
    
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataArr count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    MomentTableViewCell *cell=[self.tableView dequeueReusableCellWithIdentifier:kCellIdentifier];

    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    [cell createMomentTableViewCell:self.dataArr[indexPath.row]];
    
    MomentModel *model = self.dataArr[indexPath.row];
    if (!model.cellHeight) {
        //添加任务到数组
        __weak typeof(self) weakSelf = self;
        [self addTasks:^{
            //下载图片的任务
            [weakSelf addImageToCell:cell andTag:indexPath];
        }];
    }
    
    return cell;
}
//添加任务进数组保存
-(void)addTasks:(SaveFuncBlock)taskBlock{
    
    [self.saveTaskMarr addObject:taskBlock];
    //超过每次最多执行的任务数就移出当前数组
    if (self.saveTaskMarr.count > self.maxTasksNumber) {
        
        [self.saveTaskMarr removeObjectAtIndex:0];
    }
    
}


-(void)addImageToCell:(MomentTableViewCell*)cell andTag:(NSIndexPath*)indexPath{
    
    //UIImageView* cellImageView = [[UIImageView alloc]initWithFrame:CGRectMake(tag*(64, 5, ImageWidth, ImageHeight)];
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        
        NSData* imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://img5.duitang.com/uploads/item/201312/14/20131214173346_iVKdT.jpeg"]];
        
        
        //NSLog(@"imageData%@",imageData);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            MomentModel *model = self.dataArr[indexPath.row];
            NSString * str = [NSString stringWithFormat:@"%ld",(indexPath.row+1)%10];
            model.showImage = [UIImage imageNamed:str];
            [model modeCellHeightSet];
            
            //
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            
        });
    });
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MomentModel *model = self.dataArr[indexPath.row];
    
    if (model.cellHeight){
        return model.cellHeight;
    }
    return 130;
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}



@end
