//
//  StoreLayer.m
//  TecprogRunner
//
//  Created by Henrique Dutra on 16/09/15.
//  Copyright (c) 2015 Bepid-UnB. All rights reserved.
//

#import "StoreLayer.h"

@implementation StoreLayer

-(instancetype) initWithSize: (CGSize) size{
    
    if(self = [super init]){

        self.layer = [SKNode node];
        [self addChild:self.layer];
        self.name = @"layer";
        
        [self loadBackground];
        [self loadButtons];
    }
    return self;
}


-(void) loadBackground{

    self.backgroundLayerStore = [[BackgroundLayerStore alloc] initWithSize:CGSizeMake(667, 375)];

}

-(void) loadButtons{

    [self loadBack];

}

-(void) loadBack{

    self.backButton = [SKSpriteNode spriteNodeWithImageNamed:@"backButton"];
    self.backButton.position = CGPointMake(30, 363);
    self.backButton.anchorPoint = CGPointMake(0, 1);
    self.backButton.name = @"backButtonStore";
    self.backButton.zPosition = 2;
    [self.backButton setScale:0.5];

}

-(void) activateLayer{

    [self.layer addChild:self.backgroundLayerStore];
    [self.layer addChild:self.backButton];

}

@end
