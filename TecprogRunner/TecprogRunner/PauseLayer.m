//
//  PauseLayer.m
//  TecprogRunner
//
//  Created by Henrique Dutra on 25/10/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "PauseLayer.h"

@implementation PauseLayer{
    /**
     Sprite Node containing the background
     */
    SpriteNode *_background;
    
    /**
     Sprite Node containing the continue button
     */
    SpriteNode *_continueButton;
    
    /**
     Sprite Node containing the home button
     */
    SpriteNode *_homeButton;
    
    /**
     Sprite Node containing the restart button
     */
    SpriteNode *_restartButton;
}

-(instancetype) initWithSize:(CGSize)size{
    
    DebugLog("Initializing");
    
    self = [super init];
    
    if(self != nil){
        
        self.zPosition = PAUSE_LAYER_Z_POSITION;
        
        // Initialize and add layer
        self.layer = [SKNode node];
        [self addChild:self.layer];
        
        // Load components
        [self loadBackground];
        [self loadButtons];

    }else{
        
        // Throw exception
        NSException *exception = [NSException exceptionWithName:@"Pause layer init"
                                                         reason:@"Can't initialize pause layer" userInfo:nil];
        [exception raise];
    }
    
    return self;
}

-(void) activatePauseLayer{

    // Add all components in layer
    [self.layer addChild:_background];
    [self.layer addChild:_restartButton];
    [self.layer addChild:_continueButton];
    [self.layer addChild:_homeButton];
}

/**
 Load the background presented in pause
*/
-(void) loadBackground{

    // Initialize background sprite node
    _background = [SpriteNode spriteNodeWithImageNamed:@"background" andPosition:CGPointZero
                                               anchorPoint:CGPointZero andScale:0.5 andZPosition:self.zPosition];
}

/**
 Load the buttons presented in pause
*/
-(void) loadButtons{
    
    static const CGFloat buttonZPosition = PAUSE_LAYER_Z_POSITION + 10;
    
    // Create restart button
    CGPoint restartButtonPosition = CGPointMake(562, DEFAULT_LAYER_HEIGHT - 248);
    _restartButton = [SpriteNode spriteNodeWithImageNamed:@"pauseRestarButton" andPosition:restartButtonPosition
                                anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:buttonZPosition];

    // Create home button
    CGPoint homeButtonPosition = CGPointMake(40, DEFAULT_LAYER_HEIGHT - 251);
    _homeButton = [SpriteNode spriteNodeWithImageNamed:@"pauseHomeButton" andPosition:homeButtonPosition
                    anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:buttonZPosition];
    
    // Create continue button
    CGPoint continueButtonPosition = CGPointMake(286, DEFAULT_LAYER_HEIGHT - 128);
    _continueButton = [SpriteNode spriteNodeWithImageNamed:@"pauseContinueButton" andPosition:continueButtonPosition anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:buttonZPosition];
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    DebugLog(@"Touches began");
    
    // Detect touch properly
    UITouch *touch = [touches anyObject];
    
    // Detect touch location
    CGPoint touchLocation = [touch locationInNode:self];
    
    // Get node at touch location
    SKNode *node = [self nodeAtPoint:touchLocation];
    
    // Verify which node was touched
    // and call the delegate
    if([node isEqualToNode:_restartButton]){
        [self.pauseDelegate restartButtonPressed];
    }else if([node isEqualToNode:_homeButton]){
        [self.pauseDelegate homeButtonPressed];
    }else if([node isEqualToNode:_continueButton]){
        [self.pauseDelegate continueButtonPressed];
    }
    
}

@end
