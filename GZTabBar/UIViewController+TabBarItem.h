//
//  UIViewController+TabBarItem.h
//  GZTabBarController
//
//  Created by syswin-sungzuozhi on 15/5/12.
//  Copyright (c) 2015年 思源. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TabBarItem)

@property (nonatomic, strong) UIButton *theTabBarItem;
/*
 * @des 重写tabBar set方法
 */
- (void)setTheTabBarItem:(UIButton *)theTabBarItem;

@end
