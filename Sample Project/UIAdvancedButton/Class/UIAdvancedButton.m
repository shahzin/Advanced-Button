//
//  UIAdvancedButton.h
//  AdvancedButton
//
//  Created by shahzin ks on 10/01/12.
//  Copyright (c) 2013 SKSArts.com All rights reserved.
//

#import "UIAdvancedButton.h"


@interface UIAdvancedButton(){
    
}

@property(nonatomic,readonly) BOOL hasShadow;
@property(nonatomic,readonly) BOOL hasGlow;
@property(nonatomic,readonly) CGFloat cornerRadius;
@property(nonatomic,strong,readonly) NSArray *backgroundColors;
@property(nonatomic,strong,readonly) UIColor *shadowColor;

@end

@implementation UIAdvancedButton{
    CALayer *touchLayer,*glowBaseLayer;
    CAGradientLayer *glowLayer;
    NSArray *animationColors;
}

#pragma mark -
#pragma mark Initialisation
#pragma mark -

-(id) initWithFrame:(CGRect)frame text:(NSString *)text cornerRadius:(CGFloat)cornerRadius backgroundColors:(NSArray *)backgroundColors hasShadow:(BOOL)hasShadow hasGlow:(BOOL) hasGlow{
    self=[super initWithFrame:frame];
    if(self){
        [self initText:text cornerRadius:cornerRadius backgroundColors:backgroundColors hasShadow:hasShadow hasGlow:hasGlow];
    }
    return self;
}

-(id) initWithFrame:(CGRect)frame text:(NSString *)text cornerRadius:(CGFloat)cornerRadius buttonStyle:(UIAdvancedButtonStyle)buttonStyle hasShadow:(BOOL)hasShadow hasGlow:(BOOL) hasGlow{
    
    self=[super initWithFrame:frame];
    if(self){
        [self initText:text cornerRadius:cornerRadius buttonStyle:buttonStyle hasShadow:hasShadow hasGlow:hasGlow];
    }
    return self;
}

