//
//  DetailsViewController.m
//  Pokedex
//
//  Created by Poste 3 on 02/03/2021.
//

#import "DetailsViewController.h"
#import <SDWebImage/SDWebImage.h>


@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *frontSprite = [[self.pokemon image] valueForKey:@"front_default"];
    NSString *shinySprite = [[self.pokemon image] valueForKey:@"front_shiny"];
    
    [self.imageDetail sd_setImageWithURL:[NSURL URLWithString:frontSprite]];
    [self.shinyImg sd_setImageWithURL:[NSURL URLWithString:shinySprite]];

    [self.normalLabel setText:@"Default"];
    [self.shinyLabel setText:@"Shiny"];
    
    NSString *height = [NSMutableString stringWithFormat:@"HEIGHT : %@0 cm", [self.pokemon height]];
    NSString *xp = [NSMutableString stringWithFormat:@"BASE XP : %@", [self.pokemon xp]];
    NSString *identifier = [NSMutableString stringWithFormat:@"#%@", [self.pokemon identifier]];
    
    [self.identifier setText:identifier];
    [self.xpLabel setText:xp];
    [self.heightLabel setText:height];
    
    NSLog(@"%@/%@/%@", [self.pokemon identifier], [self.pokemon xp], [self.pokemon height]);

    self.navigationItem.title = [self.pokemon name];
    
    // Do any additional setup after loading the view.
}

@end
