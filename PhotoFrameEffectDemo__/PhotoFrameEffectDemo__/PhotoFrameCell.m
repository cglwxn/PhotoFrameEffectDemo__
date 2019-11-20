//
//  PhotoFrameCell.m
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/10/29.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import "PhotoFrameCell.h"
#import "Masonry/Masonry.h"
#import "PhotoFramScrollView.h"

@interface PhotoFrameCell ()

@property (nonatomic, strong) UIImageView *coverImageView;

@end

@implementation PhotoFrameCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:self.coverScrollView];
        [self.coverScrollView addSubview:self.coverImageView];
        [self makeContraints];
    }
    return self;
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
    [self.coverScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(ws) ss = ws;
        make.left.mas_equalTo(ss.contentView.mas_left).mas_offset(20);
        make.right.mas_equalTo(ss.contentView.mas_right).mas_offset(-20);
        make.bottom.mas_equalTo(ss.contentView.mas_bottom).mas_offset(-16);
        make.height.mas_equalTo((SCREEN_WIDTH-40)*188.0/355.0);
        make.top.mas_equalTo(ss.contentView.mas_top).mas_offset(16);
    }];
    
}

- (void)configurWithPhotoPath:(NSString *)photoPath {
    UIImage *image = [UIImage imageWithContentsOfFile:photoPath];
    self.coverImageView.image = image;
    CGSize imgSize = image.size;
    self.coverImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH - 40, (SCREEN_WIDTH - 40)*imgSize.height/imgSize.width);
    self.coverScrollView.contentSize = CGSizeMake(SCREEN_WIDTH - 40, (SCREEN_WIDTH - 40)*imgSize.height/imgSize.width);
}

- (void)resetScrollViewContentOffset:(NSInteger)contentOffsetY {
    [self.coverScrollView setContentOffset:CGPointMake(0, contentOffsetY)];
}

- (void)coverScrollTapAction:(UITapGestureRecognizer *)tap {
    if (self.tapHandler) {
        self.tapHandler(tap);
    }
}

- (PhotoFramScrollView *)coverScrollView {
    if (!_coverScrollView) {
        _coverScrollView = [[PhotoFramScrollView alloc] initWithFrame:CGRectZero];
        _coverScrollView.layer.cornerRadius = 4;
        _coverScrollView.showsVerticalScrollIndicator = NO;
        _coverScrollView.layer.masksToBounds = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverScrollTapAction:)];
        [_coverScrollView addGestureRecognizer:tap];
    }
    return _coverScrollView;
}

- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _coverImageView;
}


@end
