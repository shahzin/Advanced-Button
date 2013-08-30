##UIADvancedButton


UIAdvancedButton is a subclass of UIView which can be used to create glossy, 3D buttons with less than 2 lines of code. Customize the glow, shadow and colors the way you want with easy to use fully documented built-in methods. Now Supports ARC and Auto-layout.

Features

 - Use a single color or an array of colors as the button background color, and apply any color combinations 
 - Background color animation between color sets, on demand
 - Customize the text font and size to any supported font 
 - Customize the shadow color and radius 
 - Gesture recognition 
 - Use the built in button styles or create new ones to fit your app design
 - Do away with images for gradient effects



**Overview**

You can customize the glow, shadow and colors with the built-in methods.  To use this class add the QuartzCore.framework to your project.

**Initializing a View Object**

- initWithFrame:
 - initWithFrame:text:cornerRadius:buttonStyle:hasShadow:hasGlow: 
 - initWithFrame:text:cornerRadius:backgroundColors:hasShadow:hasGlow:

**Modifying a View Object**

 - animateToColors:duration:
 - animateToStyle:duration:
 - setText:cornerRadius:buttonStyle:hasShadow:hasGlow:
 - setText:cornerRadius:backgroundColors:hasShadow:hasGlow:
 - setShadow:shadowRadius:shadowColor:
 - setGlow:
 - setText:
 - setCornerRadius:
 - setButtonStyle:
 - setBackgroundColors:
        
## Instance Methods

### initWithFrame
Returns a advanced button initialized with the specified frame with default label as "Label".

    - (id)initWithFrame:(CGRect *)frame
    
**Parameters**

`frame`
The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the center and bounds properties accordingly.

**Return Value**
An initialized Advanced Button object or nil if the object couldn't be created.

**Description**
This method initializes and returns the Advanced button object with the specified size and position.

### initWithFrame:text:cornerRadius:buttonStyle:hasShadow:hasGlow:
    
Returns an advanced button initialized with the specified frame and style.

    - (id)initWithFrame:(CGRect *)frame text:(NSString *)text cornerRadius:(CGFloat *)radius buttonStyle:(UIAdvancedButtonStyle)style hasShadow:(BOOL)hasShadow hasGlow:(BOOL)hasGlow

**Parameters**

`frame`
The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the center and bounds properties accordingly.

`text`
The text to be displayed in the button.

`radius`
The radius of the corners to give round rect effect. Give 0 if you want a rectangular base. 

`style`
The predefined button style. Instead of specifying colors for the button you can choose from any of the predefined style for the button being made.
Currently available styles are

    UIAdvancedButtonStylePureBlack
    UIAdvancedButtonStyleClassyBlue
    UIAdvancedButtonStyleGrayMix
    UIAdvancedButtonStyleGloxyGray
    UIAdvancedButtonStyleTellyGreen
    UIAdvancedButtonStyleRoyalRed
    UIAdvancedButtonStyleRoyalGreen
    UIAdvancedButtonStyleRoyalBlue

`hasShadow`
A BOOL which specifies whether the button will have a shadow.

`hasGlow`
A BOOL which specifies whether the button will have a glow or glossy effect.

**Return Value**

An initialized Advanced Button object or nil if the object couldn't be created.

**Description**

This method initializes and returns the Advanced button object with the specified size, position and style.

### initWithFrame:text:cornerRadius:backgroundColors:hasShadow:hasGlow:
Returns an advanced button initialized with the specified frame and style.

    - (id)initWithFrame:(CGRect *)frame text:(NSString *)text cornerRadius:(CGFloat *)radius backgroundColors:(NSArray *)colors hasShadow:(BOOL)hasShadow hasGlow:(BOOL)hasGlow

**Parameters**

`frame`
The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the center and bounds properties accordingly.

`text`
The text to be displayed in the button.

`radius`
The radius of the corners to give round rect effect. Give 0 if you want a rectangular base. 

`colors`
A NSArray object  which should contain one or more CGColorRef objects which define the background colors of the button. 

`hasShadow`
A BOOL which specifies whether the button will have a shadow.

`hasGlow`
A BOOL which specifies whether the button will have a glow or glossy effect.

**Return Value**

An initialized Advanced Button object or nil if the object couldn't be created.

**Description**

This method initializes and returns the Advanced button object with the specified size, position and style.

### animateToColors:duration:
Changes and animate the background color of the button from the current color to specified color.

    - (void) animateToColors:(NSArray *)colors duration:(CGFloat)duration

**Parameters**

`colors`
The colors to be applied to the background.

`duration`
The duration for which the animation should take place.

**Description**

