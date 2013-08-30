//
//  ABSecondViewController.h
//  UIAdvancedButton
//
//  Created by Shahzin KS on 29/08/13.
//  Copyright (c) 2013 sksarts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIAdvancedButton.h"

@interface ABSecondViewController : UIViewController{
    
}

@property (weak, nonatomic) IBOutlet UIAdvancedButton *closeButton;

@property (weak, nonatomic) IBOutlet UIAdvancedButton *createButton;

- (IBAction)didTappedCloseButton:(id)sender;

- (IBAction)didTappedCreateButton:(id)sender;

@end
