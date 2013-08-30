//
//  ABViewController.m
//  UIAdvancedButton
//
//  Created by Shahzin KS on 28/08/13.
//  Copyright (c) 2013 sksarts. All rights reserved.
//

#import "ABViewController.h"

@interface ABViewController ()

@property (nonatomic,strong) NSArray *dataSource;
@end


@implementation ABViewController{
    BOOL keyBoardVisible;
    __weak UITapGestureRecognizer *tapRecognizer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.dataSource=@[
                            @(UIAdvancedButtonStylePureBlack),
                            @(UIAdvancedButtonStyleClassyBlue),
                            @(UIAdvancedButtonStyleGrayMix),
                            @(UIAdvancedButtonStyleGloxyGray),
                            @(UIAdvancedButtonStyleTellyGreen),
                            @(UIAdvancedButtonStyleRoyalRed),
                            @(UIAdvancedButtonStyleRoyalGreen),
                            @(UIAdvancedButtonStyleRoyalBlue)
                    ];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
}

- (IBAction)didChangedShadowValue:(id)sender {
    
    UISwitch *shadowSwitch=(UISwitch *)sender;
    [self.advancedButton setShadow:[shadowSwitch isOn] shadowRadius:2.0 shadowColor:nil];
}

- (IBAction)didChangedGlowValue:(id)sender {
    UISwitch *glowSwitch=(UISwitch *)sender;
    NSLog(@"In set glow %@",[glowSwitch isOn]?@"Yes":@"No");
    [self.advancedButton setGlow:[glowSwitch isOn]];
}

- (IBAction)didTappedClickMeButton:(id)sender {
    
}
#pragma mark -
#pragma mark Utilities
#pragma mark -

-(NSString *)getStyleNameFromStyle:(UIAdvancedButtonStyle)style{
    NSString *styleName;
    switch(style){
        case UIAdvancedButtonStylePureBlack:{
            styleName=@"Pure Black";
        }break;
        
        case UIAdvancedButtonStyleClassyBlue:{
            styleName=@"Classy Blue";
        }break;
            
        case UIAdvancedButtonStyleGrayMix:{
            styleName=@"Gray Mix";
        }break;
            
        case UIAdvancedButtonStyleGloxyGray:{
            styleName=@"Glossy Gray";
        }break;
            
        case UIAdvancedButtonStyleTellyGreen:{
            styleName=@"Telly Green";
        }break;
            
        case UIAdvancedButtonStyleRoyalRed:{
            styleName=@"Royal Red";
        }break;
            
        case UIAdvancedButtonStyleRoyalGreen:{
            styleName=@"Royal Green";
        }break;
            
        case UIAdvancedButtonStyleRoyalBlue:{
            styleName=@"Royal Blue";
        }break;
        
        default:{
            styleName=@"Simple";
        }break;
    }
    return styleName;
}

#pragma mark -
#pragma mark Pickerview Delegate / Datasource
#pragma mark -

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.dataSource count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    UIAdvancedButtonStyle style=(UIAdvancedButtonStyle)[[self.dataSource objectAtIndex:row] integerValue];
    return [self getStyleNameFromStyle:style];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    UIAdvancedButtonStyle style=(UIAdvancedButtonStyle)[[self.dataSource objectAtIndex:row] integerValue];
    
    if([self.animatesSwitch isOn]){
        [self.advancedButton animateToStyle:style duration:0.4];
    }else{
        [self.advancedButton setButtonStyle:style];
    }
}

#pragma mark -
#pragma mark Text Field Delegate
#pragma mark -

-(void)addTouchGestureToView{
    if(tapRecognizer){
        [self removeTouchGestureFromView];
    }
    
    UITapGestureRecognizer *recognizer=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTappedMainView:)];
    
    [self.view addGestureRecognizer:recognizer];
    tapRecognizer=recognizer;
}

-(void)removeTouchGestureFromView{
    if(tapRecognizer){
        [self.view removeGestureRecognizer:tapRecognizer];
        tapRecognizer=nil;
    }
}

-(void) didTappedMainView:(UITapGestureRecognizer *)recognizer{
    if([self.textField isFirstResponder]){
        [self.textField resignFirstResponder];
    }else{
        [self.radiusField resignFirstResponder];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"Began editing");
    keyBoardVisible=YES;
    [self addTouchGestureToView];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"Did End editing");
    if(textField==self.textField){
        //Change text
        [self.advancedButton setText:textField.text];
    }else if(textField==self.radiusField){
        //
        CGFloat radius=[[self.radiusField text] floatValue];
        [self.advancedButton setCornerRadius:radius];
    }
    [self removeTouchGestureFromView];
    keyBoardVisible=NO;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


@end
