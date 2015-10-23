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
 Categorize types of physics body
*/
typedef NS_ENUM(NSUInteger, ColliderType){
    // 'Binary Shift Right Operation' for differentiate type of objects in physics
    ColliderTypePlayer = 1 << 0,
    ColliderTypeProjectile = 1 << 1,
    ColliderTypeEnemy = 1 << 2,
    ColliderTypeCoin = 1 << 3,
    ColliderTypeObstacle = 1 << 4,
    ColliderTypeGround = 1 << 5
};

#endif