-(id)init{
    self=[super init];
    if(self){
        [self initText:@"Label" cornerRadius:4.0 buttonStyle:UIAdvancedButtonStylePureBlack hasShadow:NO hasGlow:NO];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    self=[self initWithFrame:frame text:@"Label" cornerRadius:4.0 buttonStyle:UIAdvancedButtonStylePureBlack hasShadow:NO hasGlow:NO];
    if(self){
        
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if(self){
        [self initText:self.titleLabel.text cornerRadius:4.0 buttonStyle:UIAdvancedButtonStylePureBlack hasShadow:YES hasGlow:YES];
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    [self updateLayout];
}

-(void)dealloc{
    _backgroundColors=nil;
    touchLayer=nil;
    glowLayer=nil;
    glowBaseLayer=nil;
}

+(Class)layerClass{
    return [CAGradientLayer class];
}

#pragma mark -
#pragma mark Utilities
#pragma mark -

-(void)initText:(NSString *)text cornerRadius:(CGFloat)cornerRadius buttonStyle:(UIAdvancedButtonStyle)buttonStyle hasShadow:(BOOL)hasShadow hasGlow:(BOOL)hasGlow{
    _cornerRadius=cornerRadius;
    _backgroundColors=[self getColorsForColorStyle:buttonStyle];
    _hasShadow=hasShadow;
    _hasGlow=hasGlow;
    [self setText:text];
    [self updateLayout];
}


-(void)initText:(NSString *)text cornerRadius:(CGFloat)cornerRadius backgroundColors:(NSArray *)backgroundColors hasShadow:(BOOL)hasShadow hasGlow:(BOOL)hasGlow{
    _cornerRadius=cornerRadius;
    _hasShadow=hasShadow;
    _hasGlow=hasGlow;
    _backgroundColors=[backgroundColors copy];
    [self setText:text];
    [self updateLayout];
}

-(NSArray *) getColorsForColorStyle:(UIAdvancedButtonStyle)buttonStyle{
    NSArray *colors;
    
    switch(buttonStyle){
        case UIAdvancedButtonStylePureBlack:{
            colors=[NSArray arrayWithObjects:(id)[UIColor blackColor].CGColor,[UIColor blackColor].CGColor, nil];
        }break;
        
        case UIAdvancedButtonStyleClassyBlue:{
            
            colors=[NSArray arrayWithObjects:(id)[UIColor colorWithRed:0.008 green:0.392 blue:0.486 alpha:1.0].CGColor,[UIColor colorWithRed:0.189 green:0.56 blue:0.65 alpha:1.0].CGColor,[UIColor colorWithRed:0.008 green:0.392 blue:0.486 alpha:1.0].CGColor, nil];
            
        }break;
        
        case UIAdvancedButtonStyleGrayMix:{
            
            colors=[NSArray arrayWithObjects:(id)[UIColor grayColor].CGColor,[UIColor darkGrayColor].CGColor, nil];
            
        }break;
        
        case UIAdvancedButtonStyleGloxyGray:{
            
            colors=[NSArray arrayWithObjects:(id)[UIColor colorWithWhite:0.6 alpha:1.0].CGColor,[UIColor colorWithWhite:0.2 alpha:1.0].CGColor, [UIColor colorWithWhite:0.6 alpha:1.0].CGColor,nil];
            
        }break;
        
        case UIAdvancedButtonStyleTellyGreen:{
            
            colors=[NSArray arrayWithObjects:(id)[UIColor colorWithRed:0.459 green:0.804 blue:0.471 alpha:1.0].CGColor,[UIColor colorWithRed:0.0196 green:0.510 blue:0.0314 alpha:1.0].CGColor, nil];
            
        }break;
        
        case UIAdvancedButtonStyleRoyalRed:{
            
            colors=[NSArray arrayWithObjects:(id)[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0].CGColor,[UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:1.0].CGColor, nil];
            
        }break;
        
        case UIAdvancedButtonStyleRoyalGreen:{
            
            colors=[NSArray arrayWithObjects:(id)[UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0].CGColor,[UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0].CGColor, nil];
            
        }break;
        
        case UIAdvancedButtonStyleRoyalBlue:{
            
            colors=[NSArray arrayWithObjects:(id)[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0].CGColor,[UIColor colorWithRed:0.0 green:0.0 blue:0.5 alpha:1.0].CGColor, nil];
            
        }break;
            
        default:{
            colors=[NSArray arrayWithObjects:(id)[UIColor blackColor].CGColor,[UIColor blackColor].CGColor, nil];
        }
    }
    return colors;
}


-(void)updateCornerRadius{
    [self.layer setCornerRadius:self.cornerRadius];
}
-(void)updateShadow{
    [self setShadow:self.hasShadow shadowRadius:2.0 shadowColor:self.shadowColor];
}

-(void)updateGlow{
    [self setGlow:self.hasGlow];
}

-(void)updateBackgroundColors{
    [self setBackgroundColors:self.backgroundColors];
}

-(void)updateLayout{
    [self updateBackgroundColors];
    [self updateCornerRadius];
    [self updateShadow];
    [self updateGlow];
}

#pragma mark -
#pragma mark Shadow Glow
#pragma mark -

-(void) addShadow:(CGColorRef)shadowColor radius:(CGFloat)radius{
    _hasShadow=YES;
    self.layer.shadowColor=shadowColor;
    self.layer.shadowOffset=CGSizeMake(0, 1);
    self.layer.shadowRadius=radius;
    self.layer.shadowOpacity=0.8;
    self.layer.shadowPath=[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.cornerRadius].CGPath;
}

-(void)removeShadow{
    _hasShadow=NO;
    self.layer.shadowPath=nil;
    self.layer.shadowOffset=CGSizeMake(0, 0);
    self.layer.shadowRadius=0.0;
    self.layer.shadowColor=[UIColor clearColor].CGColor;
}

-(void)addGlow{
    _hasGlow=YES;
    if(glowBaseLayer==nil){
        glowBaseLayer=[CALayer layer];
    }
    
    if(glowLayer==nil){
        glowLayer=[CAGradientLayer layer];
    }
    
    glowBaseLayer.frame=CGRectMake(1, 0, self.layer.bounds.size.width-2, self.layer.bounds.size.height);
    glowBaseLayer.cornerRadius=self.layer.cornerRadius;
    
    glowLayer.frame=CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height/2);
    glowLayer.colors=[NSArray arrayWithObjects:(id)[UIColor colorWithWhite:1.0 alpha:0.6].CGColor,[UIColor colorWithWhite:1.0 alpha:0.2].CGColor, nil];
    
    if(glowLayer.superlayer==nil){
        [glowBaseLayer addSublayer:glowLayer];
    }
    
    glowBaseLayer.masksToBounds=YES;
    
    if(glowBaseLayer.superlayer==nil){
        [self.layer addSublayer:glowBaseLayer];
    }
}

-(void)removeGlow{
    _hasGlow=NO;
    [glowLayer removeFromSuperlayer];
    [glowBaseLayer removeFromSuperlayer];
    glowLayer=nil;
    glowBaseLayer=nil;
}

#pragma mark -
#pragma mark Public Methods
#pragma mark -

-(void) setShadow:(BOOL)hasShadow shadowRadius:(CGFloat)shadowRadius shadowColor:(UIColor *)shadowColor{
    if(hasShadow){
        if(shadowColor==nil){
            shadowColor=[UIColor blackColor];
        }
        [self addShadow:shadowColor.CGColor radius:shadowRadius];
    }else{
        [self removeShadow];
    }
}

-(void) setGlow:(BOOL)hasGlow{
    if(hasGlow){
        [self addGlow];
    }else{
        [self removeGlow];
    }
}

-(void) setText:(NSString *)text{
    [self setTitle:text forState:UIControlStateNormal];
    [self setTitle:text forState:UIControlStateHighlighted];
    [self setTitle:text forState:UIControlStateDisabled];
}

-(void) setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    [self updateLayout];
}

-(void) setBackgroundColors:(NSArray *)backgroundColors{
    CAGradientLayer *layer=(CAGradientLayer *)self.layer;
    [layer setColors:backgroundColors];
    _backgroundColors=backgroundColors;
}

-(void) setButtonStyle:(UIAdvancedButtonStyle)buttonStyle{
    NSArray *colors=[self getColorsForColorStyle:buttonStyle];
    [self setBackgroundColors:colors];
}

-(void) animateToColors:(NSArray *)colors duration:(CGFloat)duration{
    if(colors==nil){
        return;
    }
    CAGradientLayer *backgroundLayer=(CAGradientLayer *)self.layer;
    CABasicAnimation *animateLayer = [CABasicAnimation animationWithKeyPath:@"colors"];
    animationColors=colors;
    animateLayer.delegate = self;
    animateLayer.fromValue = backgroundLayer.colors;
    animateLayer.toValue = colors;
    animateLayer.duration   = duration;
    animateLayer.removedOnCompletion = NO;
    animateLayer.fillMode=kCAFillModeForwards;
    animateLayer.delegate=self;
    animateLayer.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [backgroundLayer addAnimation:animateLayer forKey:@"animation"];
}

-(void)animateToStyle:(UIAdvancedButtonStyle)style duration:(CGFloat)duration{
    NSArray *colors=[self getColorsForColorStyle:style];
    [self animateToColors:colors duration:duration];
}

-(void) setText:(NSString *)text cornerRadius:(CGFloat)cornerRadius backgroundColors:(NSArray *)backgroundColors hasShadow:(BOOL)hasShadow hasGlow:(BOOL) hasGlow{
    _cornerRadius=cornerRadius;
    _backgroundColors=nil;
    _backgroundColors=backgroundColors;
    _hasShadow=hasShadow;
    _hasGlow=hasGlow;
    [self setText:text];
    [self updateLayout];
}

-(void) setText:(NSString *)text cornerRadius:(CGFloat)cornerRadius buttonStyle:(UIAdvancedButtonStyle)buttonStyle hasShadow:(BOOL)hasShadow hasGlow:(BOOL) hasGlow{
    _cornerRadius=cornerRadius;
    _backgroundColors=nil;
    _backgroundColors=[self getColorsForColorStyle:buttonStyle];
    _hasShadow=hasShadow;
    _hasGlow=hasGlow;
    [self setText:text];
    [self updateLayout];
}

#pragma mark -
#pragma mark animation delegate method

-(void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if(animationColors){
        CAGradientLayer *backgroundLayer=(CAGradientLayer *)self.layer;
        backgroundLayer.colors=animationColors;
        [backgroundLayer removeAllAnimations];
        _backgroundColors=nil;
        _backgroundColors=[animationColors copy];
    }
    animationColors=nil;
}
@end
