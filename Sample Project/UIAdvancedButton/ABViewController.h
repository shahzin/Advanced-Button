//
//  ABViewController.h
//  UIAdvancedButton
//
//  Created by Shahzin KS on 28/08/13.
//  Copyright (c) 2013 sksarts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIAdvancedButton.h"

@interface ABViewController : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>


@property (weak, nonatomic) IBOutlet UIAdvancedButton *advancedButton;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UITextField *radiusField;

@property (weak, nonatomic) IBOutlet UISwitch *animatesSwitch;

- (IBAction)didChangedShadowValue:(id)sender;

- (IBAction)didChangedGlowValue:(id)sender;

- (IBAction)didTappedClickMeButton:(id)sender;

@end
