//
//  PokemonTableViewCell.h
//  Pokedex
//
//  Created by Poste 3 on 03/03/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PokemonTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *identifer;

@end

NS_ASSUME_NONNULL_END
