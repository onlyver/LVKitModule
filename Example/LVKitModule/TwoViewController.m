/*
 Copyright (C) 2018 Apple Inc. All Rights Reserved.
  See LICENSE.txt for this sample’s licensing information
  
  Abstract:
  The view controller for page two. 
 */

#import "TwoViewController.h"

NSString *kRainbowImageName = @"Rainbow";
NSString *kSunsetImageName = @"Sunset";

@interface TwoViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

#pragma mark -

@implementation TwoViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
    [self.tabBarItem setTitle:@"two"];
	self.dataArray = @[kRainbowImageName, kSunsetImageName];
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *kCellID = @"cellIDTwo";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
	cell.textLabel.text = self.dataArray[indexPath.row];
	
	return cell;
}

@end
