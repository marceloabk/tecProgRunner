//
//  Label.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 10/24/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "Label.h"
#import "GlobalHeaders.h"

@implementation Label

+(Label*) label{
    
    Label *label = [Label labelNodeWithFontNamed:@"Chalkduster"];
    
    if(label != nil){
        
        SKColor *fontColor = [UIColor whiteColor];
        label.fontColor = fontColor;
        label.fontSize = 38;
    }else{
        NSException *exception =[NSException exceptionWithName:@"Label init" reason:@"Can't init Label" userInfo:nil];
        [exception raise];
    }

    return label;
}

+(Label*) labelWithText:(NSString*)text andPosition:(CGPoint)position andSize:(CGFloat)fontSize andZPosition:(int)zPosition{
    
    Label *label = [Label labelNodeWithFontNamed:@"Thirteen-Pixel-Fonts"];
    
    if(label != nil){
        
        label.text = text;
        label.position = position;
        label.fontSize = fontSize;
        label.zPosition = zPosition;
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        
    }else{
        NSException *exception =[NSException exceptionWithName:@"Label init" reason:@"Can't init Label" userInfo:nil];
        [exception raise];
    }
    
    return label;
}

@end
