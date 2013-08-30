//
//  ABSecondViewController.m
//  UIAdvancedButton
//
//  Created by Shahzin KS on 29/08/13.
//  Copyright (c) 2013 sksarts. All rights reserved.
//

#import "ABSecondViewController.h"

@interface ABSecondViewController ()

@property (nonatomic,weak) UIAdvancedButton *createdButton;
@end

@implementation ABSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.closeButton setButtonStyle:UIAdvancedButtonStyleRoyalRed];
    [self.createButton setButtonStyle:UIAdvancedButtonStyleRoyalGreen];
    //[self.createButton setShadow:NO shadowRadius:0.0 shadowColor:nil];
}

- (IBAction)didTappedCloseButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTappedCreateButton:(id)sender {
    
    if(self.createdButton==nil){
        NSLog(@"Creating button");
        UIAdvancedButton *button=[[UIAdvancedButton alloc] initWithFrame:CGRectMake(10, self.view.bounds.size.height/2-50, self.view.bounds.size.width-20, 100) text:@"Hellooo !" cornerRadius:10.0 buttonStyle:UIAdvancedButtonStyleRoyalBlue hasShadow:YES hasGlow:YES];
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
        [button.titleLabel setShadowOffset:CGSizeMake(0, 2)];
        [button.titleLabel setShadowColor:[UIColor blackColor]];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(didTappedCreatedButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        self.createdButton=button;
        button=nil;
    }
}

-(void)didTappedCreatedButton:(id)sender{
    [self performSegueWithIdentifier:@"third" sender:nil];
}

@end
