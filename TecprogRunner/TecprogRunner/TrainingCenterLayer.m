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
    
    self.backButton = [SKSpriteNode spriteNodeWithImageNamed:@"backButton"];
    self.backButton.position = CGPointMake(10, 363);
    self.backButton.anchorPoint = CGPointMake(0, 1);
    self.backButton.name = @"backTrainingCenter";
    self.backButton.zPosition = 2;
    [self.backButton setScale:0.5];
    
}

-(void) loadStars{
    
    // Load stars sprites
    self.levelJumpStars = [self loadStarSprite:self.levelJumpStars];
    self.levelLuckStars = [self loadStarSprite:self.levelLuckStars];
    self.levelPowerStars = [self loadStarSprite:self.levelPowerStars];
    self.levelShootingStars = [self loadStarSprite:self.levelShootingStars];
    self.levelSpeedStars = [self loadStarSprite:self.levelSpeedStars];
    
    [self setStarCommonAttributes:self.levelJumpStars];
    [self setStarCommonAttributes:self.levelLuckStars];
    [self setStarCommonAttributes:self.levelPowerStars];
    [self setStarCommonAttributes:self.levelShootingStars];
    [self setStarCommonAttributes:self.levelSpeedStars];
    
    // Set stars positions on screen
    self.levelJumpStars.position = CGPointMake(DEFAULT_STARS_X_POSITION, DEFAULT_LAYER_HEIGHT-85);
    self.levelLuckStars.position = CGPointMake(DEFAULT_STARS_X_POSITION, DEFAULT_LAYER_HEIGHT-132);
    self.levelPowerStars.position = CGPointMake(DEFAULT_STARS_X_POSITION, DEFAULT_LAYER_HEIGHT-179);
    self.levelShootingStars.position = CGPointMake(DEFAULT_STARS_X_POSITION, DEFAULT_LAYER_HEIGHT-232);
    self.levelSpeedStars.position = CGPointMake(DEFAULT_STARS_X_POSITION, DEFAULT_LAYER_HEIGHT-282);
    
}

-(void) setStarCommonAttributes:(SKSpriteNode*)star{
    star.anchorPoint = DEFAULT_SPRITE_ANCHOR_POINT;
    star.zPosition = DEFAULT_STARTS_Z_POSITION;
    [star setScale:0.5];
}

-(SKSpriteNode*) loadStarSprite:(SKSpriteNode*)attribute{
    
    // Get attribute level
    int level = [self returnLevel:attribute];
    
    // Set string according to the level
    NSString *spriteName = [[NSString alloc] initWithFormat:@"levelStars%i", level];
    
    // Generating the sprite
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:spriteName];
    
    return sprite;
}

-(void) loadAtributesTable{

    self.atributesTable = [SKSpriteNode spriteNodeWithImageNamed:@"atributesTable"];
    self.atributesTable.position = CGPointMake(50, DEFAULT_LAYER_HEIGHT-34);
    self.atributesTable.anchorPoint = DEFAULT_SPRITE_ANCHOR_POINT;
    self.atributesTable.zPosition = 2;
    [self.atributesTable setScale:0.5];
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
    
    [self loadCoinsAndGems];

    
}

-(int) returnLevel:(SKSpriteNode*)attribute{
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


-(void) loadCoinsAndGems{

    SKSpriteNode *coinsImage = [SKSpriteNode spriteNodeWithImageNamed:@"Coin1"];
    coinsImage.anchorPoint = CGPointMake(0, 1);
    coinsImage.position = CGPointMake(380, 375-15);
    coinsImage.zPosition = 10;
    
    SKSpriteNode *gemsImage = [SKSpriteNode spriteNodeWithImageNamed:@"Coin2"];
    gemsImage.anchorPoint = CGPointMake(0, 1);
    gemsImage.position = CGPointMake(582, 375-15);
    gemsImage.zPosition = 10;
    
    self.coinsLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    self.coinsLabel.position = CGPointMake(624, 333);
    self.coinsLabel.text = [[NSString alloc] initWithFormat:@"%i", [GameData sharedGameData].coins];
    self.coinsLabel.fontColor = [UIColor whiteColor];
    self.coinsLabel.fontSize = 33;
    self.coinsLabel.zPosition = 10;
    
    [self.gemsLabel addChild:self.coinsLabel];
    self.gemsLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    self.gemsLabel.position = CGPointMake(424, 333);
    self.gemsLabel.text = [[NSString alloc] initWithFormat:@"%i", [GameData sharedGameData].gems];
    self.gemsLabel.fontColor = [UIColor whiteColor];
    self.gemsLabel.fontSize = 33;
    self.gemsLabel.zPosition = 10;
    
    [self.layer addChild:self.coinsLabel];
    [self.layer addChild:self.gemsLabel];
    [self.layer addChild:coinsImage];
    [self.layer addChild:gemsImage];

}


@end
