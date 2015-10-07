//
//  TrainingCenterBackground.h
//  TecprogRunner
//
//  Created by Henrique Dutra on 07/10/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "TrainingCenterBackground.h"

@interface TrainingCenterBackground : SKNode

-(instancetype) initWithSize: (CGSize) size;

//background sprite
@property (nonatomic) SKSpriteNode* background;

@end
