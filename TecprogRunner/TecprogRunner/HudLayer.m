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
    
    if(self != nil){
        _size = size;
        
        self.layer = [SKNode node];
        
        [self addChild:self.layer];
                
        [self putScoreLabel];
        [self putTimeLabel];
        
    }else{
        // Exception
    }
    
    return self;
}

-(void) updateTimeLabel:(int)timePassed{
    
    // Text for timeLabel
    NSString *timeLabelString = [[NSString alloc] initWithFormat:@"%i", timePassed];
    
    self.timeLabel.text = timeLabelString;
}

-(void) updateScoreLabel:(int)points{
    
    // Text for pointsLabel
    NSString *pointsLabelString = [[NSString alloc] initWithFormat:@"%i", points];
    
    self.scoreLabel.text = pointsLabelString;
    
}

-(void) putScoreLabel{
    
    // Setting font position
    CGPoint fontPosition = CGPointMake(_size.width*0.85, _size.height*0.9);
    
    if(self.scoreLabel == nil){
        // Setting score label
        self.scoreLabel = [Label labelWithText:@"0" andPosition:fontPosition andSize:38 andZPosition:100];
        
        [self addChild:self.scoreLabel];
    }else{
        // The score label already exists
    }
    
}

-(void) putTimeLabel{
    
    // Setting font position
    CGPoint fontPosition = CGPointMake(_size.width*0.5, _size.height*0.9);
    
    if(self.timeLabel == nil){
        
        self.timeLabel = [Label labelWithText:@"0" andPosition:fontPosition andSize:38 andZPosition:100];
        [self addChild:self.timeLabel];
        
    }else{
        // The time label already exists
    }
    
}

-(void) activateLayer{

}

@end
