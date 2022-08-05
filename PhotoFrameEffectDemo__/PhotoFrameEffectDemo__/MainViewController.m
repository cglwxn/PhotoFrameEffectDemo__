//
//  MainViewController.m
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/10/29.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import "MainViewController.h"
#import "Masonry/Masonry.h"
#import "PhotoFrameCell.h"
#import "PhotoDetailViewController.h"
#import "ViewControllerAnimatedTransitioningDelegate.h"
#import "ViewControllerInteractiveTransitioningDelegate.h"
#import "MainPhotoListCell.h"
#import "MainPhotoFrameCollectionView.h"
#import "PhotoFrmeBackView.h"

static NSString *photoFrameCellID = @"PhotoFrameCell";
static NSString *MainPhotoListCellID = @"MainPhotoListCell";

@interface MainViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate,CAAnimationDelegate>

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) MainPhotoFrameCollectionView *collectionView;
@property (nonatomic, strong) ViewControllerAnimatedTransitioningDelegate *VCAnimatedTransitioning;
@property (nonatomic, strong) ViewControllerInteractiveTransitioningDelegate *VCInteractiveTransitioning;
@property (nonatomic, assign) BOOL isFirstTouchMoved;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorMake(0xFFFFFF);

//    [self.view addSubview:self.button];
    
    
//    PhotoFrmeBackView *back = [[PhotoFrmeBackView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
//    back.layer.cornerRadius = 20;
//    back.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:back];

//    [self.view addSubview:back];
    
    [self.view addSubview:self.collectionView];
    [self makeConstraints];

    [self.navigationController setNavigationBarHidden:YES];
    self.navigationController.delegate = self;
}


//- (UIButton *)button {
//    if (!_button) {
//        _button = [UIButton buttonWithType:UIButtonTypeCustom];
//        _button.frame = CGRectMake(100, 200, 200, 200);
//        _button.layer.cornerRadius = 20;
//        _button.backgroundColor = [UIColor lightGrayColor];
//        [_button addTarget:self action:@selector(xxbuttonTouchDownAction:) forControlEvents:(UIControlEventTouchDown)];
//        [_button addTarget:self action:@selector(xxbuttonTouchUpInsideAction:) forControlEvents:(UIControlEventTouchUpInside)];
//
//    }
//    return _button;
//}
//
//- (void)xxbuttonTouchDownAction:(UIButton *)button {
//    [UIView animateWithDuration:3 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
//        self.button.transform = CGAffineTransformScale(self.button.transform, 0.9, 0.9);
//    } completion:^(BOOL finished) {
//
//    }];
//}
//
//- (void)xxbuttonTouchUpInsideAction:(UIButton *)button {
//    [UIView animateWithDuration:3 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
//        self.button.transform = CGAffineTransformScale(self.button.transform, 1.0/0.9, 1.0/0.9);
//    } completion:^(BOOL finished) {
//
//    }];
//}

- (void)makeConstraints {
    WS(ws)
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(ws) strongSelf = ws;
        make.left.mas_equalTo(strongSelf.view.mas_left).mas_offset(0);
        make.right.mas_equalTo(strongSelf.view.mas_right).mas_offset(0);
        make.top.mas_equalTo(strongSelf.view.mas_top).mas_offset(0);
        make.bottom.mas_equalTo(strongSelf.view.mas_bottom).mas_offset(0);
    }];
}

#pragma mark - private

//- (void)scaleCell:(MainPhotoListCell *)cell {
//    [UIView animateWithDuration:3 animations:^{
//        cell.transform = CGAffineTransformScale(cell.transform, 0.8, 0.8);
//    }];
//}
//
//- (void)buttonTouchDownAction:(UIButton *)button {
//    [UIView animateWithDuration:3 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
//        button.transform = CGAffineTransformScale(button.transform, 0.9, 0.9);
//    } completion:^(BOOL finished) {
//
//    }];
//}
//
//- (void)buttonTouchDragAction:(UIButton *)button {
//
//}
//
//- (void)buttonTouchUpAction:(UIButton *)button {
//    [UIView animateWithDuration:3 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
//        button.transform = CGAffineTransformScale(button.transform, 1.0/0.9, 1.0/0.9);
//    } completion:^(BOOL finished) {
//
//    }];
//}

