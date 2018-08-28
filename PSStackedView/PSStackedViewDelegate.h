//
//  PSStackedViewDelegate.h
//  PSStackedView
//
//  Created by Peter Steinberger on 7/14/11.
//  Copyright 2011 Peter Steinberger. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PSStackedViewController;
@class UIViewController;

@protocol PSStackedViewDelegate <NSObject>

@optional

/// viewController will be inserted
- (void)stackedView:(PSStackedViewController *)stackedView willInsertViewController:(UIViewController *)viewController;

/// viewController has been inserted
- (void)stackedView:(PSStackedViewController *)stackedView didInsertViewController:(UIViewController *)viewController;

/// viewController will be removed
- (void)stackedView:(PSStackedViewController *)stackedView willRemoveViewController:(UIViewController *)viewController;

/// viewController has been removed
- (void)stackedView:(PSStackedViewController *)stackedView didRemoveViewController:(UIViewController *)viewController;

/// stackcontroller will pop off view controllers because of drag to right
- (void)stackedView:(PSStackedViewController*)stackedView WillPopViewControllers:(NSArray*)controllers;

/// stackcontroller will no longer pop off view controllers because of drag to right
- (void)stackedView:(PSStackedViewController *)stackedView WillNotPopViewControllers:(NSArray*)controllers;

/// stackcontroller did start dragging stack
- (void)stackedViewDidStartDragging:(PSStackedViewController*)stackedView;

/// stackcontroller did stop dragging stack
- (void)stackedViewDidStopDragging:(PSStackedViewController*)stackedView;

/// viewController has been panned
- (void)stackedView:(PSStackedViewController *)stackedView didPanViewController:(UIViewController *)viewController byOffset:(NSInteger)offset;

/// viewController has been aligned (programmatically or by result of panning)
- (void)stackedViewDidAlign:(PSStackedViewController *)stackedView;

@end
