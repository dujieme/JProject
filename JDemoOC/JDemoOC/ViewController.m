//
//  ViewController.m
//  JDemoOC
//
//  Created by don on 2019/4/29.
//  Copyright © 2019 don. All rights reserved.
//

#import "ViewController.h"
#import <MJExtension/MJExtension.h>
#import "GeneralLocationModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = @{@"Ret":@"woshiRet",@"Name":@"ben",@"SessionID":@"123",@"General.Location":@{@"Language":@"eng",@"DSTRule":@"rule111"}};
    GeneralLocationModel *glModel = [GeneralLocationModel mj_objectWithKeyValues:dic];
    NSLog(@"%@",glModel);
    // Do any additional setup after loading the view.
}


@end
