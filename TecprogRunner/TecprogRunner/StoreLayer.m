//
//  StoreLayer.m
//  TecprogRunner
//
//  Player store
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "StoreLayer.h"
#import "BackgroundLayerStore.h"
#import "SpriteNode.h"

#define CARD_Y_POSITION 302

@implementation StoreLayer{
    BackgroundLayerStore *_backgroundLayerStore;
    SpriteNode *_backButton;
    SpriteNode *_coinsCard;
    SpriteNode *_gemsCard;
    SpriteNode *_freeCoinsCard;
}

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
        NSException *exception = [NSException exceptionWithName:@"Store layer" reason:@"Can't initialize Store Layer" userInfo:nil];
        [exception raise];
    }
    
    return self;
}


-(void) loadBackground{

    // Setting background size
    CGSize backgroundSize = CGSizeMake(DEFAULT_LAYER_WIDTH, DEFAULT_LAYER_HEIGHT);
    
    // Initializing background
    _backgroundLayerStore = [[BackgroundLayerStore alloc] initWithSize:backgroundSize];

}

-(void) loadButtons{

    [self loadBackButton];

}

-(void) loadBackButton{

    CGPoint position = CGPointMake(30, 363);
    _backButton = [SpriteNode spriteNodeWithImageNamed:@"backButton" andPosition:position
                                               anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];

}

-(void) activateLayer{

    [self.layer addChild:_backgroundLayerStore];
    [self.layer addChild:_backButton];
    [self.layer addChild:_coinsCard];
    [self.layer addChild:_freeCoinsCard];
    [self.layer addChild:_gemsCard];

}

-(void) loadCards{

    // Instantiate...
    
    // ... Coins Card
    CGPoint coinsPosition = CGPointMake(21, CARD_Y_POSITION);
    _coinsCard = [SpriteNode spriteNodeWithImageNamed:@"coinsCard" andPosition:coinsPosition
                                              anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
    // ... Free Coins Card
    CGPoint freeCoinsPosition = CGPointMake(456, CARD_Y_POSITION);
    _freeCoinsCard = [SpriteNode spriteNodeWithImageNamed:@"freeCoinsCard" andPosition:freeCoinsPosition
                                                  anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
    // ... Gems Card
    CGPoint gemsPosition = CGPointMake(239, CARD_Y_POSITION);
    _gemsCard = [SpriteNode spriteNodeWithImageNamed:@"gemsCard" andPosition:gemsPosition
                                             anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];


}

-(void) gemsChoosed{
    
    SKAction *scale = [SKAction scaleTo:0.23 duration:0.7];
    SKAction *move = [SKAction moveTo:CGPointMake(85, 375-112) duration:0.7];
    
    [_gemsCard runAction:scale];
    [_gemsCard runAction:move];
    
}


-(void) coinsChoosed{
    
}

-(void) freeCoinsChoosed{
    
}

@end
