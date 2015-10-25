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
    
    self.trainingCenterBackground = [[TrainingCenterBackground alloc] initWithSize:CGSizeMake(667, 375)];
    
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
    
    
    self.levelJumpStars.position = CGPointMake(207, 375-103);
    self.levelLuckStars.position = CGPointMake(207, 375-150);
    self.levelPowerStars.position = CGPointMake(207, 375-197);
    self.levelShootingStars.position = CGPointMake(207, 375-250);
    self.levelSpeedStars.position = CGPointMake(207, 375-300);
    
    self.levelJumpStars.anchorPoint = CGPointMake(0, 1);
    self.levelLuckStars.anchorPoint = CGPointMake(0, 1);
    self.levelPowerStars.anchorPoint = CGPointMake(0, 1);
    self.levelShootingStars.anchorPoint = CGPointMake(0, 1);
    self.levelSpeedStars.anchorPoint = CGPointMake(0, 1);
    
    self.levelJumpStars.zPosition = 100;
    self.levelLuckStars.zPosition = 100;
    self.levelPowerStars.zPosition = 100;
    self.levelShootingStars.zPosition = 100;
    self.levelSpeedStars.zPosition = 100;
    
    [self.levelJumpStars setScale:0.5];
    [self.levelLuckStars setScale:0.5];
    [self.levelPowerStars setScale:0.5];
    [self.levelShootingStars setScale:0.5];
    [self.levelSpeedStars setScale:0.5];
    
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


@end
