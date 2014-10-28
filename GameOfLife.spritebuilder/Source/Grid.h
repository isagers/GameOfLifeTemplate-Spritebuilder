//
//  Grid.h
//  GameOfLife
//
//  Created by Isabel Gomez on 10/28/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Grid : CCSprite

@property (nonatomic,assign) int totalAlive;
@property (nonatomic,assign) int generation;

-(void)evolveStep;
-(void)countNeighbors;
-(void)updateCreatures;

@end
