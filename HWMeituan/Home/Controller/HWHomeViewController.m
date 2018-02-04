//
//  HWHomeViewController.m
//  HWMeituan
//
//  Created by 黄文海 on 2018/2/2.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HWHomeViewController.h"
#import "HWAdvertisementScrollView.h"
#import "HWItemButton.h"
#import "HWButtonModel.h"
#import "HWMenuView.h"
#import "UIView+Frame.h"
#import "DiscountModel.h"
#import "DiscountViewCell.h"
#import "HWGuessLikeCell.h"
#import "NetWork.h"
#import "HWGetUrlString.h"
#import "NSObject+MJKeyValue.h"

@interface HWHomeViewController ()<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UISearchBar* searchBar;
@property(nonatomic, strong)HWAdvertisementScrollView* advertise;
@property(nonatomic, strong)UITableView* tableView;
@property(nonatomic, strong)HWMenuView* menuView;
@property(nonatomic, copy)NSMutableArray* dataSource;
@end

@implementation HWHomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setAdvertise];
    [self setupNav];
    [self setSearch];
    [self setMenuView];
    [self setUpTableView];

}

- (void)setAdvertise {
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    _advertise = [[HWAdvertisementScrollView alloc] initWithFrame:CGRectMake(0, 0, width, 100)];
    _advertise.backgroundColor = [UIColor redColor];
    
}

- (void)setUpTableView {
    
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    
    UIView* headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, _advertise.height + _menuView.height)];
    [headView addSubview:_advertise];
    [headView addSubview:_menuView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 100;
    _tableView.tableHeaderView = headView;
    _tableView.tableFooterView = [[UIView alloc] init];
    [_tableView registerClass:[DiscountViewCell class] forCellReuseIdentifier:@"discount"];
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HWGuessLikeCell class]) bundle:nil] forCellReuseIdentifier:@"guess"];
    
    [self.view addSubview:_tableView];
    
    DiscountModel* model1 = [[DiscountModel alloc] init];
    model1.flagUrl = @"leftContent";
    model1.title = @"华莱士";
    
    DiscountModel* model2 = [[DiscountModel alloc] init];
    model2.flagUrl = @"topContent";
    model2.title = @"豪客嘉族";
    
    DiscountModel* model3 = [[DiscountModel alloc] init];
    model3.flagUrl = @"bottomleftcontent";
    model3.title = @"满天星住宿";
    
    DiscountModel* model4 = [[DiscountModel alloc] init];
    model4.flagUrl = @"bottomrightcontent";
    model4.title = @"武汉欢乐谷";
    NSArray* discountArray = @[model1, model2, model3,model4];
    
    _dataSource = [[NSMutableArray alloc] init];
    
    __weak typeof(self) weakSelf = self;
    [NetWork sendGetUrl:[HWGetUrlString sharedManager].urlWithRecomment withParams:nil success:^(id responseBody) {
        NSLog(@"%@",responseBody);
        NSMutableArray *dictArray = [responseBody objectForKey:@"data"];
        for (int i = 0; i < dictArray.count; i++) {
            HWProductModel* productModel = [HWProductModel objectWithKeyValues:dictArray[i]];
            [weakSelf.dataSource addObject:productModel];
        }
        [weakSelf.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"error");
    }];    
    
    [_dataSource addObject:discountArray];
}

