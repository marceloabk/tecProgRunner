//
//  EnemyGenerator.h
//  TecprogRunner
//
//  Created by Marcelo Cristiano Araujo Silva on 14/10/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface EnemyGenerator : SKNode

-(instancetype)initWithSize:(CGSize)size;
-(void)newEnemyWithScore:(unsigned int)score;

@end
