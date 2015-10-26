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
    self.backButton.position = CGPointMake(30, 363);
    self.backButton.anchorPoint = CGPointMake(0, 1);
    self.backButton.name = @"backTrainingCenter";
    self.backButton.zPosition = 2;
    [self.backButton setScale:0.5];
    
}

-(void) loadStars{
    
    [self loadJumpStars];
    [self loadLuckStars];
    [self loadPowerStars];
    [self loadShootingStars];
    [self loadSpeedStars];
    
    [self setStarVisual:self.levelJumpStars];
    [self setStarVisual:self.levelLuckStars];
    [self setStarVisual:self.levelPowerStars];
    [self setStarVisual:self.levelShootingStars];
    [self setStarVisual:self.levelSpeedStars];
    
    self.levelJumpStars.position = CGPointMake(207, 375-103);
    self.levelLuckStars.position = CGPointMake(207, 375-150);
    self.levelPowerStars.position = CGPointMake(207, 375-197);
    self.levelShootingStars.position = CGPointMake(207, 375-250);
    self.levelSpeedStars.position = CGPointMake(207, 375-300);
    
}

-(void) setStarVisual:(SKSpriteNode*)star{
    star.anchorPoint = DEFAULT_STARS_ANCHOR_POINT;
    star.zPosition = DEFAULT_STARTS_Z_POSITION;
    [star setScale:0.5];
}

-(void) loadJumpStars{

    int level = [self returnLevel:1];
    NSString *spriteName = [[NSString alloc] initWithFormat:@"levelStars%i", level];
    
    self.levelJumpStars = [SKSpriteNode spriteNodeWithImageNamed:spriteName];

}

-(void) loadLuckStars{
    
    int level = [self returnLevel:2];
    NSString *spriteName = [[NSString alloc] initWithFormat:@"levelStars%i", level];
    
    self.levelLuckStars = [SKSpriteNode spriteNodeWithImageNamed:spriteName];
    
}

-(void) loadPowerStars{
    
    int level = [self returnLevel:3];
    NSString *spriteName = [[NSString alloc] initWithFormat:@"levelStars%i", level];
    
    self.levelPowerStars = [SKSpriteNode spriteNodeWithImageNamed:spriteName];
    
}

-(void) loadShootingStars{
    
    int level = [self returnLevel:4];
    NSString *spriteName = [[NSString alloc] initWithFormat:@"levelStars%i", level];
    
    self.levelShootingStars = [SKSpriteNode spriteNodeWithImageNamed:spriteName];
    
}

-(void) loadSpeedStars{
    
    int level = [self returnLevel:5];
    NSString *spriteName = [[NSString alloc] initWithFormat:@"levelStars%i", level];
    
    self.levelSpeedStars = [SKSpriteNode spriteNodeWithImageNamed:spriteName];
    
}

-(void) loadAtributesTable{

    self.atributesTable = [SKSpriteNode spriteNodeWithImageNamed:@"atributesTable"];
    self.atributesTable.position = CGPointMake(50, 375-34);
    self.atributesTable.anchorPoint = CGPointMake(0, 1);
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

-(int) returnLevel:(int)skillType{

    if(skillType ==1){
        return [GameData sharedGameData].levelJump;
    }
    else if(skillType ==2){
        return [GameData sharedGameData].levelLuck;
    }
    else if(skillType ==3){
        return [GameData sharedGameData].levelPower;
    }
    else if(skillType ==4){
        return [GameData sharedGameData].levelShooting;
    }
    else if(skillType ==5){
        return [GameData sharedGameData].levelSpeed;
    }
    else{
        return 0;
    }
    
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
