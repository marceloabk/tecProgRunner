//
//  TrainingCenterLayer.m
//  TecprogRunner
//
//  Created by Henrique Dutra on 07/10/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "TrainingCenterLayer.h"
#import "GameData.h"

@implementation TrainingCenterLayer

-(instancetype)initWithSize:(CGSize)size{
    
    if(self = [super init]){
        
        self.layer = [SKNode node];
        [self addChild:self.layer];
        
        self.name = @"layer";
        
        [self loadBackground];
        [self loadButtons];
        [self loadStars];
        
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

-(void)activateLayer{
    
    [self.layer addChild:self.trainingCenterBackground];
    [self.layer addChild:self.backButton];
    [self.layer addChild:self.atributesTable];
    
}

-(int) returnLevel : (int) skillType{

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
