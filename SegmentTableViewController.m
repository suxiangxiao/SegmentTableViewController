//
//  SegmentTableViewController.m
//  FrameworkSuxx
//
//  Created by suxx on 16/5/31.
//  Copyright © 2016年 suxx. All rights reserved.
//

#import "SegmentTableViewController.h"
#import "HMSegmentedControl.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface SegmentTableViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong)HMSegmentedControl *segmentController;
@property (nonatomic, strong)UIScrollView *scrollerView;

@end

@implementation SegmentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray *)titleArr withTableViews:(NSArray *)tableViewArr withSegmentHeight:(float)segmentHeight
{
    self = [super init];
    if (self) {
        [self prepareForUIWithFrame:frame withTitles:titleArr withTableViews:tableViewArr withSegmentHeight:segmentHeight];
    }
    return self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Delegate
#pragma mark - UIScrollerViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSUInteger index = scrollView.contentOffset.x / SCREEN_WIDTH;
    _segmentController.selectedSegmentIndex = index;
}



#pragma mark - Event Handle

#pragma mark - Private Method
-(void)prepareForUIWithFrame:(CGRect)frame withTitles:(NSArray *)titleArr withTableViews:(NSArray *)tableViewArr withSegmentHeight:(float)segmentHeight{
    float width = frame.size.width;
    float height = frame.size.height;
    
    _segmentController = [[HMSegmentedControl alloc] initWithSectionTitles:titleArr];
    _segmentController.frame = CGRectMake(0, 0, width, segmentHeight);
    _segmentController.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _segmentController.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    [self.view addSubview:_segmentController];
    _segmentController.indexChangeBlock = ^(NSInteger index){
        _scrollerView.contentOffset = CGPointMake(index * width, 0);
        NSLog(@"切换");
    };
    
    _scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, segmentHeight, width, height - segmentHeight)];
    _scrollerView.contentSize = CGSizeMake(width * titleArr.count, height - segmentHeight);
    _scrollerView.pagingEnabled = YES;
    _scrollerView.delegate = self;
    [self.view addSubview:_scrollerView];
    _scrollerView.contentSize = CGSizeMake(width * titleArr.count, height - segmentHeight);
    
    for (int i = 0; i < tableViewArr.count; i++) {
        UITableViewController *tableVC = tableViewArr[i];
        tableVC.view.frame = CGRectMake(width * i, 0, width, _scrollerView.frame.size.height);
        [_scrollerView addSubview:tableVC.view];
        [self addChildViewController:tableVC];
    }
}

#pragma mark - Public Method

#pragma mark - Getter 和 Setter

@end
