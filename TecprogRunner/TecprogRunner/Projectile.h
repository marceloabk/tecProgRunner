//
//  Projectile.h
//  TecprogRunner
//
//  Created by Marcelo Cristiano Araujo Silva on 17/09/15.
//  Copyright © 2015 Bepid-UnB. All rights reserved.
//

#import "GameObject.h"

#define DEFAULT_PROJECTILE_IMAGE @"projectile"
#define PLAYER_NAME @"Player"
#define ENEMY_NAME @"Enemy"

@interface Projectile : GameObject

/**
 Initialize the projectile with a position
 and a string representing the class of the owner
*/
-(instancetype) initWithPosition:(CGPoint)position andOwner:(NSString*)ownerName;

@end
