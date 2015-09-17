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

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.button.layer.cornerRadius = 6;
    
    [self _setupColorPicker];
    [self _customizeButtonWithColor:self.pickerView.color];
}

#pragma mark - Private methods

- (void)_setupColorPicker
{
    __weak typeof(self) weakSelf = self;
    id changeColorBlock = ^(UIColor *color){
        typeof(self) strongSelf = weakSelf;
        [strongSelf _customizeButtonWithColor:color];
    };
    
    [self.pickerView setDidChangeColorBlock:changeColorBlock];
    [self.pickerView setColor:[UIColor colorWithRed:0.329f green:0.718f blue:1.f alpha:1.f]];
    [self.pickerView setTintColor:[UIColor darkGrayColor]];
}

- (void)_customizeButtonWithColor:(UIColor*)color {
    self.button.backgroundColor = self.pickerView.color;
}

- (IBAction)_onButtonClick:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/carlostify"]];
}

@end
