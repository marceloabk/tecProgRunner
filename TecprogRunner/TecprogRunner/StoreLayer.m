//
//  StoreLayer.m
//  TecprogRunner
//
//  Player store
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "StoreLayer.h"
#define CARD_Y_POSITION 302

@implementation StoreLayer

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    
    if(self != nil){

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

    // Setting background size
    CGSize backgroundSize = CGSizeMake(DEFAULT_LAYER_WIDTH, DEFAULT_LAYER_HEIGHT);
    
    // Initializing background
    self.backgroundLayerStore = [[BackgroundLayerStore alloc] initWithSize:backgroundSize];

}

-(void) loadButtons{

    [self loadBackButton];

}

-(void) loadBackButton{

    CGPoint position = CGPointMake(30, 363);
    self.backButton = [SpriteNode spriteNodeWithImageNamed:@"backButton" andPosition:position
                                               anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];

}

-(void) activateLayer{

    [self.layer addChild:self.backgroundLayerStore];
    [self.layer addChild:self.backButton];
    [self.layer addChild:self.coinsCard];
    [self.layer addChild:self.freeCoinsCard];
    [self.layer addChild:self.gemsCard];

}

-(void) loadCards{

    // Instantiate...
    
    // ... Coins Card
    CGPoint coinsPosition = CGPointMake(21, CARD_Y_POSITION);
    self.coinsCard = [SpriteNode spriteNodeWithImageNamed:@"coinsCard" andPosition:coinsPosition
                                              anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
    // ... Free Coins Card
    CGPoint freeCoinsPosition = CGPointMake(456, CARD_Y_POSITION);
    self.freeCoinsCard = [SpriteNode spriteNodeWithImageNamed:@"freeCoinsCard" andPosition:freeCoinsPosition
                                                  anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
    // ... Gems Card
    CGPoint gemsPosition = CGPointMake(239, CARD_Y_POSITION);
    self.gemsCard = [SpriteNode spriteNodeWithImageNamed:@"gemsCard" andPosition:gemsPosition
                                             anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];


}

@end
