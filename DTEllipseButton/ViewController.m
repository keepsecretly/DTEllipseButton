//
//  ViewController.m
//  DTEllipseButton
//
//  Created by NiM on 1/9/2560 BE.
//  Copyright © 2560 Sopana Thitipariwat. All rights reserved.
//

#import "ViewController.h"
#import "DTEllipseButton.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet DTEllipseButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.button setImage:[UIImage imageNamed:@"ic_tab_appbonus_gift"] forState:UIControlStateNormal];
//    [self.button setImage:[UIImage imageNamed:@"ic_tab_reward_category"] forState:UIControlStateNormal];
//    [self.button setImage:[UIImage imageNamed:@"01"] forState:UIControlStateNormal];
//    [self.button setTitle:@"Lorem ipsum le poriem  ipsum" forState:UIControlStateNormal];
    [self.button setTitle:@"Lorem" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.button.backgroundColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonAction:(id)sender
{
    NSLog(@"tap");
}

@end
