//
//  PhotoDetailViewController.m
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/11/27.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import "PhotoDetailViewController.h"
#import "PhotoFrameTableView.h"
#import "Masonry/Masonry.h"
#import "PhotoFrameCell.h"
#import "PhotoDetailViewController.h"
#import "ViewControllerAnimatedTransitioningDelegate.h"
#import "ViewControllerInteractiveTransitioningDelegate.h"

static NSString *photoFrameCellID = @"PhotoFrameCell";

@interface PhotoDetailViewController ()<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>

@property (nonatomic, strong) PhotoFrameTableView *tableView;

@property (strong, nonatomic) NSArray *photosList;
@property (nonatomic, strong) NSMutableDictionary *cellScrollViewOffsetRecordingDic;
@property (nonatomic, assign) CGFloat storageTableViewOffsetY;

@property (nonatomic, strong) ViewControllerAnimatedTransitioningDelegate *VCAnimatedTransitioning;
@property (nonatomic, strong) ViewControllerInteractiveTransitioningDelegate *VCInteractiveTransitioning;

@end

@implementation PhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *photoPath = [self photosDirectory];
    self.photosList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:photoPath error:nil];
    self.cellScrollViewOffsetRecordingDic = [NSMutableDictionary dictionary];
    [self.view addSubview:self.tableView];
    [self makeConstraints];

    self.navigationController.delegate = self;
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
        PhotoDetailViewController *detailVC = [[PhotoDetailViewController alloc] init];
        [ss.navigationController pushViewController:detailVC animated:YES];
    };

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.photosList.count;
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
    return self.VCInteractiveTransitioning;
    
}

//Called to allow the delegate to return a noninteractive animator object for use during view controller transitions.
//返回控制器过渡期间非交互式动画对象
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  API_AVAILABLE(ios(7.0)) {
    //push和pop的过渡动画对象
    return self.VCAnimatedTransitioning;
    
}

@end