- (void)setMenuView {
    
    HWButtonModel* model1 = [[HWButtonModel alloc] init];
    model1.imageUrl = @"icon_homepage_foodCategory";
    model1.title = @"美食";
    HWButtonModel* model2 = [[HWButtonModel alloc] init];
    model2.imageUrl = @"icon_homepage_movieCategory";
    model2.title = @"电影/演出";
    HWButtonModel* model3 = [[HWButtonModel alloc] init];
    model3.imageUrl = @"icon_homepage_hotelCategory";
    model3.title = @"酒店住宿";
    HWButtonModel* model4 = [[HWButtonModel alloc] init];
    model4.imageUrl = @"icon_homepage_entertainmentCategory";
    model4.title = @"休闲娱乐";
    HWButtonModel* model5 = [[HWButtonModel alloc] init];
    model5.imageUrl = @"icon_homepage_takeoutCategory";
    model5.title = @"外卖";
    HWButtonModel* model6 = [[HWButtonModel alloc] init];
    model6.imageUrl = @"ktv";
    model6.title = @"KTV";
    HWButtonModel* model7 = [[HWButtonModel alloc] init];
    model7.imageUrl = @"hair";
    model7.title = @"丽人/美发";
    HWButtonModel* model8 = [[HWButtonModel alloc] init];
    model8.imageUrl = @"airplant";
    model8.title = @"机票/火车票";
    HWButtonModel* model9 = [[HWButtonModel alloc] init];
    model9.imageUrl = @"mountain";
    model9.title = @"周边游";
    HWButtonModel* model10 = [[HWButtonModel alloc] init];
    model10.imageUrl = @"travel";
    model10.title = @"旅游出行";
    HWButtonModel* model11 = [[HWButtonModel alloc] init];
    model11.imageUrl = @"slight";
    model11.title = @"景点/门票";
    HWButtonModel* model12 = [[HWButtonModel alloc] init];
    model12.imageUrl = @"weddingdress";
    model12.title = @"婚纱摄影";
    HWButtonModel* model13 = [[HWButtonModel alloc] init];
    model13.imageUrl = @"dormitory";
    model13.title = @"糖果名宿";
    HWButtonModel* model14 = [[HWButtonModel alloc] init];
    model14.imageUrl = @"purchasing";
    model14.title = @"跑腿代沟";
    HWButtonModel* model15 = [[HWButtonModel alloc] init];
    model15.imageUrl = @"all_type";
    model15.title = @"全部分类";
    NSArray* modelArray = @[model1,model2,model3,model4,model5,model6,model7,model8,model9,model10,model11,model12,model13,model14,model15];
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    CGFloat spare = 10;
    CGFloat menuHeight = (width - spare * 6) / 5 * 3 + 2 * spare;
    _menuView = [[HWMenuView alloc] initWithFrame:CGRectMake(0, self.advertise.dtHeight, width, menuHeight)];
    _menuView.modelArray = modelArray;
    
}

- (void)setSearch {
    
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.backgroundColor = [UIColor clearColor];
    _searchBar.showsCancelButton = NO;
    _searchBar.tintColor = [UIColor orangeColor];
    _searchBar.placeholder = @"外婆家";
    _searchBar.delegate = self;
    
    for (UIView *subView in _searchBar.subviews) {
        if ([subView isKindOfClass:[UIView  class]]) {
            [[subView.subviews objectAtIndex:0] removeFromSuperview];
            if ([[subView.subviews objectAtIndex:0] isKindOfClass:[UITextField class]]) {
                UITextField *textField = [subView.subviews objectAtIndex:0];
                textField.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
                
                UIColor *color = [UIColor grayColor];
                [textField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"外婆家"
                                                                        attributes:@{NSForegroundColorAttributeName:color}]];
                //修改默认的放大镜图片
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 13, 13)];
                imageView.backgroundColor = [UIColor clearColor];
                imageView.image = [UIImage imageNamed:@"gww_search_ misplaces"];
                textField.leftView = imageView;
            }
        }
    }
    
    self.navigationItem.titleView = _searchBar;
}

- (void)setupNav {
    
    UIButton* leftButton = [[UIButton alloc] init];
    [leftButton setTitle:@"武汉" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(btn_leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    UIButton* rightButton = [[UIButton alloc] init];
    [rightButton setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(btn_rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
}

- (void)btn_leftBtnClick:(id)sender {
    
}

- (void)btn_rightBtnClick:(id)sender {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 250;
    }
    
    return 100;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell;
    if (indexPath.row == 0) {
        DiscountViewCell* discountCell = [tableView dequeueReusableCellWithIdentifier:@"discount"];
        discountCell.modelArray = (NSArray*)self.dataSource[0];
        cell = (UITableViewCell*)discountCell;
    } else {
        HWGuessLikeCell* guessCell = [tableView dequeueReusableCellWithIdentifier:@"guess"];
        guessCell.model = (HWProductModel*)self.dataSource[indexPath.row];
        cell = (UITableViewCell*)guessCell;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:UIEdgeInsetsMake(0, 5, 0, 5)];
        
    }
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 5, 0, 5)];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
