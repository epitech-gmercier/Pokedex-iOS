//
//  RootController.h
//  Pokedex
//
//  Created by Poste 3 on 01/03/2021.
//

#import <UIKit/UIKit.h>
#import "pokemon.h"
#import "PokemonTableViewCell.h"

@interface RootController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray<Pokemon*> *pokemons;

@end
