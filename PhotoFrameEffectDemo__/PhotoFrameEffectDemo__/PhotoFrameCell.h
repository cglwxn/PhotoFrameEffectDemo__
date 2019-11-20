//
//  PhotoFrameCell.h
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/10/29.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoFramScrollView.h"

NS_ASSUME_NONNULL_BEGIN

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

typedef void(^PhotoFrameScrollViewTapHandler)(UIGestureRecognizer *tap);

@interface PhotoFrameCell : UITableViewCell

@property (nonatomic, strong) PhotoFramScrollView *coverScrollView;

@property (nonatomic, strong) PhotoFrameScrollViewTapHandler tapHandler;

- (void)configurWithPhotoPath:(NSString *)imageName;

- (void)resetScrollViewContentOffset:(NSInteger)contentOffsetY;

@end

NS_ASSUME_NONNULL_END
