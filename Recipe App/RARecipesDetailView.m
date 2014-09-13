//
//  RARecipesDetailView.m
//  Recipe App
//
//  Created by Brandon Beecroft on 9/13/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "RARecipesDetailView.h"
#import "RARecipes.h"

@interface RARecipesDetailView ()


@end

@implementation RARecipesDetailView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.recipeTitle;

    // create a scrollview
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    // TODO find out the height of all elements and create the appropriate size of the scrollview
    [scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 2000)];
    [self.view addSubview:scrollView];


    UILabel *recipeDescription = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.view.frame.size.width-10, CGFLOAT_MAX)];
    recipeDescription.text = [RARecipes descriptionAtIndex:self.indexOfRecipe];

    recipeDescription.lineBreakMode = NSLineBreakByWordWrapping;
    recipeDescription.numberOfLines = 0;
    [recipeDescription sizeToFit];

    // ingredients list array
    UILabel *directionsLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 340, self.view.frame.size.width, 40)];
    directionsLabel.text = @"Directions";
    directionsLabel.font = [UIFont boldSystemFontOfSize:18];

    // top of first direction
    int topMargin = 380;
    int sizeOfDescriptionText = 0;

    // list out all the directions for the recipe
    NSArray *directionsArray = [RARecipes directionsAtIndex:self.indexOfRecipe];
    for (int x = 0; x < directionsArray.count; x++) {
        //create labels for each direction
        UILabel *directionText = [[UILabel alloc] initWithFrame:CGRectMake(10, (topMargin+sizeOfDescriptionText), self.view.frame.size.width, 80)];
        directionText.text = directionsArray[x];

        directionText.lineBreakMode = NSLineBreakByWordWrapping;
        directionText.numberOfLines = 0;
        [directionText sizeToFit];
        sizeOfDescriptionText += directionText.frame.size.height;
        topMargin += 20;
        [scrollView addSubview:directionText];
    }

    //set topPos for ingredients
    int topPos = 40;

    // create a UIView to attach the ingredients to
    UIView *ingredientsView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 1000)];
    UILabel *ingredientsLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width, 20)];
    ingredientsLabel.text = @"Ingredients";
    ingredientsLabel.font = [UIFont boldSystemFontOfSize:18];


    // loop through all ingredients in a recipe and output 2 labels side by side
    for (int x = 0; x < [RARecipes count]; x++) {
        // place your labels here
        UILabel *ingredientAmount = [[UILabel alloc] initWithFrame:CGRectMake(10, topPos, 70, 20)];
        UILabel *ingredientName = [[UILabel alloc] initWithFrame:CGRectMake(100, topPos, 200, 20)];

        // retrieve text from the datasource
        ingredientAmount.text = [RARecipes ingredientVolumeAtIndex:x inRecipeAtIndex:self.indexOfRecipe];
        ingredientName.text = [RARecipes ingredientTypeAtIndex:x inRecipeAtIndex:self.indexOfRecipe];

        // increment topPos
        topPos += 40;

        // add to new view
        [ingredientsView addSubview:ingredientAmount];
        [ingredientsView addSubview:ingredientName];
    }


    [scrollView addSubview:directionsLabel];
//    [scrollView addSubview:directions];
    [ingredientsView addSubview:ingredientsLabel];
    [scrollView addSubview:recipeDescription];

    [ingredientsView sizeToFit];
    [scrollView addSubview:ingredientsView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
