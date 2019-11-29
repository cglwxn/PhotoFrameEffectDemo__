//
//  MainPhotoListCell.m
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/11/28.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import "MainPhotoListCell.h"
#import "Masonry.h"
#import "PhotoFrmeBackView.h"

@interface MainPhotoListCell ()

@property (nonatomic, strong) PhotoFrmeBackView *backContentView;

@end

@implementation MainPhotoListCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor whiteColor];
//        self.layer.cornerRadius = 20;
//        self.layer.shadowOffset = CGSizeMake(0, 0);
//        self.layer.shadowRadius = 10;
//        self.layer.shadowColor = [UIColor redColor].CGColor;
//
//
//        self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
//        self.layer.shouldRasterize = YES;
//
//        self.contentView.layer.cornerRadius = 20;
//        self.contentView.layer.shadowOffset = CGSizeMake(0, 0);
//        self.contentView.layer.shadowRadius = 10;
//        self.contentView.layer.shadowColor = [UIColor redColor].CGColor;
//        self.contentView.layer.masksToBounds = YES;
        
        
//        [self.contentView addSubview:self.button];
        
        [self.contentView addSubview:self.backContentView];
        [self makeContraints];
    }
    return self;
}

- (void)buttonTouchDownAction:(UIButton *)button{
    if (self.buttonHandler) {
        self.buttonHandler(button, UIControlEventTouchDown);
    }
}

- (void)buttonTouchDragAction:(UIButton *)button{
    if (self.buttonHandler) {
        self.buttonHandler(button, UIControlEventTouchDragInside);
    }
}

- (void)buttonTouchUpAction:(UIButton *)button{
    if (self.buttonHandler) {
        self.buttonHandler(button, UIControlEventTouchUpInside);
    }
}

- (void)makeContraints {
    for (UIView *subV in self.contentView.subviews) {
        subV.translatesAutoresizingMaskIntoConstraints = NO;
        [subV setContentHuggingPriority:750 forAxis:(UILayoutConstraintAxisHorizontal)];
        [subV setContentHuggingPriority:750 forAxis:(UILayoutConstraintAxisVertical)];
        [subV setContentCompressionResistancePriority:250 forAxis:(UILayoutConstraintAxisVertical)];
        [subV setContentCompressionResistancePriority:250 forAxis:(UILayoutConstraintAxisHorizontal)];
    }
    
    WS(ws)
//    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
//        __strong typeof(ws) ss = ws;
//        make.left.mas_equalTo(ss.contentView.mas_left).offset(20);
//        make.top.mas_equalTo(ss.contentView.mas_top).offset(0);
//        make.bottom.mas_equalTo(ss.contentView.mas_bottom).offset(0);
//        make.right.mas_equalTo(ss.contentView.mas_right).offset(-20);
//    }];
    
    [self.backContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(ws) ss = ws;
        make.left.mas_equalTo(ss.contentView.mas_left).offset(20);
        make.top.mas_equalTo(ss.contentView.mas_top).offset(0);
        make.bottom.mas_equalTo(ss.contentView.mas_bottom).offset(0);
        make.right.mas_equalTo(ss.contentView.mas_right).offset(-20);
    }];
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor lightGrayColor];
        _button.layer.cornerRadius = 20;
        [_button addTarget:self action:@selector(buttonTouchDownAction:) forControlEvents:(UIControlEventTouchDown)];
//        [_button addTarget:self action:@selector(buttonTouchDragAction:) forControlEvents:(UIControlEventTouchDragInside)];
        [_button addTarget:self action:@selector(buttonTouchUpAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _button;
}

- (PhotoFrmeBackView *)backContentView {
    if (!_backContentView) {
        _backContentView = [[PhotoFrmeBackView alloc] initWithFrame:CGRectZero];
        _backContentView.backgroundColor = [UIColor lightGrayColor];
        _backContentView.layer.cornerRadius = 15;
        
        WS(ws)
        _backContentView.backViewTouchBeganHandler = ^(PhotoFrmeBackView * _Nullable view) {
            __strong typeof(ws) ss = ws;
            ss.backViewHandler(view, PhotoFrmeBackViewEventTypeBegan);
        };
        
        _backContentView.backViewTouchMovedHandler = ^(PhotoFrmeBackView * _Nullable view) {
            __strong typeof(ws) ss = ws;
            ss.backViewHandler(view, PhotoFrmeBackViewEventTypeMoved);
        };
        
        _backContentView.backViewTouchEndedHandler = ^(PhotoFrmeBackView * _Nullable view) {
            __strong typeof(ws) ss = ws;
            ss.backViewHandler(view, PhotoFrmeBackViewEventTypeEnded);
        };
        
        _backContentView.backViewTouchCancelleddHandler = ^(PhotoFrmeBackView * _Nullable view) {
            __strong typeof(ws) ss = ws;
            ss.backViewHandler(view, PhotoFrmeBackViewEventTypeCancelled);
        };
    }
    return _backContentView;
}

@end
