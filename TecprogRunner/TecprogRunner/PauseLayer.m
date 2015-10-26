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
    if(self){
        
        self.background = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
        
        self.layer = [SKNode node];
        [self addChild:self.layer];

        [self loadButtons];
        
    }
    return self;
}

-(void) activateLayer{

    [self.layer addChild:self.background];
    [self.layer addChild:self.restartButton];
    [self.layer addChild:self.continueButton];
    [self.layer addChild:self.homeButton];

}


-(void) loadButtons{
    
    self.restartButton = [SKSpriteNode spriteNodeWithImageNamed:@"pauseRestarButton"];
    self.restartButton.position = CGPointMake(21, 375-73);
    self.restartButton.anchorPoint = CGPointMake(0, 1);
    self.restartButton.name = @"pauseRestarButton";
    self.restartButton.zPosition = 2;
    [self.restartButton setScale:0.5];
    
    
    self.homeButton = [SKSpriteNode spriteNodeWithImageNamed:@"pauseHomeButton"];
    self.homeButton.position = CGPointMake(21, 375-73);
    self.homeButton.anchorPoint = CGPointMake(0, 1);
    self.homeButton.name = @"pauseHomeButton";
    self.homeButton.zPosition = 2;
    [self.homeButton setScale:0.5];
    
    self.continueButton = [SKSpriteNode spriteNodeWithImageNamed:@"pauseContinueButton"];
    self.continueButton.position = CGPointMake(21, 375-73);
    self.continueButton.anchorPoint = CGPointMake(0, 1);
    self.continueButton.name = @"pauseContinueButton";
    self.continueButton.zPosition = 2;
    [self.continueButton setScale:0.5];

}

@end
