//
//  pokemon.m
//  Pokedex
//
//  Created by Poste 3 on 01/03/2021.
//

#import <Foundation/Foundation.h>
#import "pokemon.h"

@implementation Pokemon

- (id) init {
    self = [super init];
    return self;
}

- (instancetype) initWithIdentifier:(NSString *)identifier andName:(NSString *)name andImage:(NSArray *)image
                              andXp:(NSString *)xp andHeight:(NSString *)height; {
    self = [super init];
    
    if (self) {
        self.identifier = identifier;
        self.name = name;
        self.image = image;
        self.height = height;
        self.xp = xp;
    }
    
    return self;
}

@end
