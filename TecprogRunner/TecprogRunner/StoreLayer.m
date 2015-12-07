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
    
    SKSpriteNode *_80Gems;
    SKSpriteNode *_300Gems;
    SKSpriteNode *_700Gems;
    SKSpriteNode *_2000Gems;
    SKSpriteNode *_4500Gems;
    SKSpriteNode *_10000Gems;
    
    SKSpriteNode *_80Coins;
    SKSpriteNode *_300Coins;
    SKSpriteNode *_700Coins;
    SKSpriteNode *_2000Coins;
    SKSpriteNode *_4500Coins;
    SKSpriteNode *_10000Coins;
    
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
    [self loadGemsNodes];

}

-(void)loadGemsNodes{

    _80Gems = [SKSpriteNode spriteNodeWithImageNamed:@"80Gems"];
    _300Gems = [SKSpriteNode spriteNodeWithImageNamed:@"300Gems"];
    _700Gems = [SKSpriteNode spriteNodeWithImageNamed:@"700Gems"];
    _2000Gems = [SKSpriteNode spriteNodeWithImageNamed:@"2000Gems"];
    _4500Gems = [SKSpriteNode spriteNodeWithImageNamed:@"4500Gems"];
    _10000Gems = [SKSpriteNode spriteNodeWithImageNamed:@"10000Gems"];
    
    CGPoint pos1 = CGPointMake(199, 375-109);
    CGPoint pos2 = CGPointMake(194, 375-177);
    CGPoint pos3 = CGPointMake(194, 375-248);
    CGPoint pos4 = CGPointMake(429, 375-109);
    CGPoint pos5 = CGPointMake(428, 375-177);
    CGPoint pos6 = CGPointMake(418, 375-248);
    CGPoint anc = CGPointMake(0, 1);
    
    _80Gems.position = pos1;
    _300Gems.position = pos2;
    _700Gems.position = pos3;
    _2000Gems.position = pos4;
    _4500Gems.position = pos5;
    _10000Gems.position = pos6;
    
    _80Gems.anchorPoint = anc;
    _300Gems.anchorPoint = anc;
    _700Gems.anchorPoint = anc;
    _2000Gems.anchorPoint = anc;
    _4500Gems.anchorPoint = anc;
    _10000Gems.anchorPoint = anc;
    
    _80Gems.zPosition = 5;
    _300Gems.zPosition = 5;
    _700Gems.zPosition = 5;
    _2000Gems.zPosition = 5;
    _4500Gems.zPosition = 5;
    _10000Gems.zPosition = 5;
    
    _80Gems.alpha = 0;
    _300Gems.alpha = 0;
    _700Gems.alpha = 0;
    _2000Gems.alpha = 0;
    _4500Gems.alpha = 0;
    _10000Gems.alpha = 0;
    
    [_80Gems setScale:0.5];
    [_300Gems setScale:0.5];
    [_700Gems setScale:0.5];
    [_2000Gems setScale:0.5];
    [_4500Gems setScale:0.5];
    [_10000Gems setScale:0.5];
    
    
    _80Gems.name = @"80Gems";
    _300Gems.name = @"300Gems";
    _700Gems.name = @"700Gems";
    _2000Gems.name = @"2000Gems";
    _4500Gems.name = @"4500Gems";
    _10000Gems.name = @"10000Gems";

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
    slot.alpha = 0;
    [self.layer addChild:slot];
    
    [slot runAction:[SKAction fadeAlphaTo:1 duration:0.7]];
    
    [self addGemNodes];

}

-(void) addGemNodes{
    
    [self.layer addChild:_80Gems];
    [self.layer addChild:_300Gems];
    [self.layer addChild:_700Gems];
    [self.layer addChild:_2000Gems];
    [self.layer addChild:_4500Gems];
    [self.layer addChild:_10000Gems];
    
    [_80Gems runAction:[SKAction fadeAlphaTo:1 duration:1.7]];
    [_300Gems runAction:[SKAction fadeAlphaTo:1 duration:1.7]];
    [_700Gems runAction:[SKAction fadeAlphaTo:1 duration:1.7]];
    [_2000Gems runAction:[SKAction fadeAlphaTo:1 duration:1.7]];
    [_4500Gems runAction:[SKAction fadeAlphaTo:1 duration:1.7]];
    [_10000Gems runAction:[SKAction fadeAlphaTo:1 duration:1.7]];

}

-(void) putCoinsSlot{

}



-(void) loadEverything{
    
    [self loadBackground];
    [self loadButtons];
    [self loadCards];
    
}


@end
