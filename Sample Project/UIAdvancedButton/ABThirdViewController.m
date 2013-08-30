//
//  ABThirdViewController.m
//  UIAdvancedButton
//
//  Created by Shahzin KS on 30/08/13.
//  Copyright (c) 2013 sksarts. All rights reserved.
//

#import "ABThirdViewController.h"

@interface ABThirdViewController ()

@end

@implementation ABThirdViewController

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

-(void)viewWillAppear:(BOOL)animated{
    [self changeButtonStyles];
}

-(UIAdvancedButtonStyle)getStyleForIndex:(NSInteger)index{
    NSLog(@"index %d",index);
    UIAdvancedButtonStyle style=UIAdvancedButtonStylePureBlack;
    switch (index) {
        case 0:{
            style=UIAdvancedButtonStyleClassyBlue;
        }break;
        case 1:{
            style=UIAdvancedButtonStylePureBlack;
        }break;
        
        case 2:{
            style=UIAdvancedButtonStyleGrayMix;
        }break;
        
        case 3:{
            style=UIAdvancedButtonStyleGloxyGray;
        }break;
            
        case 4:{
            style=UIAdvancedButtonStyleRoyalBlue;
        }break;
            
        case 5:{
            style=UIAdvancedButtonStyleRoyalGreen;
        }break;
        case 6:{
            style=UIAdvancedButtonStyleRoyalRed;
        }break;
            
        case 7:{
            style=UIAdvancedButtonStyleTellyGreen;
        }break;
            
        case 8:{
            style=UIAdvancedButtonStyleRoyalRed;
        }break;
    }
    return style;
}
-(void)changeButtonStyles{
    NSInteger i=0;
    for(UIView *view in self.view.subviews){
        if([view isKindOfClass:[UIAdvancedButton class]]){
            UIAdvancedButton *button=(UIAdvancedButton *)view;
            UIAdvancedButtonStyle style=[self getStyleForIndex:i++];
            [button setButtonStyle:style];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTappedCloseButton:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
