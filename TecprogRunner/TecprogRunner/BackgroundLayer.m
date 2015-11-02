//
//  BackgroundLayer.m
//  TecprogRunner
//
//  Define a background for the game
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "BackgroundLayer.h"
#import "GameObject.h"
#import "PhysicsCategories.h"
#import "PhysicsController.h"

#define CLOUDS_WIDTH 2160

/**
 Imaginary line between
 two points
*/
struct line{
    CGPoint point1;
    CGPoint point2;
};

@implementation BackgroundLayer{
    
    CGSize _size;
    CGPoint _initialPoint;
    float backgroundDefaultVelocity;

    NSMutableArray<GameObject*>* _tiles;
    NSMutableArray<GameObject*>* _removedTiles;
    NSMutableArray<GameObject*>* _clouds;

    GameObject* lastGameObject;
}

-(instancetype) initWithSize:(CGSize)size andBodyAdder:(id<physicsControllerAddBody>)physicsBodyAdder{
    
    NSAssert(physicsBodyAdder != nil, @"physicsBodyAdder is nil on BackgroundLayer");
    
    DebugLog(@"Initializing BackgroundLayer");
    
    self = [super init];
    
    if(self != nil){
        
        self.physicsBodyAdder = physicsBodyAdder;
        
        _tiles = [[NSMutableArray<GameObject*> alloc] init];
        _removedTiles = [[NSMutableArray<GameObject*> alloc] init];
        _clouds = [[NSMutableArray<GameObject*> alloc] init];
        _size = size;
        
        CGSize firstGroundSize = CGSizeMake(_size.width*2,_size.height*0.1);
    
        [self setClouds];
        
        // Initializating initial tiles
        GameObject *firstGround = [self createTileGroundWithSize:firstGroundSize];
        firstGround.position = CGPointMake(0.0, 0.0);
        
        lastGameObject = firstGround;
        
        [self generateTiles];
        
        // Adding background to view
        [self addChild:firstGround];
        
    }else{
        // Throw exception
    }
    
    return self;
}

// Instantiating background Clouds
-(void) setClouds{
    
    GameObject* firstClouds = [[GameObject alloc] initWithImageNamed:@"background_Clouds"];
    firstClouds.size = CGSizeMake(CLOUDS_WIDTH, _size.height);
    firstClouds.position = CGPointZero;
    firstClouds.anchorPoint = CGPointZero;
    firstClouds.zPosition = -1;
    firstClouds.velocity = CGVectorMake(BACKGROUND_VELOCITY_X/20, 0.0);
    
    [self.physicsBodyAdder addBody:firstClouds];
    [_clouds addObject:firstClouds];
    [self addChild:firstClouds];
    
    GameObject* secondClouds = [[GameObject alloc] initWithImageNamed:@"background_Clouds"];
    secondClouds.size = CGSizeMake(CLOUDS_WIDTH, _size.height);
    secondClouds.position = CGPointMake(CLOUDS_WIDTH, 0.0);
    secondClouds.anchorPoint = CGPointZero;
    secondClouds.zPosition = -1;
    secondClouds.velocity = CGVectorMake(BACKGROUND_VELOCITY_X/20, 0.0);
    
    [self.physicsBodyAdder addBody:secondClouds];
    [_clouds addObject:secondClouds];
    [self addChild:secondClouds];
}

-(GameObject*) createTileGroundWithSize:(CGSize)size{
    
    GameObject* tile;
    if(_removedTiles.count <= 0 || true){
        tile = [[GameObject alloc] initWithColor:GREEN_COLOR size:size];
        tile.name = @"ground";
        tile.position = CGPointMake(0.0, 0.0);
        tile.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:size];
        
        tile.physicsBody.categoryBitMask = ColliderTypeGround;
        tile.physicsBody.affectedByGravity = false;
        tile.physicsBody.dynamic = false;
        tile.physicsBody.allowsRotation = false;
        tile.physicsBody.collisionBitMask = ColliderTypePlayer;
        tile.physicsBody.contactTestBitMask = ColliderTypePlayer | ColliderTypeEnemy | ColliderTypeObstacle;
        tile.velocity = CGVectorMake(BACKGROUND_VELOCITY_X, 0.0);
    }else{
        tile = [_removedTiles lastObject];
        [_removedTiles removeLastObject];
        tile.size = size;
        tile.velocity = CGVectorMake(BACKGROUND_VELOCITY_X, 0.0);
    }
    
    [self.physicsBodyAdder addBody:tile];
        
    // Adding tile to array
    [_tiles addObject:tile];
    
    return tile;
}

-(void) updateWithDeltaTime:(CFTimeInterval)deltaTime{
    
    for (int i = 0; i < _tiles.count; i++) {
        
        GameObject* tile = (GameObject*) _tiles[i];
        
        if(tile.position.x + tile.size.width < 0.0){
            [_tiles removeObject:tile];
            [tile removeFromParent];
            [_removedTiles addObject:tile];

        }else{
            // There's no alternative path
        }
    }
    
    for(GameObject* clouds in _clouds){
        if(clouds.position.x + clouds.size.width < 0.0){
            clouds.position = CGPointMake(CLOUDS_WIDTH*0.99, 0.0);
        }else{
            // There's no alternative path
        }
    }
    
}

-(void) generateTiles{
    
    srand(CACurrentMediaTime());
    
    CGFloat tileWidth = 45 + rand()%250;
    
    GameObject* newTile = [self createTileGroundWithSize:CGSizeMake(tileWidth, 20)];
    double maxX = lastGameObject.position.x + lastGameObject.size.width/2;
    
    float initialX = maxX + 70 + rand()%70;
    
    newTile.position = CGPointMake(initialX + newTile.size.width/2, newTile.size.height/2);
    
    [self addChild:newTile];
    
    lastGameObject = newTile;
    
    newTile.velocity = CGVectorMake(BACKGROUND_VELOCITY_X, 0.0);
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(generateTiles) userInfo:nil repeats:NO];
}

-(CGPoint) calculateInitialPointByLine:(struct line)line andX:(double)x{

    double partX = (line.point1.y - line.point2.y);
    double partXY = line.point1.x*line.point2.y - line.point2.x*line.point1.y;
    double partY = (line.point1.x - line.point2.x);
    
    double y = ( x * partX +  partXY) / partY;
    
    return CGPointMake(x, y);
}


@end
