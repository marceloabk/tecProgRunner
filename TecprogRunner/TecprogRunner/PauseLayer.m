//
//  PauseLayer.m
//  TecprogRunner
//
//  Created by Henrique Dutra on 25/10/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "PauseLayer.h"

@implementation PauseLayer

-(instancetype) initWithSize:(CGSize)size{
    self = [super init];
    
    if(self != nil){
        
        self.zPosition = PAUSE_LAYER_Z_POSITION;
        
        self.layer = [SKNode node];
        [self addChild:self.layer];
        
        [self loadBackground];
        [self loadButtons];

    }else{
        // Exception
    }
    
    return self;
}

-(void) activatePauseLayer{

    [self.layer addChild:self.background];
    [self.layer addChild:self.restartButton];
    [self.layer addChild:self.continueButton];
    [self.layer addChild:self.homeButton];
}

-(void) loadBackground{

    self.background = [SpriteNode spriteNodeWithImageNamed:@"background" andPosition:CGPointZero
                                               anchorPoint:CGPointZero andScale:0.5 andZPosition:self.zPosition];
    
}

-(void) loadButtons{
    
    CGFloat buttonZPosition = PAUSE_LAYER_Z_POSITION + 10;
    
    // Create restart button
    CGPoint restartButtonPosition = CGPointMake(562, DEFAULT_LAYER_HEIGHT - 248);
    self.restartButton = [SpriteNode spriteNodeWithImageNamed:@"pauseRestarButton" andPosition:restartButtonPosition
                                                  anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:buttonZPosition];

    // Create home button
    CGPoint homeButtonPosition = CGPointMake(40, DEFAULT_LAYER_HEIGHT - 251);
    self.homeButton = [SpriteNode spriteNodeWithImageNamed:@"pauseHomeButton" andPosition:homeButtonPosition
                                               anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:buttonZPosition];
    
    // Create continue button
    CGPoint continueButtonPosition = CGPointMake(286, DEFAULT_LAYER_HEIGHT - 128);
    self.continueButton = [SpriteNode spriteNodeWithImageNamed:@"pauseContinueButton" andPosition:continueButtonPosition
                                                   anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:buttonZPosition];
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    SKNode *node = [self nodeAtPoint:touchLocation];
    
    if([node isEqualToNode:self.restartButton]){
        [self.pauseDelegate restartButtonPressed];
    }
    else if([node isEqualToNode:self.homeButton]){
        [self.pauseDelegate homeButtonPressed];
    }
    else if([node isEqualToNode:self.continueButton]){
        [self.pauseDelegate continueButtonPressed];
    }
    
}

@end
