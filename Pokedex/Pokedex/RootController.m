//
//  ViewController.m
//  Pokedex
//
//  Created by Poste 3 on 01/03/2021.
//

#import "RootController.h"
#import "DetailsViewController.h"
#import <SDWebImage/SDWebImage.h>

@interface RootController ()

@end

@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getPokemons];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationItem.title = @"Pokedex";
    
}

- (void)getPokemons {
    dispatch_group_t group = dispatch_group_create();
    
    self.pokemons = [[NSMutableArray alloc] init];
    
    for (int pokemonIdentifier = 1; pokemonIdentifier <= 151; pokemonIdentifier++)
    {
        NSURLSession *session = [NSURLSession sharedSession];
        NSMutableString *url = [NSMutableString stringWithFormat:@"https://pokeapi.co/api/v2/pokemon/%d", pokemonIdentifier];
        NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:url]
                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
            NSError *jsonError;
            NSArray *JSONresp = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            NSArray *sprites = [JSONresp valueForKey:@"sprites"];

            Pokemon *pokemon = [[Pokemon alloc] initWithIdentifier:(NSString *)[JSONresp valueForKey:@"id"]
                                                           andName:(NSString *)[JSONresp valueForKey:@"name"]
                                                            andImage:sprites
                                                             andXp:(NSString *)[JSONresp valueForKey:@"base_experience"]
                                                                andHeight:(NSString *)[JSONresp valueForKey:@"height"]];
            
            [self.pokemons addObject:pokemon];
            
            dispatch_group_leave(group);
        }];

        dispatch_group_enter(group);
        
        [dataTask resume];
    }
    
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PokemonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PokemonCell"];
    
    [self.pokemons sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"identifier" ascending:YES]]];
    
    Pokemon *pokemon = [self.pokemons objectAtIndex:indexPath.row];
    
    [cell.name setText:[pokemon name]];
    
    NSString *identifier = [NSMutableString stringWithFormat:@"#%@", [pokemon identifier]];
    [cell.identifer setText:identifier];
    
    NSString *frontSprite = [[pokemon image] valueForKey:@"front_default"];
    
    [cell.image sd_setImageWithURL:[NSURL URLWithString:frontSprite]];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.pokemons count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //[self performSegueWithIdentifier:@"SegueFromRootToDetails" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual: @"pokemonDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        Pokemon *pokemon = [self.pokemons objectAtIndex:indexPath.row];
        
        //NSLog(@"Efipeek destination controller %@ with Pokémon %@", segue.destinationViewController, [self.pokemons objectAtIndex:indexPath.row]);
        DetailsViewController *details = [segue destinationViewController];
        
        details.pokemon = pokemon;
    
    }
}

@end
