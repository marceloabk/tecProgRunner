//
//  Tile.m
//  TecprogRunner
//
//  Created by Lucas Araujo on 11/6/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "Tile.h"

@implementation Tile

-(void) generateTilePhysicsBodyWithSize:(CGSize)size{
    
    SKPhysicsBody* physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:size];
    physicsBody.categoryBitMask = ColliderTypeGround;
    physicsBody.affectedByGravity = false;
    physicsBody.dynamic = false;
    physicsBody.allowsRotation = false;
    physicsBody.collisionBitMask = ColliderTypePlayer;
    physicsBody.contactTestBitMask = ColliderTypePlayer | ColliderTypeEnemy | ColliderTypeObstacle;
    
    self.physicsBody = physicsBody;
}

@end
