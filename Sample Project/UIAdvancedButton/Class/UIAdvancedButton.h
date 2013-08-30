//
//  UIAdvancedButton.h
//  AdvancedButton
//
//  Created by Shahzin KS on 29/08/13.
//  Copyright (c) 2013 sksarts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


/**
 The `UIAdvancedButton` class is a subclass of `UIView` which can be used to create Glossy, 3D like buttons with less than 2 lines of code. Customize the glow, shadow and colors the way you want with easy to use built-in methods. To use this class add the framework [QuartzCore.framework](#) to the project.

 */

@interface UIAdvancedButton : UIButton{
    
}

/* Available predefined button styles */
typedef NS_ENUM(NSUInteger, UIAdvancedButtonStyle){
    UIAdvancedButtonStylePureBlack,
    UIAdvancedButtonStyleClassyBlue,
    UIAdvancedButtonStyleGrayMix,
    UIAdvancedButtonStyleGloxyGray,
    UIAdvancedButtonStyleTellyGreen,
    UIAdvancedButtonStyleRoyalRed,
    UIAdvancedButtonStyleRoyalGreen,
    UIAdvancedButtonStyleRoyalBlue
};

///---------------------------------------------------------------------------------------
/// @name Initializing a View Object
///---------------------------------------------------------------------------------------

/** Returns a advanced button initialized with the specified frame with default label as "Label".
 
 This method initializes and returns the Advanced button object with the specified size and position.
 
 @param frame The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the `center` and `bounds` properties accordingly.
 
 @return An initialized Advanced Button object or `nil` if the object couldn't be created.
 */

-(id) initWithFrame:(CGRect)frame;

/** Returns an advanced button initialized with the specified frame and style.
 
 This method initializes and returns the Advanced button object with the specified size and position and style.
 
 @param frame The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the `center` and `bounds` properties accordingly.
 @param text The text to be displayed in the button.
 @param cornerRadius The radius of the corners to give round rect effect. Give 0 if you want a rectangular base.
 @param style The predefined button style. Instead of specifying colors for the button you can choose from any of the predefined style for the button being made.
 @param hasShadow A `BOOL` which specifies whether the button will have a shadow.
 @param hasGlow A `BOOL` which specifies whether the button will have a glow or glossy effect.
 @return An initialized Advanced Button object or `nil` if the object couldn't be created.
 */

-(id) initWithFrame:(CGRect)frame text:(NSString *)text cornerRadius:(CGFloat)cornerRadius buttonStyle:(UIAdvancedButtonStyle)style hasShadow:(BOOL)hasShadow hasGlow:(BOOL) hasGlow;


/** Returns an advanced button initialized with the specified frame and style.
 
 This method initializes and returns the Advanced button object with the specified size and position and style.
 
 @param frame The frame rectangle for the view, measured in points. The `origin` of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the `center` and `bounds` properties accordingly.
 @param text The text to be displayed in the button.
 @param cornerRadius The radius of the corners to give round rect effect. Give 0 if you want a rectangular base.
 @param backgroundColors A `NSArray` object which should contain one or more `CGColorRef` objects which define the background colors of the button.
 @param hasShadow A `BOOL` which specifies whether the button will have a shadow.
 @param hasGlow A `BOOL` which specifies whether the button will have a glow or glossy effect.
 @return An initialized Advanced Button object or `nil` if the object couldn't be created.
 */

-(id) initWithFrame:(CGRect)frame text:(NSString *)text cornerRadius:(CGFloat)cornerRadius backgroundColors:(NSArray *)backgroundColors hasShadow:(BOOL)hasShadow hasGlow:(BOOL) hasGlow;



///---------------------------------------------------------------------------------------
/// @name Modifying the View Object
///---------------------------------------------------------------------------------------

/** Changes and animate the background color of the button from the current color to specified color.
 
 This method changes the background color to colors specified in the color array and perform a transition animation for the specified duration.
 
 @param colors The colors to be applied to the background.
 @param duration The duration for which the animation should take place.
 */


-(void) animateToColors:(NSArray *)colors duration:(CGFloat)duration;


/** Changes and animate the background color of the button from the current color to specified style.
 
 This method changes the background color to the specified style and perform a transition animation for the specified duration.
 
 @param style The predefined button style.
 @param duration The duration for which the animation should take place.
 */

-(void) animateToStyle:(UIAdvancedButtonStyle)style duration:(CGFloat)duration;


/** Changes the properties of the button instance with the specified frame and style.
 
 This method initializes and returns the Advanced button object with the specified size and position and style.
 
 @param text The text to be displayed in the button.
 @param radius The radius of the corners to give round rect effect. Give 0 if you want a rectangular base.
 @param style The predefined button style.
 @param hasShadow A `BOOL` which specifies whether the button will have a shadow.
 @param hasGlow A `BOOL` which specifies whether the button will have a glow or glossy effect.
 */

-(void) setText:(NSString *)text cornerRadius:(CGFloat)radius buttonStyle:(UIAdvancedButtonStyle)style hasShadow:(BOOL)hasShadow hasGlow:(BOOL) hasGlow;


/** Changes the properties of the button instance with the specified frame and style.
 
 This method initializes and returns the Advanced button object with the specified size and position and style.
 
 @param text The text to be displayed in the button.
 @param radius The radius of the corners to give round rect effect. Give 0 if you want a rectangular base.
 @param colors A `NSArray` object which should contain one or more `CGColorRef` objects which define the background colors of the button.
 @param hasShadow A `BOOL` which specifies whether the button will have a shadow.
 @param hasGlow A `BOOL` which specifies whether the button will have a glow or glossy effect.
 */

-(void) setText:(NSString *)text cornerRadius:(CGFloat)radius backgroundColors:(NSArray *)colors hasShadow:(BOOL)hasShadow hasGlow:(BOOL) hasGlow;


/** Add or remove shadow, changes shadow radius and shadow color of the button.
 
 This method adds/remove the shadow of the button and changes the radius and color of the shadow if any.
 
 @param hasShadow A `BOOL` which specifies whether the button will have a shadow.
 @param radius The radius (spread of the shadow) to be used for the shadow.
 @param color The color to be used for the shadow.
 */

-(void) setShadow:(BOOL)hasShadow shadowRadius:(CGFloat)radius shadowColor:(UIColor *)color;

/** Add or remove the glow effect of the button.
 
 This method Add or remove the glow effect of the button.
 
 @param hasGlow A `BOOL` indicating whether to turn on or off the glow of the button.
 
 */

-(void) setGlow:(BOOL)hasGlow;


/** Changes the title of the button to the specified text.
 
 This method changes the title of the button to the string identified by the `NSString` variable text.
 
 @param text The text of the button to be displayed.
 
 */

-(void) setText:(NSString *)text;

/** Changes the corner radius of the button.
 
 This method changes the corner radius of the button to the value identified by radius.
 
 @param cornerRadius The radius of the corners to give round rect effect. Give 0 if you want a rectangular base.
 
 */
-(void) setCornerRadius:(CGFloat)cornerRadius;


/** Changes the style of the button.
 
 This method changes the style of the button to the specified style.
 
 @param style The predefined button style. Instead of specifying colors for the button you can choose from any of the predefined style for the button being made.
 
 */
-(void) setButtonStyle:(UIAdvancedButtonStyle)style;


/** Changes the background colour of the button.
 
 This method changes the background colour of the button to a gradient formed from the colors in the array..
 
 @param backgroundColors A `NSArray` object which should contain one or more `CGColorRef` objects which define the background colors of the button..
 
 */
-(void) setBackgroundColors:(NSArray *)backgroundColors;

@end
