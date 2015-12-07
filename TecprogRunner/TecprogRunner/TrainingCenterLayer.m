//
//  TrainingCenterLayer.m
//  TecprogRunner
//
//  Contain Training Center
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "TrainingCenterLayer.h"
#import "GameData.h"
#import "TrainingCenterBackground.h"
#import "Label.h"
#import "SpriteNode.h"

@implementation TrainingCenterLayer{
    TrainingCenterBackground *_trainingCenterBackground;
    SpriteNode *_backButton;
    SpriteNode *_levelSpeedStars;
    SpriteNode *_levelJumpStars;
    SpriteNode *_levelLuckStars;
    SpriteNode *_levelShootingStars;
    SpriteNode *_levelPowerStars;
    SpriteNode *_attributesTable;
    Label *_coinsLabel;
    Label *_gemsLabel;
}

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    
    if(self != nil){
        
        self.layer = [SKNode node];
        [self addChild:self.layer];
        
        self.name = @"layer";
        
        [self loadBackground];
        [self loadButtons];
        [self loadStars];
        
    }else{
        NSException *exception = [NSException exceptionWithName:@"Training Center layer" reason:@"Can't initialize training center layer" userInfo:nil];
        [exception raise];
    }
    return self;
}

-(void) loadBackground{
    
    CGSize backgroundSize = CGSizeMake(DEFAULT_LAYER_WIDTH, DEFAULT_LAYER_HEIGHT);
    
    _trainingCenterBackground = [[TrainingCenterBackground alloc] initWithSize:backgroundSize];
    
}

-(void) loadButtons{
    
    [self loadBack];
    [self loadAttributesTable];
    [self loadAttributesLabels];
}

