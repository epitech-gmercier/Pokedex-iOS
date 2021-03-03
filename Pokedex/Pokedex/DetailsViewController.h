//
//  DetailsViewController.h
//  Pokedex
//
//  Created by Poste 3 on 02/03/2021.
//

#import <UIKit/UIKit.h>
#import "pokemon.h"
#import "RootController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (nonatomic, strong) Pokemon *pokemon;
@property (weak, nonatomic) IBOutlet UIImageView *imageDetail;
@property (weak, nonatomic) IBOutlet UIImageView *shinyImg;
@property (weak, nonatomic) IBOutlet UILabel *normalLabel;
@property (weak, nonatomic) IBOutlet UILabel *shinyLabel;
@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *xpLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;

@end

NS_ASSUME_NONNULL_END