- (void)hanleCellSize:(UIButton *)button eventType:(UIControlEvents)eventType {
    switch (eventType) {
        case UIControlEventTouchDown:
        {
            self.collectionView.scrollViewCanScroll = NO;
            NSLog(@"----不可以滑动=============");
            NSLog(@"UIControlEventTouchDown");
            CABasicAnimation *anix  = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
            anix.duration = 3;
            anix.fromValue = @(1);
            anix.toValue = @(0.97);
            [button.layer addAnimation:anix forKey:@"transform.scale.x"];
            
            CABasicAnimation *aniy = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
            aniy.duration = 3;
            aniy.fromValue = @(1);
            aniy.toValue = @(0.97);
            [button.layer addAnimation:aniy forKey:@"transform.scale.y"];
            button.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.97, 0.97);
        }
            break;
        case UIControlEventTouchDragInside:
        {
            NSLog(@"UIControlEventTouchDragInside");
//            self.collectionView.scrollViewCanScroll = YES;
            NSLog(@"----可以滑动=============");
//            [button.layer removeAnimationForKey:@"transform.scale.x"];
//            [button.layer removeAnimationForKey:@"transform.scale.y"];
//            NSLog(@"%f",button.transform.tx);
        }
            break;
        case UIControlEventTouchUpInside:
        {
            NSLog(@"UIControlEventTouchUpInside");
                        
            CABasicAnimation *anix  = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
            anix.duration = 3;
            anix.fromValue = @(0.97);
            anix.toValue = @(1);
            [button.layer addAnimation:anix forKey:@"transform.scale.x"];

            CABasicAnimation *aniy  = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
            aniy.duration = 3;
            aniy.fromValue = @(0.97);
            aniy.toValue = @(1);
            [button.layer addAnimation:aniy forKey:@"transform.scale.y"];
            button.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
        }
            break;
        default:
            break;
    }
}

- (void)judgeBackView:(PhotoFrmeBackView *)view eventType:(PhotoFrmeBackViewEventType)eventType {
    switch (eventType) {
        case PhotoFrmeBackViewEventTypeBegan:
        {
            self.isFirstTouchMoved = YES;
            NSLog(@"PhotoFrmeBackViewEventTypeBegan");
            
            CAMediaTimingFunction *timeFx = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            CABasicAnimation *anix  = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
            anix.duration = 0.25;
            
            anix.timingFunction = timeFx;
            anix.fromValue = @(view.layer.presentationLayer.transform.m11);
            anix.toValue = @(0.955);
            [view.layer addAnimation:anix forKey:@"transform.scale.x"];
            
            CABasicAnimation *aniy  = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
            
            aniy.duration = 0.25;
            CAMediaTimingFunction *timeFy = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];

            aniy.timingFunction = timeFy;
            
            aniy.fromValue = @(view.layer.presentationLayer.transform.m11);
            aniy.toValue = @(0.955);
            [view.layer addAnimation:aniy forKey:@"transform.scale.y"];
            view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.955, 0.955);
        }
            break;
        case PhotoFrmeBackViewEventTypeMoved:
        {
            NSLog(@"PhotoFrmeBackViewEventTypeMove");
            NSLog(@"view.transform.scale.x-----%f",view.layer.transform.m11);
            NSLog(@"presentationLayer.transform.scale.x------%f",view.layer.presentationLayer.transform.m11);
            
            if (self.isFirstTouchMoved == YES) {
                self.isFirstTouchMoved = NO;
//                [self resetBackViewAnimation:view];
//                [view.layer removeAnimationForKey:@"transform.scale.x"];
//                [view.layer removeAnimationForKey:@"transform.scale.y"];
//                CABasicAnimation *anix  = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
//                anix.duration = 3;
//                anix.fromValue = @(view.layer.presentationLayer.transform.m11);
//                anix.toValue = @(1);
//                [view.layer addAnimation:anix forKey:@"transform.scale.x"];
//
//                CABasicAnimation *aniy  = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
//                aniy.duration = 3;
//                aniy.fromValue = @(view.layer.presentationLayer.transform.m11);
//                aniy.toValue = @(1);
//                [view.layer addAnimation:aniy forKey:@"transform.scale.y"];
//                view.layer.transform = CATransform3DIdentity;
                NSLog(@"滑动重置");
            }
        }
            break;
        case PhotoFrmeBackViewEventTypeEnded:
        {
            NSLog(@"PhotoFrmeBackViewEventTypeEnd");
            if (view.layer.presentationLayer.transform.m11 < 1) {
                [self resetBackViewAnimation:view];
//                [view.layer removeAnimationForKey:@"transform.scale.x"];
//                [view.layer removeAnimationForKey:@"transform.scale.y"];
//                CABasicAnimation *anix  = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
//                anix.duration = 3;
//                anix.fromValue = @(view.layer.presentationLayer.transform.m11);
//                anix.toValue = @(1);
//                [view.layer addAnimation:anix forKey:@"transform.scale.x"];
//
//                CABasicAnimation *aniy  = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
//                aniy.duration = 3;
//                aniy.fromValue = @(view.layer.presentationLayer.transform.m11);
//                aniy.toValue = @(1);
//                [view.layer addAnimation:aniy forKey:@"transform.scale.y"];
//                view.layer.transform = CATransform3DIdentity;
            }
        }
            break;
        case PhotoFrmeBackViewEventTypeCancelled:
        {
                
            NSLog(@"PhotoFrmeBackViewEventTypeCancelled");
            if (view.layer.presentationLayer.transform.m11 < 1) {
                [self resetBackViewAnimation:view];
//                [view.layer removeAnimationForKey:@"transform.scale.x"];
//                [view.layer removeAnimationForKey:@"transform.scale.y"];
//                CABasicAnimation *anix  = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
//                anix.duration = 3;
//                anix.fromValue = @(view.layer.presentationLayer.transform.m11);
//                anix.toValue = @(1);
//                [view.layer addAnimation:anix forKey:@"transform.scale.x"];
//
//                CABasicAnimation *aniy  = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
//                aniy.duration = 3;
//                aniy.fromValue = @(view.layer.presentationLayer.transform.m11);
//                aniy.toValue = @(1);
//                [view.layer addAnimation:aniy forKey:@"transform.scale.y"];
//                view.layer.transform = CATransform3DIdentity;
            }
        }
            break;
        default:
            break;
    }
}

