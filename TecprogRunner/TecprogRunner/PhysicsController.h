//
//  PhysicsController.h
//  TecprogRunner
//
//  Created by Lucas Araujo on 10/9/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "GlobalHeaders.h"
#import "GameObject.h"

@interface PhysicsController : NSObject

/**
 Array of bodies inside physics world
*/
@property (nonatomic) NSMutableArray<GameObject*> *bodies;

/**
 Each frame physics controller updates physics world, applying bodies velocities.
*/
-(void) update:(CFTimeInterval)currentTime;

@end
