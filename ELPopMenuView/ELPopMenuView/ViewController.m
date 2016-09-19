//
//  ViewController.m
//  ELPopMenuView
//
//  Created by etouch on 16/9/19.
//  Copyright © 2016年 ElegantLiar. All rights reserved.
//

#import "ViewController.h"
#import "ELPopMenuView.h"

@interface ViewController ()<ELPopMenuViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ELPopMenuView *popMenuView = [[ELPopMenuView alloc] initWithFrame:CGRectMake(100, 100, 100, 200)];
    popMenuView.delegate = self;
    popMenuView.rowHeight = 35;
    popMenuView.numOfRows = 10;
    [popMenuView reloadData];
    [self.view addSubview:popMenuView];
}

- (UITableViewCell *)elPopMenuView:(ELPopMenuView *)popMenuView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = @"test";
    return cell;
}

- (void)elPopMenuView:(ELPopMenuView *)popMenuView didSelectedRow:(NSInteger)row{
    NSLog(@"%ld", row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
