//
//  PhysicsCategories.h
//  TecprogRunner
//
//  Created by Julio Xavier on 24/09/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#ifndef PhysicsCategories_h
#define PhysicsCategories_h

// Defining types with binary
typedef NS_ENUM(NSUInteger, ColliderType){
    // 'Binary Shift Right Operation' for differentiate type of objects in physics
    ColliderTypePlayer = 1 << 0,
    ColliderTypeProjectile = 1 << 1,
    ColliderTypeEnemy = 1 << 2
};

#endif