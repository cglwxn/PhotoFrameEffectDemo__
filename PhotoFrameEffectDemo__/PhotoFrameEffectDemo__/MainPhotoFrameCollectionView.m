//
//  MainPhotoFrameCollectionView.m
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/11/29.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import "MainPhotoFrameCollectionView.h"

@implementation MainPhotoFrameCollectionView

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    return NO;
//}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    NSLog(@"%s---%@",__func__,gestureRecognizer.view);
//    if (self.scrollViewCanScroll == YES) {
//        return YES;
//    }else{
//        return NO;
//    }
    gestureRecognizer.delaysTouchesBegan = NO;
//    gestureRecognizer.delaysTouchesEnded = NO;
    return YES;
}
//
//-  (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%s---%@----%@",__func__,touches,event);
//    return [super touchesBegan:touches withEvent:event];
//}

@end
