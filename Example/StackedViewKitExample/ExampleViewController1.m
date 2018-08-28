//
//  ExampleViewController1.m
//  PSStackedViewExample
//
//  Created by Peter Steinberger on 7/14/11.
//  Copyright 2011 Peter Steinberger. All rights reserved.
//

#import "ExampleViewController1.h"
#import "PSStackedView.h"
#import "UIViewController+PSStackedView.h"

@implementation ExampleViewController1

@synthesize indexNumber, indexNumberLabel;

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.width = PSIsIpad() ? 400 : 150;
    
    // random color
    self.view.backgroundColor = [UIColor colorWithRed:((float)rand())/RAND_MAX green:((float)rand())/RAND_MAX blue:((float)rand())/RAND_MAX alpha:1.0];
    
    UIButton *maxButton = [UIButton buttonWithType:UIButtonTypeCustom];
    maxButton.frame = CGRectMake(100, 400, 60, 40);
    [maxButton setTitle:@"Max" forState:UIControlStateNormal];
    [maxButton addTarget:self action:@selector(maxButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:maxButton];
    
    UIButton *minButton = [UIButton buttonWithType:UIButtonTypeCustom];
    minButton.frame = CGRectMake(200, 400, 60, 40);
    [minButton setTitle:@"Min" forState:UIControlStateNormal];
    [minButton addTarget:self action:@selector(minButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:minButton];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setIndexNumber:(NSUInteger)anIndexNumber {
    self.indexNumberLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)anIndexNumber];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - PSStackedViewDelegate

- (NSUInteger)stackableMinWidth; {
    return 100;
}


#pragma mark -
#pragma mark Target-Action

- (void)maxButtonTouched:(UIButton *)button {
    NSInteger index = [self.stackController indexOfViewController:self];
    [self maximizeStackViewAtIndex:index];
}

- (void)minButtonTouched:(UIButton *)button {
    NSInteger index = [self.stackController indexOfViewController:self];
    [self minimizeStackViewAtIndex:index];
}

@end
