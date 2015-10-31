//
//  TrainingCenterLayer.m
//  TecprogRunner
//
//  Contain Training Center
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "TrainingCenterLayer.h"
#import "GameData.h"

@implementation TrainingCenterLayer

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super init];
    
    if(self != NULL){
        
        self.layer = [SKNode node];
        [self addChild:self.layer];
        
        self.name = @"layer";
        
        [self loadBackground];
        [self loadButtons];
        [self loadStars];
        
    }else{
        // Exception
    }
    return self;
}

-(void) loadBackground{
    
    CGSize backgroundSize = CGSizeMake(DEFAULT_LAYER_WIDTH, DEFAULT_LAYER_HEIGHT);
    
    self.trainingCenterBackground = [[TrainingCenterBackground alloc] initWithSize:backgroundSize];
    
}

-(void) loadButtons{
    
    [self loadBack];
    [self loadAtributesTable];
    
}

-(void) loadBack{
    
    CGPoint position = CGPointMake(10, 363);
    self.backButton = [SpriteNode spriteNodeWithImageNamed:@"backButton" andPosition:position anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
}

-(void) loadStars{
    
    // Load stars sprites
    self.levelJumpStars = [self loadStarSprite:self.levelJumpStars];
    self.levelLuckStars = [self loadStarSprite:self.levelLuckStars];
    self.levelPowerStars = [self loadStarSprite:self.levelPowerStars];
    self.levelShootingStars = [self loadStarSprite:self.levelShootingStars];
    self.levelSpeedStars = [self loadStarSprite:self.levelSpeedStars];
    
    // Set stars positions on screen
    self.levelJumpStars.position = CGPointMake(DEFAULT_STARS_X_POSITION, DEFAULT_LAYER_HEIGHT-85);
    self.levelLuckStars.position = CGPointMake(DEFAULT_STARS_X_POSITION, DEFAULT_LAYER_HEIGHT-132);
    self.levelPowerStars.position = CGPointMake(DEFAULT_STARS_X_POSITION, DEFAULT_LAYER_HEIGHT-179);
    self.levelShootingStars.position = CGPointMake(DEFAULT_STARS_X_POSITION, DEFAULT_LAYER_HEIGHT-232);
    self.levelSpeedStars.position = CGPointMake(DEFAULT_STARS_X_POSITION, DEFAULT_LAYER_HEIGHT-282);
    
}

-(SpriteNode*) loadStarSprite:(SpriteNode*)attribute{
    
    // Get attribute level
    int level = [self returnLevel:attribute];
    
    // Set string according to the level
    NSString *spriteName = [[NSString alloc] initWithFormat:@"levelStars%i", level];
    
    // Generating the sprite
    SpriteNode *sprite = [SpriteNode spriteNodeWithImageNamed:spriteName andPosition:CGPointZero anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:DEFAULT_STARTS_Z_POSITION];
    
    
    return sprite;
}

-(void) loadAtributesTable{

    CGPoint position = CGPointMake(50, DEFAULT_LAYER_HEIGHT - 34);
    self.atributesTable = [SpriteNode spriteNodeWithImageNamed:@"atributesTable" andPosition:position anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:2];
    
}

-(void) activateLayer{
    
    [self.layer addChild:self.trainingCenterBackground];
    [self.layer addChild:self.backButton];
    [self.layer addChild:self.atributesTable];
    [self.layer addChild:self.levelJumpStars];
    [self.layer addChild:self.levelLuckStars];
    [self.layer addChild:self.levelPowerStars];
    [self.layer addChild:self.levelShootingStars];
    [self.layer addChild:self.levelSpeedStars];
    
    [self putCoins];
    [self putGems];

    
}

-(int) returnLevel:(SpriteNode*)attribute{
    unsigned int level = 0;
    
    // Comparing attribute with existings attributes
    // and requesting to Game Data the actual level
    if(attribute == self.levelJumpStars){
        level = [GameData sharedGameData].levelJump;
    }else if(attribute == self.levelLuckStars){
        level = [GameData sharedGameData].levelLuck;
    }else if(attribute == self.levelPowerStars){
        level = [GameData sharedGameData].levelPower;
    }else if(attribute == self.levelShootingStars){
        level = [GameData sharedGameData].levelShooting;
    }else if(attribute == self.levelSpeedStars){
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
    self.coinsLabel = [Label labelWithText:coinString andPosition:coinPosition
                                   andSize:33 andZPosition:10];
    
    [self addChild:coinsImage];
    [self.layer addChild:self.coinsLabel];
    
}

-(void) putGems{
    
    // Creating gems sprites
    CGPoint position = CGPointMake(540, DEFAULT_LAYER_HEIGHT - 15);
    SpriteNode *gemsImage = [SpriteNode spriteNodeWithImageNamed:@"diamond" andPosition:position
                                                     anchorPoint:SKETCH_ANCHOR_POINT andScale:0.5 andZPosition:10];
    
    // Creating gems label
    NSString *gemsString = [[NSString alloc] initWithFormat:@"%i", [GameData sharedGameData].gems];
    CGPoint gemPosition = CGPointMake(584, 333);
    self.gemsLabel = [Label labelWithText:gemsString andPosition:gemPosition andSize:33 andZPosition:10];

    
    [self addChild:gemsImage];
    [self addChild:self.gemsLabel];
    
}


@end
