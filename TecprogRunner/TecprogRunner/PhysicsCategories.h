//
//  PhysicsCategories.h
//  TecprogRunner
//
//  Used to define types of ColliderTypes
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#ifndef PhysicsCategories_h
#define PhysicsCategories_h

/**
 Collider Types
 @brief A list of Collider Categories used for contacts and collisions
*/
typedef NS_ENUM(NSUInteger, ColliderType){
    /**
     Identify as a Player
    */
    ColliderTypePlayer = 1 << 0,
    
    /**
     Identify as a Projectile
    */
    ColliderTypeProjectile = 1 << 1,
    
    /**
     Identify as a Enemy
    */
    ColliderTypeEnemy = 1 << 2,
    
    /**
     Identify as a Coin
    */
    ColliderTypeCoin = 1 << 3,
    
    /**
     Identify as a Obstacle
    */
    ColliderTypeObstacle = 1 << 4,
    
    /**
     Identify as Ground
    */
    ColliderTypeGround = 1 << 5,
    
    /**
     Identify as NO_TYPE
     */
    ColliderTypeNone = 0
    
};

#endif