//
//  Tile.m
//  TecprogRunner
//
//  Class for Tile
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "Tile.h"

@implementation Tile

-(void) generateTilePhysicsBodyWithSize:(CGSize)size{
    
    // Initializing physics body according to superclass
    SKPhysicsBody *physicsBody = [super generatePhysicsBodyWithRectangleOfSize:size];
    
    // Setting specific properties
    physicsBody.affectedByGravity = NO;
    physicsBody.dynamic = NO;
    
    
    // Setting collision types
    physicsBody.categoryBitMask = ColliderTypeGround;
    physicsBody.collisionBitMask = ColliderTypePlayer;
    physicsBody.contactTestBitMask = ColliderTypePlayer | ColliderTypeEnemy | ColliderTypeObstacle;
    
    self.physicsBody = physicsBody;
}

@end
