//
//  SearchViewController.m
//  crbios
//
//  Created by  on 7/11/16.
//  Copyright © 2016 framgia. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UISearchBarDelegate>
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIBarButtonItem *searchItem;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // back button
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:self.navigationItem.backBarButtonItem.style target:nil action:nil];
    // search button
    self.searchItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchButtonTapped:)];
    self.navigationItem.rightBarButtonItem = self.searchItem;
    // search bar
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.searchBar setTintColor:[UIColor colorWithRed:0.81 green:0.58 blue:0.85 alpha:1]];
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.showsCancelButton = NO;
    self.searchBar.placeholder = @"Search";
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
    [self.view addSubview:self.searchBar];
    [self.searchBar becomeFirstResponder];
}

// search button
- (void)searchButtonTapped:(id)sender {
    [self.searchBar resignFirstResponder];
}

#pragma mark - UISearchBarDelegate
// search keyboard
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    // TODO: search here
    NSLog(@"Search here: %@", searchBar.text);
}

@end