- (void)resetBackViewAnimation:(UIView *)view {
    CAMediaTimingFunction *timex = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    CAMediaTimingFunction *timey = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [view.layer removeAnimationForKey:@"transform.scale.x"];
    [view.layer removeAnimationForKey:@"transform.scale.y"];
    CABasicAnimation *anix  = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    anix.duration = 0.22;
    anix.timingFunction = timex;
    anix.fromValue = @(view.layer.presentationLayer.transform.m11);
    anix.toValue = @(1);
    [view.layer addAnimation:anix forKey:@"transform.scale.x"];

    CABasicAnimation *aniy  = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    aniy.duration = 0.22;
    aniy.timingFunction = timey;
    aniy.fromValue = @(view.layer.presentationLayer.transform.m11);
    aniy.toValue = @(1);
    aniy.delegate = self;
    [view.layer addAnimation:aniy forKey:@"transform.scale.y"];
    
    
    view.layer.transform = CATransform3DIdentity;
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (self.isFirstTouchMoved == NO) return;
    PhotoDetailViewController *detailVC = [[PhotoDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MainPhotoListCell *cell = (MainPhotoListCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    PhotoDetailViewController *detailVC = [[PhotoDetailViewController alloc] init];
//    [self.navigationController pushViewController:detailVC animated:YES];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainPhotoListCell *cell = (MainPhotoListCell *)[collectionView dequeueReusableCellWithReuseIdentifier:MainPhotoListCellID forIndexPath:indexPath];
    __weak typeof(cell) weakCell = cell;
    WS(ws)
//    cell.buttonHandler = ^(UIButton * _Nullable button, UIControlEvents eventType) {
//        __strong typeof(ws) ss = ws;
//        __strong typeof(weakCell) strongCell = weakCell;
//        [ss hanleCellSize:button eventType:eventType];
//    };
    
    cell.backViewHandler = ^(PhotoFrmeBackView * _Nullable backView, PhotoFrmeBackViewEventType eventType) {
        __strong typeof(ws) ss = ws;
        [ss judgeBackView:backView eventType:eventType];
    };

    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

#pragma mark - accesors

- (MainPhotoFrameCollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 35;
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, 450);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[MainPhotoFrameCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
//        _collectionView.backgroundColor = UIColorMake(0xF5F5F5);
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[MainPhotoListCell class] forCellWithReuseIdentifier:MainPhotoListCellID];
    }
    return _collectionView;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

//Called to allow the delegate to return an interactive animator object for use during view controller transitions.
//返回控制器过渡期间的交互式动画对象
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController API_AVAILABLE(ios(7.0)) {
    //
//    return self.VCInteractiveTransitioning;
    return nil;
    
}

//Called to allow the delegate to return a noninteractive animator object for use during view controller transitions.
//返回控制器过渡期间非交互式动画对象
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  API_AVAILABLE(ios(7.0)) {
    //push和pop的过渡动画对象
//    return self.VCAnimatedTransitioning;
    return nil;
}

@end
