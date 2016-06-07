//
//  SegmentTableViewController.h
//  FrameworkSuxx
//
//  Created by suxx on 16/5/31.
//  Copyright © 2016年 suxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentTableViewController : UIViewController

/**
 *  segment的标题
 */
@property (nonatomic, strong)NSArray *titleArr;

/**
 *  tableViewController数组,这里的数量要跟titleArr的数量一致
 */
@property (nonatomic, strong)NSArray<UITableViewController *> *tableViewControllerArr;

/**
 *  segment的高度
 */
@property (nonatomic, assign)float segmentHeight;

- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray *)titleArr withTableViews:(NSArray *)tableViewArr withSegmentHeight:(float)segmentHeight;

@end
