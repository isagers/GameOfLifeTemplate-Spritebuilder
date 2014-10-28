//
//  Creature.m
//  GameOfLife
//
//  Created by Isabel Gomez on 10/28/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Creature.h"

@implementation Creature

-(instancetype)initCreature{
    //since we made creature inherit from CCSprite, super below refers to CCSprite
    self = [super initWithImageNamed:@"GameOfLifeAssets/Assets/balloon.png"];
    
    if(self){
        self.isAlive = NO;
    }
    return self;
}

-(void)setIsAlive:(BOOL)newState{
    //when you create an @property as we did in the .h, an instance variable with a leading underscore is automatically created for you
    _isAlive = newState;
    self.visible = _isAlive;
}

@end
