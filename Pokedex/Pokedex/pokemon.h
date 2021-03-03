//
//  pokemon.h
//  Pokedex
//
//  Created by Poste 3 on 01/03/2021.
//

#ifndef pokemon_h
#define pokemon_h

@interface Pokemon : NSObject

@property NSString *identifier;
@property NSArray *image;
@property NSString *name;
@property NSString *xp;
@property NSString *height;



- (instancetype) initWithIdentifier:(NSString *)identifier andName:(NSString *)name andImage:(NSArray *)image
                              andXp:(NSString *)xp andHeight:(NSString *)height;

@end

#endif /* pokemon_h */

