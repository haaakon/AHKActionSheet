//
//  UIWindow+AHKAdditions.m
//  AHKActionSheetExample
//
//  Created by Arkadiusz on 14-04-14.
//  Copyright (c) 2014 Arkadiusz Holko. All rights reserved.
//

#import "UIWindow+AHKAdditions.h"

@implementation UIWindow (AHKAdditions)

#pragma mark - Public

- (UIViewController *)ahk_viewControllerForStatusBarStyle
{
    UIViewController *currentViewController = [self currentViewController];

    while ([currentViewController childViewControllerForStatusBarStyle]) {
        currentViewController = [currentViewController childViewControllerForStatusBarStyle];
    }
    return currentViewController;
}

- (UIViewController *)ahk_viewControllerForStatusBarHidden
{
    UIViewController *currentViewController = [self currentViewController];

    while ([currentViewController childViewControllerForStatusBarHidden]) {
        currentViewController = [currentViewController childViewControllerForStatusBarHidden];
    }
    return currentViewController;
}

- (UIImage *)ahk_snapshot
{
    // source (under MIT license): https://github.com/shinydevelopment/SDScreenshotCapture/blob/master/SDScreenshotCapture/SDScreenshotCapture.m#L35
    UIGraphicsEndImageContext();
    UIGraphicsBeginImageContextWithOptions(self.screen.bounds.size, NO, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

#pragma mark - Private

- (UIViewController *)currentViewController
{
    UIViewController *viewController = self.rootViewController;
    while (viewController.presentedViewController) {
        viewController = viewController.presentedViewController;
    }
    return viewController;
}

@end
