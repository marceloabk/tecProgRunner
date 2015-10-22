//
//  HudLayer.m
//  TecprogRunner
//
//  Contain aditional information, like score
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "HudLayer.h"

@implementation HudLayer{
    CGSize _size;
}

-(instancetype) initWithSize:(CGSize)size{
    self = [super init];
    if(self){
        _size = size;
        
        self.layer = [SKNode node];
        [self addChild:self.layer];
        
        // Adding a label to count score during the game
        [self putScoreLabel:0];
    }
    return self;
}

-(void) putScoreLabel:(int)points{

    [self.scoreLabel removeFromParent];
    
//pointsLabel
    // Creating attributes to customize score label
    SKColor *fontColor = [UIColor blackColor];
    CGPoint fontPosition = CGPointMake(_size.width*0.5, _size.height*0.9);

    NSString *pointsLabelString = [[NSString alloc] initWithFormat:@"%i", points];

// Setting score label
    self.scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    self.scoreLabel.text = pointsLabelString;
    self.scoreLabel.fontColor = fontColor;
    self.scoreLabel.fontSize = 38;
    self.scoreLabel.position = fontPosition;
    self.scoreLabel.zPosition = 2;
    
    // Adding score label to layer
    [self addChild:self.scoreLabel];

}

@end
