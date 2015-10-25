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
        [self loadCards];
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
    [self.layer addChild:self.coinsCard];
    [self.layer addChild:self.freeCoinsCard];
    [self.layer addChild:self.gemsCard];

}

-(void) loadCards{

    self.coinsCard = [SKSpriteNode spriteNodeWithImageNamed:@"coinsCard"];
    self.coinsCard.position = CGPointMake(21, 375-73);
    self.coinsCard.anchorPoint = CGPointMake(0, 1);
    self.coinsCard.name = @"coinsCard";
    self.coinsCard.zPosition = 2;
    [self.coinsCard setScale:0.5];
    
    self.freeCoinsCard = [SKSpriteNode spriteNodeWithImageNamed:@"freeCoinsCard"];
    self.freeCoinsCard.position = CGPointMake(456, 375-73);
    self.freeCoinsCard.anchorPoint = CGPointMake(0, 1);
    self.freeCoinsCard.name = @"freeCoinsCard";
    self.freeCoinsCard.zPosition = 2;
    [self.freeCoinsCard setScale:0.5];
    
    self.gemsCard = [SKSpriteNode spriteNodeWithImageNamed:@"gemsCard"];
    self.gemsCard.position = CGPointMake(239, 375-73);
    self.gemsCard.anchorPoint = CGPointMake(0, 1);
    self.gemsCard.name = @"gemsCard";
    self.gemsCard.zPosition = 2;
    [self.gemsCard setScale:0.5];


}

@end
