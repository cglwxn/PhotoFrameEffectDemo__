//
//  MainPhotoFrameCollectionView.h
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/11/29.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainPhotoFrameCollectionView : UICollectionView<UIGestureRecognizerDelegate>

@property (nonatomic, assign) BOOL scrollViewCanScroll;

@end

NS_ASSUME_NONNULL_END
