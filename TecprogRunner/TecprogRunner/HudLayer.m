//
//  HudLayer.m
//  TecprogRunner
//
//  Contain aditional information, like score
//
//  Copyright (c) 2015 Group 8 - Tecprog 2/2015. All rights reserved.

#import "HudLayer.h"

@implementation HudLayer{
    CGSize _size;
}

-(instancetype) initWithSize:(CGSize)size{
    
    DebugLog(@"Initializing");
    
    self = [super init];
    
    if(self != NULL){
        _size = size;
        
        self.layer = [SKNode node];
        
        [self addChild:self.layer];
                
        // Adding a label to count score during the game
        [self putTimeLabel:0];
    }else{
        // Exception
    }
    
    return self;
}

-(void) putTimeLabel:(int)timePassed{
    
    // Setting font position
    CGPoint fontPosition = CGPointMake(_size.width*0.5, _size.height*0.9);
    
    // Text for timeLabel
    NSString *timeLabelString = [[NSString alloc] initWithFormat:@"%i", timePassed];
    
    if(self.timeLabel == nil){
        self.timeLabel = [Label label];
    }else{
        // The time label already exists
    }
    
    // Setting position on screen
    self.timeLabel.position = fontPosition;
    
    // Adding score label to layer
    [self addChild:self.timeLabel];
    
    self.timeLabel.text = timeLabelString;
}

-(void) putScoreLabel:(int)points{
    
    // Setting font position
    CGPoint fontPosition = CGPointMake(_size.width*0.8, _size.height*0.9);
    
    // Text for pointsLabel
    NSString *pointsLabelString = [[NSString alloc] initWithFormat:@"%i", points];
    
    if(self.scoreLabel == nil){
        // Setting score label
        self.scoreLabel = [Label label];
    }else{
        // The score label already exists
    }
    
    // Setting position on screen
    self.scoreLabel.position = fontPosition;
    
    // Adding score label to layer
    [self addChild:self.scoreLabel];
    
    self.scoreLabel.text = pointsLabelString;
    
}

-(void) activateLayer{

}

@end
