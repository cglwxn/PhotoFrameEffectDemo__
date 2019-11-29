//
//  MainPhotoListCell.h
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/11/28.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoFrmeBackView.h"

typedef NS_ENUM(NSUInteger,PhotoFrmeBackViewEventType) {
    PhotoFrmeBackViewEventTypeBegan = 10,
    PhotoFrmeBackViewEventTypeMoved,
    PhotoFrmeBackViewEventTypeEnded,
    PhotoFrmeBackViewEventTypeCancelled
};

typedef void(^MainPhotoListCellButtonHandler)(UIButton * _Nullable button , UIControlEvents eventType);


typedef void(^MainPhotoListCellBackViewHandler)(PhotoFrmeBackView * _Nullable backView , PhotoFrmeBackViewEventType eventType);

NS_ASSUME_NONNULL_BEGIN

@interface MainPhotoListCell : UICollectionViewCell


@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) MainPhotoListCellButtonHandler buttonHandler;

@property (nonatomic, strong) MainPhotoListCellBackViewHandler backViewHandler;

@end

NS_ASSUME_NONNULL_END
