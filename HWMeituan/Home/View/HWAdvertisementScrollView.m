//
//  HWAdvertisementScrollView.m
//  HWMeituan
//
//  Created by 黄文海 on 2018/2/2.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HWAdvertisementScrollView.h"

@interface HWAdvertisementScrollView()<UIScrollViewDelegate>
@property(nonatomic, strong)UIScrollView* scrollView;
@property(nonatomic, strong)UIPageControl* pageControl;
@property(nonatomic, copy)NSArray* imageArray;
@property(nonatomic, assign)NSInteger currentPage;
@property(nonatomic, strong)UIView* firstView;
@property(nonatomic, strong)UIView* middleView;
@property(nonatomic, strong)UIView* lastView;
@property(nonatomic, strong)NSTimer* autoScrollTimer;
@end

@implementation HWAdvertisementScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self loadSubViews];
    }
    
    return self;
}

- (void)loadSubViews {
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    
    _currentPage = 0;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    _scrollView.contentSize = CGSizeMake(3 * width, 0);
    _scrollView.contentOffset = CGPointMake(width, height);
    _scrollView.contentInset = UIEdgeInsetsZero;
    _scrollView.alwaysBounceVertical = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = true;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    
    UIImageView* imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ad1"]];
    UIImageView* imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ad2"]];
    UIImageView* imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ad3"]];
    UIImageView* imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ad4"]];
    UIImageView* imageView5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ad5"]];
    UIImageView* imageView6 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ad6"]];
    _imageArray = @[imageView1,imageView2,imageView3,imageView4,imageView5,imageView6];
    [self addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.numberOfPages = self.imageArray.count;
    CGSize pageSize = [_pageControl sizeForNumberOfPages:_pageControl.numberOfPages];
    pageSize.height = 20;
    CGFloat left = width / 2 - pageSize.width / 2;
    CGFloat top = height - (pageSize.height);
    _pageControl.frame = CGRectMake(left, top, pageSize.width, pageSize.height);
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    [self addSubview:_pageControl];
    
    __weak typeof(self) weakSelf = self;
    _autoScrollTimer = [NSTimer timerWithTimeInterval:3 repeats:true block:^(NSTimer * _Nonnull timer) {
        [weakSelf autoScroll];
    }];
    [[NSRunLoop currentRunLoop] addTimer:_autoScrollTimer forMode:NSDefaultRunLoopMode];
    
    [self reloadData];
    
}

- (void)reloadData {
    
    [self.firstView removeFromSuperview];
    [self.middleView removeFromSuperview];
    [self.lastView removeFromSuperview];
    
    unsigned long count = self.imageArray.count - 1;
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);

    if (_currentPage == 0) {
        self.firstView = self.imageArray[count];
        self.middleView = self.imageArray[0];
        self.lastView = self.imageArray[1];
    } else if (_currentPage == count) {
        self.firstView = self.imageArray[count - 1];
        self.middleView = self.imageArray[count];
        self.lastView = self.imageArray[0];
    } else {
        self.firstView = self.imageArray[_currentPage - 1];
        self.middleView = self.imageArray[_currentPage];
        self.lastView = self.imageArray[_currentPage + 1];
    }
    self.firstView.frame = CGRectMake(0, 0, width, height);
    self.middleView.frame = CGRectMake(width, 0, width, height);
    self.lastView.frame = CGRectMake(width*2, 0, width, height);
    [self.scrollView addSubview:self.firstView];
    [self.scrollView addSubview:self.middleView];
    [self.scrollView addSubview:self.lastView];
    self.scrollView.contentOffset = CGPointMake(width, 0);

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [_autoScrollTimer invalidate];
    _autoScrollTimer = nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {

    __weak typeof(self) weakSelf = self;
    _autoScrollTimer = [NSTimer timerWithTimeInterval:3 repeats:true block:^(NSTimer * _Nonnull timer) {
        [weakSelf autoScroll];
    }];
    [[NSRunLoop currentRunLoop] addTimer:_autoScrollTimer forMode:NSDefaultRunLoopMode];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    int index = scrollView.contentOffset.x / scrollView.frame.size.width;
    if (index == 0) {
        self.currentPage--;
        if (self.currentPage == -1) self.currentPage = self.imageArray.count - 1;
    } else if (index == 2){
        self.currentPage = (self.currentPage + 1) % self.imageArray.count;
    }
    self.pageControl.currentPage = self.currentPage;
    [self reloadData];

}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self reloadData];
}

- (void)autoScroll {
    _currentPage = (_currentPage + 1) % self.imageArray.count;
    CGFloat width = CGRectGetWidth(self.frame);
    self.pageControl.currentPage = _currentPage;
    [self.scrollView setContentOffset:CGPointMake(2 * width, 0) animated:true];
}

@end
