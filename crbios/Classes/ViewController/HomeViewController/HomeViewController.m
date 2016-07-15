//
//  HomeViewController.m
//  crbios
//
//  Created by  on 7/7/16.
//  Copyright © 2016 framgia. All rights reserved.
//

#import "HomeViewController.h"
#import "CustomCellHeader.h"
#import "CustomCellDay.h"
#import "CustomCellContent.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *homeTableView;
@property (weak, nonatomic) IBOutlet UIButton *btnCreateEvent;
- (IBAction)btnCreateEvent:(id)sender;

@end

@implementation HomeViewController

NSInteger _positionTableView = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 25;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 || indexPath.row == 10) {
        CustomCellHeader *cellHeader = [tableView dequeueReusableCellWithIdentifier:@"CellHeader" forIndexPath:indexPath];
        cellHeader.selectionStyle = UITableViewCellSelectionStyleNone;
        return cellHeader;
    } else if (indexPath.row == 1 || indexPath.row == 5 || indexPath.row == 11) {
        CustomCellDay *cellDay = [tableView dequeueReusableCellWithIdentifier:@"CellDay" forIndexPath:indexPath];
        cellDay.selectionStyle = UITableViewCellSelectionStyleNone;
        return cellDay;
    } else {
        CustomCellContent *cellContent = [tableView dequeueReusableCellWithIdentifier:@"CellContent" forIndexPath:indexPath];
        return cellContent;
    }
}

- (NSInteger)getPositionFirstCellInTableView {
    NSArray *visibleCellsList = [self.homeTableView visibleCells];
    if (visibleCellsList.count > 0) {
        NSIndexPath *indexPath = [self.homeTableView indexPathForCell:visibleCellsList[0]];
        return indexPath.row;
    }
    return 0;
}

#pragma mark - Event Scroll

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _positionTableView = [self getPositionFirstCellInTableView];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger currentPosition = [self getPositionFirstCellInTableView];
    if (currentPosition > _positionTableView) {
        _positionTableView = currentPosition;
        NSLog(@">> Scroll Down");
        [self.btnCreateEvent setHidden:YES];
    } else if (currentPosition < _positionTableView) {
        _positionTableView = currentPosition;
        NSLog(@">> Scroll Up");
        [self.btnCreateEvent setHidden:NO];
    }
}

#pragma mark - Click Button

- (IBAction)btnCreateEvent:(id)sender {
}

@end
