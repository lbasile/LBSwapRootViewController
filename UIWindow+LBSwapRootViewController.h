//
//  UIWindow+LBSwapRootViewController.h
//
//  Created by Louis Basile on 10/16/13.
//  Copyright (c) 2013 Louis Basile All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (LBSwapRootViewController)

- (void)swapRootViewControllerWithController:(UIViewController *)controller animated:(BOOL)animated;

@end
