//
//  HudLayer.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 9/10/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "HudLayer.h"

@implementation HudLayer{
    CGSize _size;
}

-(instancetype) initWithSize:(CGSize)size{
    self = [super init];
    if(self){
        _size = size;
        
        // Adding a label to count score during the game
        [self setScoreLabel];
    }
    return self;
}

-(void) setScoreLabel{
    
    // Creating attributes to customize score label
    SKColor *fontColor = [SKColor colorWithRed:0.271 green:0.608 blue:0.325 alpha:1];
    CGPoint fontPosition = CGPointMake(_size.width*0.5, _size.height*0.9);
    
    // Setting score label
    self.scoreLabel = [SKLabelNode labelNodeWithText:@"0"];
    self.scoreLabel.fontColor = fontColor;
    self.scoreLabel.fontSize = 45;
    self.scoreLabel.position = fontPosition;
    self.scoreLabel.zPosition = 2;
    
    // Adding score label to layer
    [self addChild:self.scoreLabel];

}

@end
