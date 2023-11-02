/*
 Copyright (C) 2018 Apple Inc. All Rights Reserved.
  See LICENSE.txt for this sample’s licensing information
  
  Abstract:
  The view controller for page three. 
 */

#import "ThreeViewController.h"

NSString *kBadgeValuePrefKey = @"kBadgeValue";  // badge value key for storing to NSUserDefaults

@interface ThreeViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UIBarButtonItem *doneButton;
@property (nonatomic, strong) UITextField *badgeField;

- (void)doneAction:(id)sender;

@end

#pragma mark -

@implementation ThreeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tabBarItem setTitle:@"three"];
    self.badgeField = UITextField.new;
    NSString *badgeValue = [[NSUserDefaults standardUserDefaults] stringForKey:kBadgeValuePrefKey];
    _doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction:)];
	if (badgeValue.length != 0)
	{
        self.badgeField.text = badgeValue;
        self.navigationController.tabBarItem.badgeValue = self.badgeField.text;
    }
}

- (void)doneAction:(id)sender
{
	// Dismiss the keyboard by resigning our badge edit field as first responder.
	[self.badgeField resignFirstResponder];
	
	// Set the badge value to our tab item (but only if a valid string).
	if (self.badgeField.text.length > 0)
	{
        // A value was entered, because we are inside a navigation controller,
        // we must access its tabBarItem to set the badgeValue.
        self.navigationController.tabBarItem.badgeValue = self.badgeField.text;
	}
    else
    {
        // No value was entered.
        self.navigationController.tabBarItem.badgeValue = nil;
    }
    
    [[NSUserDefaults standardUserDefaults] setValue:self.badgeField.text forKey:kBadgeValuePrefKey];
}


#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	// user is starting to edit, add the done button to the navigation bar
	self.navigationItem.rightBarButtonItem = self.doneButton;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	/// user is done editing, remove the done button from the navigation bar
	self.navigationItem.rightBarButtonItem = nil;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	BOOL result = YES;
	
	// restrict the maximum number of characters to 5
	if (textField.text.length == 5 && string.length > 0)
		result = NO;
	
	return result;
}

@end

