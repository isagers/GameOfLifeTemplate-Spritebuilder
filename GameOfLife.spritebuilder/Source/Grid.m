//
//  Grid.m
//  GameOfLife
//
//  Created by Isabel Gomez on 10/28/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Creature.h"

static const int GRID_ROWS = 8;
static const int GRID_COLUMNS = 10;

@implementation Grid{
    NSMutableArray *_gridArray;
    float _cellWidth;
    float _cellHeight;
}

-(void)onEnter{
    [super onEnter];
    [self setUpGrid];
    
    self.userInteractionEnabled = YES;
}

-(void)setUpGrid{
    _cellWidth = self.contentSize.width/GRID_COLUMNS;
    _cellHeight = self.contentSize.height/GRID_ROWS;
    
    float x = 0;
    float y = 0;
    
    _gridArray = [NSMutableArray array];
    
    //initialize creatures
    for(int i = 0; i < GRID_ROWS; i++){
        //2 dimensional array
        _gridArray[i] = [NSMutableArray array];
        x = 0;
        for(int j = 0; j < GRID_COLUMNS; j++){
            Creature *creature = [[Creature alloc] initCreature];
            creature.anchorPoint = ccp(0,0);
            creature.position = ccp(x,y);
            [self addChild:creature];
            
            _gridArray[i][j] = creature;
            //creature.isAlive = YES;
            x += _cellWidth;
        }
        y += _cellHeight;
    }
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    //get x,y coordinates of the touch
    CGPoint touchLocation = [touch locationInNode:self];
    
    //get the creature of that location
    Creature *creature = [self creatureForTouchPostion:touchLocation];
    //invert state
    creature.isAlive = !creature.isAlive;
}

-(Creature *)creatureForTouchPostion:(CGPoint)touchPosition{
    //get the row/column touched and return creature
    int row = touchPosition.y/_cellHeight;
    int column = touchPosition.x/_cellWidth;
    return _gridArray[row][column];
}

@end
