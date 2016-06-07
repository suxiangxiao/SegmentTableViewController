# SegmentTableViewController
The segment with tableViewController encapsulation

pod 'SegmentTableViewController', :git => 'https://github.com/suxiangxiao/SegmentTableViewController.git'

example:
    UIView *BGView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 100)];
    BGView.backgroundColor = [UIColor whiteColor];
    BGView.clipsToBounds = YES;
    [self.view addSubview:BGView];
    
    SegmentTableViewController *segTvc = [[SegmentTableViewController alloc] initWithFrame:BGView.frame withTitles:@[@"按钮1", @"按钮2", @"按钮3"] withTableViews:@[[[CeshiTableViewController alloc] init], [[CeshiTableViewController1 alloc] init], [[CeshiTableViewController2 alloc] init]] withSegmentHeight:60.0f];
    
    [BGView addSubviewAndFillConstraints:segTvc.view];
    [self addChildViewController:segTvc];
