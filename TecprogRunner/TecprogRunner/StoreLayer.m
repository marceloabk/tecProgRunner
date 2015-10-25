//
//  StoreLayer.m
//  TecprogRunner
//
//  Player store
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "StoreLayer.h"

@implementation StoreLayer

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    
    if(self != NULL){

        self.layer = [SKNode node];
        [self addChild:self.layer];
        self.name = @"layer";
        
        [self loadBackground];
        [self loadButtons];
    }else{
        // Exception
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
