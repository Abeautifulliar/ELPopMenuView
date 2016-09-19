//
//  ELPopMenuView.h
//  ELPopMenuView
//
//  Created by etouch on 16/9/19.
//  Copyright © 2016年 ElegantLiar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ELPopMenuView;
@protocol ELPopMenuViewDelegate <NSObject>
- (void)elPopMenuView:(ELPopMenuView *)popMenuView didSelectedRow:(NSInteger)row;
- (UITableViewCell *)elPopMenuView:(ELPopMenuView *)popMenuView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface ELPopMenuView : UIView<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, weak) id<ELPopMenuViewDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign) NSInteger selectedRow;
@property (nonatomic, assign) NSInteger numOfRows;
@property (nonatomic, assign) CGFloat  rowHeight;
- (void)reloadData;
@end
