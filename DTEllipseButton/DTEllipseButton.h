//
//  DTEllipseButton.h
//  DTEllipseButton
//
//  Created by NiM on 1/9/2560 BE.
//  Copyright © 2560 Sopana Thitipariwat. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface DTEllipseButton : UIButton

@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@property (nonatomic, strong) IBInspectable UIColor *textColor;
@property (nonatomic, strong) IBInspectable UIColor *borderBackgroundColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;

@end
