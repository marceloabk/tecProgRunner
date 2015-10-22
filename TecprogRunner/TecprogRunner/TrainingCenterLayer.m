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
    
}

-(int) returnLevel:(int)skillType{

    return [GameData sharedGameData].levelJump;
}


@end
