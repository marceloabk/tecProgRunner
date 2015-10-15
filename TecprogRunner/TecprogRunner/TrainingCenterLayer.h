//
//  TrainingCenterLayer.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 07/10/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "TrainingCenterBackground.h"

@interface TrainingCenterLayer : SKNode

-(instancetype) initWithSize: (CGSize) size;

@property (nonatomic) SKNode *layer;

@property (nonatomic)  TrainingCenterBackground*trainingCenterBackground;

@property (nonatomic) SKSpriteNode *backButton;
@property (nonatomic) SKSpriteNode *atributesTable;

@property (nonatomic) SKSpriteNode *levelSpeedStars;
@property (nonatomic) SKSpriteNode *levelJumpStars;
@property (nonatomic) SKSpriteNode *levelLuckStars;
@property (nonatomic) SKSpriteNode *levelShootingStars;
@property (nonatomic) SKSpriteNode *levelPowerStars;


-(void) activateLayer;

@end
