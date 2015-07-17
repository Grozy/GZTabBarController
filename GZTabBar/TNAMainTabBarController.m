//
//  TNAMainTabBarController.m
//  GZTabBarController
//
//  Created by ; on 15/5/12.
//  Copyright (c) 2015年 思源. All rights reserved.
//

#import "TNAMainTabBarController.h"
#import "TNATabButton.h"

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define KTabBarHeight 49.0f

@interface TNAMainTabBarController ()

/*
 * tabBar视图，按钮所在的view。
 */
@property (nonatomic, strong) UIView *tabBarView;

/*
 * 当前选中的Controller,具体有viewControllers持有，所以用weak指向。
 */
@property (nonatomic, weak) UINavigationController *currentSeletedController;

@property (nonatomic, strong) UIButton *camareButton;

@end

@implementation TNAMainTabBarController

#pragma mark - life cycle
- (instancetype)init
{
    if (self)
    {
        self.tabBar.translucent = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self uiConfig];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self removeTabBarButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - create controller

#pragma mark - ui maker
/*
 * 移除UITabBarButton
 */
- (void)removeTabBarButton
{
    for (UIView *subview in self.tabBar.subviews)
    {
        if ([subview isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            [subview removeFromSuperview];
        }
    }
}
/*
 * @des 将tabBarView加入的tabBar
 */
- (void)uiConfig
{
    [self.tabBar addSubview:self.tabBarView];
}

#pragma mark - getter & setter
/*
 * @des 重载setControllers的方法
 */
- (void)setViewControllers:(NSArray *)viewControllers
{
    [super setViewControllers:viewControllers];
    [self.viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIViewController *viewController = obj;
        UIButton *button = viewController.theTabBarItem;
        button.tag = idx;
        NSInteger buttonIdx = idx;
        if (idx > 1)
        {
            buttonIdx = idx + 1;
        }
        
        button.frame = CGRectMake(buttonIdx * ( KScreenWidth / (self.viewControllers.count + 1)), 0, KScreenWidth / (self.viewControllers.count + 1), KTabBarHeight);

        [button addTarget:self action:@selector(tabBarItemPushed:) forControlEvents:UIControlEventTouchUpInside];
        if (0 == idx)
        {
            button.selected = YES;
        }
        [self.tabBarView addSubview:button];
    }];
    
    self.camareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.camareButton.frame = CGRectMake(2 * ( KScreenWidth / (self.viewControllers.count + 1)), 0, KScreenWidth / (self.viewControllers.count + 1), KTabBarHeight);
    [self.camareButton addTarget:self action:@selector(camareButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.camareButton setImage:[UIImage imageNamed:@"initiate"] forState:UIControlStateNormal];
    [self.tabBarView addSubview:self.camareButton];
}

#pragma mark - touch event
/*
 * @des 点击切换当前选中的controller
 */
-(void)tabBarItemPushed:(UIButton *)sender
{
    UIViewController *selectedViewController = self.viewControllers[sender.tag];
    self.selectedViewController = selectedViewController;
    self.currentSeletedController = (UINavigationController *)self.selectedViewController;
    [self.tabBarView.subviews enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL *stop) {
        if (button != self.camareButton)
            button.selected = (self.viewControllers[idx] == self.selectedViewController);
    }];
}
/*
 * @des 相机按钮的点击事件
 */
- (void)camareButtonClicked:(UIButton *)button
{

}

- (void)postSuccess
{
    self.selectedIndex = 0;
    [self.tabBarView.subviews enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL *stop) {
        if (button != self.camareButton)
            button.selected = (self.viewControllers[idx] == self.selectedViewController);
    }];
}

- (void)postMessage
{
    self.selectedIndex = 2;
    [self.tabBarView.subviews enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL *stop) {
        if (button != self.camareButton)
            button.selected = (self.viewControllers[idx] == self.selectedViewController);
    }];
}


#pragma mark - accessor
- (UIView *)tabBarView
{
    if (!_tabBarView)
    {
        _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0,0, KScreenWidth, KTabBarHeight)];
        _tabBarView.userInteractionEnabled = YES;
        _tabBarView.backgroundColor = [UIColor whiteColor];
    }
    return _tabBarView;
}
@end
