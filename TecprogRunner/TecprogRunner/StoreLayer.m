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
    
    int _cardChoosen;

}

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    
    if(self != nil){

        self.layer = [SKNode node];
        [self addChild:self.layer];
        self.name = @"layer";
        
        _cardChoosen = 0;
        
        [self loadEverything];
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

    [self loadBackButton: @"backButton"];
    

}

-(void) loadBackButton: (NSString *) buttonName{

    CGPoint position = CGPointMake(30, 363);
    _backButton = [SpriteNode spriteNodeWithImageNamed: @"backButton"];
    [_backButton setScale:0.4];
    _backButton.position = position;
    _backButton.name = buttonName;
    _backButton.anchorPoint = CGPointMake(0, 1);
    _backButton.zPosition = 2;

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

-(void) changeBackButton : (NSString *) name{

    [_backButton removeFromParent];
    [self loadBackButton:name];
    
    [self.layer addChild:_backButton];
    
}

-(void) gemsChoosed{
    
    SKAction *scale = [SKAction scaleTo:0.23 duration:0.7];
    SKAction *move = [SKAction moveTo:CGPointMake(45, 375-112) duration:0.7];
    SKAction *fade = [SKAction fadeAlphaTo:0 duration:0.3];

    [_gemsCard runAction:scale];
    [_gemsCard runAction:move];
    
    [_coinsCard runAction:fade];
    [_freeCoinsCard runAction:fade];
    
    _cardChoosen = 2;

    [self putGemsSlot];
    
    [self changeBackButton:@"gemsBack"];

}

-(void) backToMainLayer{

    [self.layer removeFromParent];
    
    self.layer = [SKNode node];
    [self addChild:self.layer];
    
    [self loadEverything];
    [self activateLayer];

}

-(void) coinsChoosed{
    
    SKAction *scale = [SKAction scaleTo:0.23 duration:0.7];
    SKAction *move = [SKAction moveTo:CGPointMake(45, 375-112) duration:0.7];
    SKAction *fade = [SKAction fadeAlphaTo:0 duration:0.3];
    
    [_coinsCard runAction:scale];
    [_coinsCard runAction:move];
    
    [_gemsCard runAction:fade];
    [_freeCoinsCard runAction:fade];
    
    _cardChoosen = 1;
    
    [self changeBackButton:@"coinsBack"];
    
}

-(void) freeCoinsChoosed{
    
    SKAction *scale = [SKAction scaleTo:0.23 duration:0.7];
    SKAction *move = [SKAction moveTo:CGPointMake(45, 375-112) duration:0.7];
    SKAction *fade = [SKAction fadeAlphaTo:0 duration:0.3];

    [_freeCoinsCard runAction:scale];
    [_freeCoinsCard runAction:move];
    
    [_gemsCard runAction:fade];
    [_coinsCard runAction:fade];
    
    _cardChoosen = 3;

    [self changeBackButton:@"freeCoinsBack"];

}


-(void) putGemsSlot{

    SKSpriteNode *slot = [SKSpriteNode spriteNodeWithImageNamed:@"buyGemsSlot"];
    slot.position = CGPointMake(143, 375-44);
    slot.anchorPoint = CGPointMake(0, 1);
    [slot setScale:0.5];
    [self.layer addChild:slot];
    
    [self addGemNodes];

}

-(void) addGemNodes{

}

-(void) putCoinsSlot{

}



-(void) loadEverything{
    
    [self loadBackground];
    [self loadButtons];
    [self loadCards];
    
}


@end
