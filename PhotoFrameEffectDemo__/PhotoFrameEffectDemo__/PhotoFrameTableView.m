//
//  PhotoFrameTableView.m
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/10/29.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import "PhotoFrameTableView.h"
#import "PhotoFramScrollView.h"

@implementation PhotoFrameTableView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer API_AVAILABLE(ios(7.0)) {
    if ([otherGestureRecognizer.view isKindOfClass:[PhotoFramScrollView class]]) {
        return YES;
    }
    return NO;
}

@end
