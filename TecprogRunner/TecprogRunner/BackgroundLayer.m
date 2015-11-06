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
    
    NSMutableArray<Tile*>* _tiles;
    NSMutableArray<GameObject*>* _clouds;
    
    TileGenerator* _tileGenerator;

    GameObject* lastGameObject;
}

-(instancetype) initWithSize:(CGSize)size andBodyAdder:(id<physicsControllerAddBody>)physicsBodyAdder{
    
    NSAssert(physicsBodyAdder != nil, @"physicsBodyAdder is nil on BackgroundLayer");
    
    DebugLog(@"Initializing BackgroundLayer");
    
    self = [super init];
    
    if(self != nil){
        
        self.physicsBodyAdder = physicsBodyAdder;
        
        _clouds = [[NSMutableArray<GameObject*> alloc] init];
        _tiles = [[NSMutableArray<Tile*> alloc] init];
        _tileGenerator = [[TileGenerator alloc] init];
        _size = size;
        
        CGSize firstGroundSize = CGSizeMake(_size.width*2,_size.height*0.1);
        CGPoint positionTile = CGPointMake(0, 0);
    
        [self setClouds];
        
        // Initializating initial tile
        [self createTileWithSize:firstGroundSize andPosition:positionTile];
        
        [self generateTiles];
        
    }else{
        // Throw exception
    }
    
    return self;
}

-(void) createTileWithSize:(CGSize) size andPosition:(CGPoint) position{
    
    DebugLog(@"creating new tile");
    Tile *tile = [_tileGenerator createTileGroundWithSize:size];
    tile.position = position;
    lastGameObject = tile;
    tile.velocity = CGVectorMake(BACKGROUND_VELOCITY_X, 0.0);
    
    [self.physicsBodyAdder addBody:tile];
    // Adding background to view
    [self addChild:tile];
    [_tiles addObject:tile];
}

-(void) removeTile:(Tile*) tile{
    [_tiles removeObject:tile];
    [tile removeFromParent];
    
    [_tileGenerator recycleTile:tile];
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

-(void) updateWithDeltaTime:(CFTimeInterval)deltaTime{
    
    for (int i = 0; i < _tiles.count; i++) {
        
        Tile* tile = (Tile*) _tiles[i];
        
        if(tile.position.x + tile.size.width < 0.0){
            [self removeTile:tile];
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
    CGSize tileSize = CGSizeMake(tileWidth, 50);

    double maxX = lastGameObject.position.x + lastGameObject.size.width/2;
    
    float initialX = maxX + 70 + rand()%70;
    
    CGPoint tilePosition = CGPointMake(initialX + tileSize.width/2, tileSize.height/2);

    [self createTileWithSize:tileSize andPosition:tilePosition];
    
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
