//
//  ELPopMenuView.m
//  ELPopMenuView
//
//  Created by etouch on 16/9/19.
//  Copyright © 2016年 ElegantLiar. All rights reserved.
//

#import "ELPopMenuView.h"

@implementation ELPopMenuView
{
    UITableView *_popMenuView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpSubViews];
    }
    return self;
}

- (void)setUpSubViews{
    _popMenuView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
    _popMenuView.layer.borderWidth = 0.5;
    _popMenuView.layer.borderColor = [UIColor redColor].CGColor;
    _popMenuView.delegate = self;
    _popMenuView.dataSource = self;
    _popMenuView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _popMenuView.showsVerticalScrollIndicator = NO;
    [self addSubview:_popMenuView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.numOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [_delegate elPopMenuView:self cellForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_delegate && [_delegate respondsToSelector:@selector(elPopMenuView:didSelectedRow:)]) {
        [_delegate elPopMenuView:self didSelectedRow:indexPath.row];
        //self.hidden = YES;
    }
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)reloadData{
    [_popMenuView reloadData];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    self.hidden = YES;
//}

@end

