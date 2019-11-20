//
//  ViewController.m
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/10/29.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import "ViewController.h"
#import "PhotoFrameTableView.h"
#import "Masonry/Masonry.h"
#import "PhotoFrameCell.h"

static NSString *photoFrameCellID = @"PhotoFrameCell";
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) PhotoFrameTableView *tableView;

@property (strong, nonatomic) NSArray *photosList;
@property (nonatomic, strong) NSMutableDictionary *cellScrollViewOffsetRecordingDic;
@property (nonatomic, assign) CGFloat storageTableViewOffsetY;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *photoPath = [self photosDirectory];
    self.photosList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:photoPath error:nil];
    self.cellScrollViewOffsetRecordingDic = [NSMutableDictionary dictionary];
    [self.view addSubview:self.tableView];
    [self makeConstraints];
}

- (void)makeConstraints {
    WS(ws)
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(ws) strongSelf = ws;
        make.left.mas_equalTo(strongSelf.view.mas_left).mas_offset(0);
        make.right.mas_equalTo(strongSelf.view.mas_right).mas_offset(0);
        make.top.mas_equalTo(strongSelf.view.mas_top).mas_offset(0);
        make.bottom.mas_equalTo(strongSelf.view.mas_bottom).mas_offset(0);
    }];
}

-(NSString*) photosDirectory {
  return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Photos"];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"%s",__func__);
    
    if (scrollView == self.tableView) {
        self.storageTableViewOffsetY = scrollView.contentOffset.y;
        NSArray *visibleRowsIndexPaths = [self.tableView indexPathsForVisibleRows];
        [visibleRowsIndexPaths enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSIndexPath *indexP = (NSIndexPath *)obj;
            PhotoFrameCell *cell = [self.tableView cellForRowAtIndexPath:indexP];
            [self.cellScrollViewOffsetRecordingDic setObject:@(cell.coverScrollView.contentOffset.y) forKey:indexP];
        }];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%s",__func__);
    
    if (scrollView == self.tableView) {
        NSArray *visibleRowsIndexPaths = [self.tableView indexPathsForVisibleRows];
        [visibleRowsIndexPaths enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSIndexPath *indexP = (NSIndexPath *)obj;
            PhotoFrameCell *cell = [self.tableView cellForRowAtIndexPath:indexP];
            CGFloat originContentOffsetY = ((NSNumber *)([self.cellScrollViewOffsetRecordingDic objectForKey:indexP])).floatValue;
            CGFloat deltOffsetY = originContentOffsetY - (scrollView.contentOffset.y - self.storageTableViewOffsetY);
            if (deltOffsetY > 0 && deltOffsetY < cell.coverScrollView.contentSize.height - (SCREEN_WIDTH-40)*188.0/355.0) {
                [cell resetScrollViewContentOffset:(deltOffsetY)];
            }
        }];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *photoName = self.photosList[indexPath.row];
    NSString *photoFilePath = [[self photosDirectory] stringByAppendingPathComponent:photoName];
    PhotoFrameCell *cell = [tableView dequeueReusableCellWithIdentifier:photoFrameCellID forIndexPath:indexPath];
    cell.coverScrollView.delegate = self;
    [cell configurWithPhotoPath:photoFilePath];
    WS(ws)
    cell.tapHandler = ^(UIGestureRecognizer * _Nonnull tap) {
        __strong typeof(ws) ss = ws;
        //解决点击scrollView不跳转的问题
    };
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.photosList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //跳转
}

#pragma mark - accesors

- (PhotoFrameTableView *)tableView {
    if (!_tableView) {
        _tableView = [[PhotoFrameTableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        
        _tableView.sectionHeaderHeight = CGFLOAT_MIN;
        _tableView.sectionFooterHeight = CGFLOAT_MIN;
        _tableView.estimatedRowHeight = 400;
        
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerClass:[PhotoFrameCell class] forCellReuseIdentifier:photoFrameCellID];
    }
    return _tableView;
}
@end
