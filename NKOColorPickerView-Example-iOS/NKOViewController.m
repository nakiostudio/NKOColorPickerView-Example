//
//  NKOViewController.m
//  ColorPicker-Demo
//
//  Created by Carlos Vidal Pallín on 02/03/2014.
//  Copyright (c) 2014 nakioStudio. All rights reserved.
//

#import "NKOViewController.h"
#import "NKOColorPickerView.h"

@interface NKOViewController()

@property (nonatomic, weak) IBOutlet NKOColorPickerView *pickerView;
@property (nonatomic, weak) IBOutlet UIButton *button;

@end

@implementation NKOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __weak NKOViewController *weakSelf = self;
    
    [self.pickerView setDidChangeColorBlock:^(UIColor *color){
        [weakSelf _customizeButton];
    }];
    
    [self.pickerView setTintColor:[UIColor darkGrayColor]];
    
    [self _customizeButton];
}

#pragma mark - Private methods
- (void)_customizeButton
{
    self.button.layer.cornerRadius = 6;
    self.button.backgroundColor = self.pickerView.color;
}

- (IBAction)_onButtonClick:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/carlostify"]];
}

@end
