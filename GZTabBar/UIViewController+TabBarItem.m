//
//  UIViewController+TabBarItem.m
//  GZTabBarController
//
//  Created by syswin-sungzuozhi on 15/5/12.
//  Copyright (c) 2015年 思源. All rights reserved.
//

#import "UIViewController+TabBarItem.h"
#import <objc/runtime.h>

static char kDHStyleKey;

@implementation UIViewController (TabBarItem)
@dynamic theTabBarItem;
/*
 * @des 重写set方法
 */
- (void)setTheTabBarItem:(UIButton *)theTabBarItem
{
    objc_setAssociatedObject(self, &kDHStyleKey, theTabBarItem, OBJC_ASSOCIATION_RETAIN);
}
/*
 * @des 重写get方法
 */
- (UIButton *)theTabBarItem
{
    return objc_getAssociatedObject(self, &kDHStyleKey);
}
@end
