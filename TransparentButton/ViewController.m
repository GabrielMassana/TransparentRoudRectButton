//
//  ViewController.m
//  TransparentButton
//
//  Created by GabrielMassana on 05/01/2015.
//  Copyright (c) 2015 GabrielMassana. All rights reserved.
//

#import "ViewController.h"
#import "ButtonsView.h"

@interface ViewController ()

@property (nonatomic, strong) ButtonsView *buttonsView;

@end

@implementation ViewController

#pragma mark - ViewLifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    imageView.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:imageView];
    
    self.buttonsView = [[ButtonsView alloc]init];
    self.buttonsView.frame = CGRectMake(0,
                                        [[UIScreen mainScreen] bounds].size.height - 300,
                                        [[UIScreen mainScreen] bounds].size.width,
                                        300);
    
    [self.view addSubview:self.buttonsView];
}

#pragma mark - MemoryManagement

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
