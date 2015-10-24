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
    
    Label* label = [Label labelNodeWithFontNamed:@"Chalkduster"];
    
    if(label != nil){
        
        SKColor *fontColor = [UIColor blackColor];
        label.fontColor = fontColor;
        label.fontSize = 38;
    }

    return label;
}

@end