-(void) loadAttributesLabels{

    CGPoint position1 = CGPointMake(80, 375-91);
    CGPoint position2 = CGPointMake(80, 375-138);
    CGPoint position3 = CGPointMake(80, 375-185);
    CGPoint position4 = CGPointMake(80, 375-238);
    CGPoint position5 = CGPointMake(80, 375-288);
    
    self.jumpButton = [SpriteNode spriteNodeWithImageNamed:@"jumpButton" andPosition:position5 anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
    self.luckButton = [SpriteNode spriteNodeWithImageNamed:@"luckButton" andPosition:position2 anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
    self.powerButton = [SpriteNode spriteNodeWithImageNamed:@"powerButton" andPosition:position3 anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];

    self.shootingButton = [SpriteNode spriteNodeWithImageNamed:@"shootingButton" andPosition:position4 anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
    self.speedButton = [SpriteNode spriteNodeWithImageNamed:@"speedButton" andPosition:position1 anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];

}


-(void) loadBack{
    
    CGPoint position = CGPointMake(10, 363);
    _backButton = [SpriteNode spriteNodeWithImageNamed:@"backButton" andPosition:position anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
}

-(void) loadStars{
    
    // Load stars sprites
    CGPoint jumpStarsPosition = CGPointMake(DEFAULT_STARS_X_POSITION, DEFAULT_LAYER_HEIGHT-85);
    _levelJumpStars = [self loadStarSprite:_levelJumpStars withPosition:jumpStarsPosition];
    
    CGPoint luckStarsPosition = CGPointMake(DEFAULT_STARS_X_POSITION, DEFAULT_LAYER_HEIGHT-132);
    _levelLuckStars = [self loadStarSprite:_levelLuckStars withPosition:luckStarsPosition];
    
    CGPoint powerStarsPosition = CGPointMake(DEFAULT_STARS_X_POSITION, DEFAULT_LAYER_HEIGHT-179);
    _levelPowerStars = [self loadStarSprite:_levelPowerStars withPosition:powerStarsPosition];
    
    CGPoint shootingStarsPosition = CGPointMake(DEFAULT_STARS_X_POSITION, DEFAULT_LAYER_HEIGHT-232);
    _levelShootingStars = [self loadStarSprite:_levelShootingStars withPosition:shootingStarsPosition];
    
    CGPoint speedStarsPosition = CGPointMake(DEFAULT_STARS_X_POSITION, DEFAULT_LAYER_HEIGHT-282);
    _levelSpeedStars = [self loadStarSprite:_levelSpeedStars withPosition:speedStarsPosition];
    

    
}

-(SpriteNode*) loadStarSprite:(SpriteNode*)attribute withPosition:(CGPoint)position{
    
    // Get attribute level
    int level = [self returnLevel:attribute];
    
    // Set string according to the level
    NSString *spriteName = [[NSString alloc] initWithFormat:@"levelStars%i", level];
    
    // Generating the sprite
    SpriteNode *sprite = [SpriteNode spriteNodeWithImageNamed:spriteName andPosition:position anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:DEFAULT_STARTS_Z_POSITION];
    
    return sprite;
}

-(void) loadAttributesTable{

    CGPoint position = CGPointMake(70, DEFAULT_LAYER_HEIGHT - 34);
    _attributesTable = [SpriteNode spriteNodeWithImageNamed:@"atributesTable" andPosition:position anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
}

-(void) activateLayer{
    
    [self.layer addChild:_trainingCenterBackground];
    [self.layer addChild:_backButton];
    [self.layer addChild:_attributesTable];
    
    [self.layer addChild:_levelJumpStars];
    [self.layer addChild:_levelLuckStars];
    [self.layer addChild:_levelPowerStars];
    [self.layer addChild:_levelShootingStars];
    [self.layer addChild:_levelSpeedStars];
    
    [self.layer addChild:self.jumpButton];
    [self.layer addChild:self.luckButton];
    [self.layer addChild:self.powerButton];
    [self.layer addChild:self.shootingButton];
    [self.layer addChild:self.speedButton];
    
    [self putCoins];
    [self putGems];
    [self putMessage];

    
}

-(void) putMessage{

    SKSpriteNode* sprite = [SKSpriteNode spriteNodeWithImageNamed:@"selectAtributeMessage"];
    sprite.position = CGPointMake(441, 187.5);
    sprite.anchorPoint = CGPointMake(0, 1);
    sprite.zPosition = 1000;
    [sprite setScale:0.5];
    
    [self.layer addChild:sprite];
    
}

-(int) returnLevel:(SpriteNode*)attribute{
    unsigned int level = 0;
    
    // Comparing attribute with existings attributes
    // and requesting to Game Data the actual level
    if(attribute == _levelJumpStars){
        level = [GameData sharedGameData].levelJump;
    }else if(attribute == _levelLuckStars){
        level = [GameData sharedGameData].levelLuck;
    }else if(attribute == _levelPowerStars){
        level = [GameData sharedGameData].levelPower;
    }else if(attribute == _levelShootingStars){
        level = [GameData sharedGameData].levelShooting;
    }else if(attribute == _levelSpeedStars){
        level = [GameData sharedGameData].levelSpeed;
    }else{
        level = 0;
    }
    
    return level;
}


-(void) putCoins{
    
    // Creating coin sprite
    CGPoint position = CGPointMake(380, DEFAULT_LAYER_HEIGHT - 15);
    SpriteNode *coinsImage = [SpriteNode spriteNodeWithImageNamed:@"Coin1" andPosition:position
                                                      anchorPoint:SKETCH_ANCHOR_POINT andScale:1.0 andZPosition:10];
    
    // Creating coins label
    NSString *coinString = [[NSString alloc] initWithFormat:@"%i", [GameData sharedGameData].coins];
    CGPoint coinPosition = CGPointMake(424, 333);
    _coinsLabel = [Label labelWithText:coinString andPosition:coinPosition
                                   andSize:33 andZPosition:10];
    
    [self addChild:coinsImage];
    [self.layer addChild:_coinsLabel];
    
}

-(void) putGems{
    
    // Creating gems sprites
    CGPoint position = CGPointMake(540, DEFAULT_LAYER_HEIGHT - 15);
    SpriteNode *gemsImage = [SpriteNode spriteNodeWithImageNamed:@"diamond" andPosition:position
                                                     anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:10];
    
    // Creating gems label
    NSString *gemsString = [[NSString alloc] initWithFormat:@"%i", [GameData sharedGameData].gems];
    CGPoint gemPosition = CGPointMake(584, 333);
    _gemsLabel = [Label labelWithText:gemsString andPosition:gemPosition andSize:33 andZPosition:10];

    
    [self addChild:gemsImage];
    [self addChild:_gemsLabel];
    
}




@end
