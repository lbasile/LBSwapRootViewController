//
//  UIWindow+LBSwapRootViewController.m
//  NuVal
//
//  Created by Louis Basile on 10/16/13.
//  Copyright (c) 2013 Louis Basile All rights reserved.
//

#import "UIWindow+LBSwapRootViewController.h"

@implementation UIWindow (LBSwapRootViewController)

- (void)swapRootViewControllerWithController:(UIViewController *)controller animated:(BOOL)animated
{
    if (animated) {
        [self swapRootViewControllerWithControllerAnimated:controller];
    } else {
        [self swapRootViewControllerWithController:controller];
    }
}

- (void)swapRootViewControllerWithController:(UIViewController *)controller
{
    self.rootViewController = controller;
}

- (void)swapRootViewControllerWithControllerAnimated:(UIViewController *)controller
{
    UIView *oldView = [self topViewController].view;
    self.rootViewController = controller;
    [self.rootViewController.view addSubview:oldView];
    
    [UIView transitionWithView:oldView duration:0.35f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        oldView.hidden = YES;
    } completion:^(BOOL finished) {
        [oldView removeFromSuperview];
    }];
}

- (UIViewController *)topViewController
{
    UIViewController *viewController = self.rootViewController;
    while (viewController.presentedViewController) {
        viewController = viewController.presentedViewController;
    }
    return viewController;
}

@end
