//
//  RAViewController.m
//  Recipe App
//
//  Created by Brandon Beecroft on 9/11/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "RAViewController.h"
#import "RecipesTableViewDataSource.h"
#import "RARecipesDetailView.h"
#import "RARecipes.h"

@interface RAViewController () <UITableViewDelegate>


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RecipesTableViewDataSource *dataSource;

@end

@implementation RAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"Favorite Recipes";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(.9960) green:(.324) blue:(.0507) alpha:1];
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],
      NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica-neue" size:0.0],
      NSFontAttributeName,nil]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.dataSource = [RecipesTableViewDataSource new];
    [self.dataSource registerTableView:self.tableView];
    self.tableView.dataSource = self.dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    RARecipesDetailView *recipeDetailView = [RARecipesDetailView new];
    recipeDetailView.recipeTitle = [RARecipes titleAtIndex: indexPath.row];
    recipeDetailView.indexOfRecipe = indexPath.row;
    
    [self.navigationController pushViewController:recipeDetailView animated:YES];

    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
     
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
