//
//  RecipesTableViewDataSource.m
//  Recipe App
//
//  Created by Brandon Beecroft on 9/11/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "RecipesTableViewDataSource.h"
#import "RARecipesDetailView.h"
#import "RARecipes.h"


@implementation RecipesTableViewDataSource

-(void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 10;
    return [RARecipes count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

//    cell.textLabel.text = @"Brandon";
    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row];
    return cell;
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return @"Favorite Recipes";
//}

@end
