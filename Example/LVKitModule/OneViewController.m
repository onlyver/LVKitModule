/*
 Copyright (C) 2018 Apple Inc. All Rights Reserved.
  See LICENSE.txt for this sample’s licensing information
  
  Abstract:
  The view controller for page one. 
 */

#import "OneViewController.h"

@interface OneViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

#pragma mark -

@implementation OneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tabBarItem setTitle:@"one"];
    _dataArray = @[@"Mac Pro", @"Mac mini", @"iMac", @"MacBook", @"MacBook Pro", @"MacBook Air"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kCellID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}


@end
