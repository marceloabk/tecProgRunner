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
    if(self != NULL){
        
        self.zPosition = 10000;
        
        self.layer = [SKNode node];
        [self addChild:self.layer];
        
        [self loadBackground];
        [self loadButtons];

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

    self.background = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImageNamed:@"background"]];
    self.background.position =CGPointZero;
    self.background.anchorPoint = CGPointZero;
    [self.background setScale:0.5];
    
}

-(void) loadButtons{
    
    self.restartButton = [SKSpriteNode spriteNodeWithImageNamed:@"pauseRestarButton"];
    self.restartButton.position = CGPointMake(562, 375-248);
    self.restartButton.anchorPoint = CGPointMake(0, 1);
    self.restartButton.name = @"pauseRestarButton";
    self.restartButton.zPosition = 1000001;
    [self.restartButton setScale:0.5];
    
    
    self.homeButton = [SKSpriteNode spriteNodeWithImageNamed:@"pauseHomeButton"];
    self.homeButton.position = CGPointMake(40, 375-251);
    self.homeButton.anchorPoint = CGPointMake(0, 1);
    self.homeButton.name = @"pauseHomeButton";
    self.homeButton.zPosition = 1000001;

    [self.homeButton setScale:0.5];
    
    self.continueButton = [SKSpriteNode spriteNodeWithImageNamed:@"pauseContinueButton"];
    self.continueButton.position = CGPointMake(286, 375-128);
    self.continueButton.anchorPoint = CGPointMake(0, 1);
    self.continueButton.name = @"pauseContinueButton";
    self.continueButton.zPosition = 1000001;
     [self.continueButton setScale:0.5];

}

@end
