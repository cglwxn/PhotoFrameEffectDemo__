//
//  BASENavigationController.m
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/11/27.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import "BASENavigationController.h"

@interface BASENavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BASENavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) ws = self;
    self.interactivePopGestureRecognizer.delegate = ws;
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    return YES;
}



@end