This method changes the background color to colors specified in the color array and perform a transition animation for the specified duration.

### animateToStyle:duration:
Changes and animate the background color of the button from the current color to specified color.

    -(void) animateToStyle:(UIAdvancedButtonStyle)style duration:(CGFloat)duration

**Parameters**

`style`
The predefined button style.

`duration`
The duration for which the animation should take place.

**Description**

This method changes the background color to colors specified in the color array and perform a transition animation for the specified duration.


### setText:cornerRadius:buttonStyle:hasShadow:hasGlow:
Changes the properties of the button instance with the specified frame and style.

    - (void)setText:(NSString *)text cornerRadius:(CGFloat *)radius buttonStyle:(UIAdvancedButtonStyle)style hasShadow:(BOOL)hasShadow hasGlow:(BOOL)hasGlow

**Parameters**

`text`
The text to be displayed in the button.

`radius`
The radius of the corners to give round rect effect. Give 0 if you want a rectangular base. 

`style`
The predefined button style. Instead of specifying colors for the button you can choose from any of the predefined style for the button being made.
Currently available styles are

    UIAdvancedButtonStylePureBlack
    UIAdvancedButtonStyleClassyBlue
    UIAdvancedButtonStyleGrayMix
    UIAdvancedButtonStyleGloxyGray
    UIAdvancedButtonStyleTellyGreen
    UIAdvancedButtonStyleRoyalRed
    UIAdvancedButtonStyleRoyalGreen
    UIAdvancedButtonStyleRoyalBlue

`hasShadow`
A BOOL which specifies whether the button will have a shadow.

`hasGlow`
A BOOL which specifies whether the button will have a glow or glossy effect.

**Description**

This method initializes the Advanced button object with the specified size and position and style

### setText:cornerRadius:backgroundColors:hasShadow:hasGlow: Changes the properties of the button instance with the specified frame and style.

    - (void)setText:(NSString *)text cornerRadius:(CGFloat *)radius backgroundColors:(NSArray *)colors hasShadow:(BOOL)hasShadow hasGlow:(BOOL)hasGlow
**Parameters**

`frame`
The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the center and bounds properties accordingly.

`text`
The text to be displayed in the button.

`radius`
The radius of the corners to give round rect effect. Give 0 if you want a rectangular base. 

`colors`
A NSArray object  which should contain one or more CGColorRef objects which define the background colors of the button. 

`hasShadow`
A BOOL which specifies whether the button will have a shadow.

`hasGlow`
A BOOL which specifies whether the button will have a glow or glossy effect.

**Description**

This method initializes  the Advanced button object with the specified size, position and style.

### setShadow:shadowRadius:shadowColor:
Changes shadow radius and shadow color of the button.

    - (void)setShadow:(BOOL)hasShadow shadowRadius:(CGFloat)radius shadowColor:(UIColor *)color

**Parameters**

`hasShadow`
A BOOL indicating whether to turn on or off the shadow of the button.

`radius`
The radius (spread of the shadow) to be used for the shadow.

`color`
The color to be used for the shadow.

**Description**

This method adds/remove the shadow of the button and changes the radius and color of the shadow if any.

### setGlow:
Add or remove the glow effect of the button.

    - (void)setGlow:(BOOL)hasGlow

**Parameters**

`hasGlow`
A BOOL indicating whether to turn on or off the glow of the button.

**Description**

This method adds/remove the glow or glossy effect of the button.

### setText:
Add or remove the glow effect of the button.

    - (void)setText:(NSString *)text

**Parameters**

`text`
The text of the button to be displayed.

**Description**

This method changes the text of the button to the string identified by the text variable.

### setCornerRadius:
Changes the corner radius of the button.

    - (void)setCornerRadius:(CGFloat)radius

**Parameters**

`radius`
The radius of the corners to give round rect effect. Give 0 if you want a rectangular base.

**Description**

This method changes the corner radius of the button to the value identified by radius.

### setButtonStyle:
Changes the style of the button.

    - (void)setButtonStyle:(UIAdvancedButtonStyle)style

**Parameters**

`style`
The predefined button style. Instead of specifying colors for the button you can choose from any of the predefined style for the button being made.

**Description**

This method changes the style of the button to the specified style.

### setBackgroundColors:
Changes the background colour of the button.

    - (void)setBackgroundColors:(NSArray *)colours

**Parameters**

`colors`
A NSArray object which should contain one or more CGColorRef objects which define the background colors of the button.

**Description**

This method changes the background colour of the button to a gradient formed from the colors in the array.



    © 2013 Sksarts Inc. All Rights Reserved. (Last updated: 2013-09-01)


