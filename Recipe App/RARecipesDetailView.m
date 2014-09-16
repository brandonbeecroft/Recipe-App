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


-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.recipeTitle;

    // get the width of the screen
    CGFloat screenWidth = CGRectGetWidth(self.view.bounds);
    CGFloat startingYPosition = 10;
    CGFloat startingXPosition = 10;
    CGFloat calculatedYPosition = 0;
    CGFloat elementHeight = 100;
    CGFloat labelHeight = 0;

    // create a scrollview
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, self.view.frame.size.height)];

    // method needed to call image
    
    UIImageView *foodImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 180)];
    foodImage.image = [UIImage imageNamed:[RARecipes imageAtIndex:self.indexOfRecipe]];

    [scrollView addSubview:foodImage];
    //NSLog(@"Image name: %@",[RARecipes imageAtIndex:self.indexOfRecipe] );

    startingYPosition += 180;

    // recipe description
    UILabel *recipeDescription = [[UILabel alloc] initWithFrame:CGRectMake(startingXPosition, startingYPosition, screenWidth-10, elementHeight)];
    recipeDescription.text = [RARecipes descriptionAtIndex:self.indexOfRecipe];
    recipeDescription.lineBreakMode = NSLineBreakByWordWrapping;
    recipeDescription.numberOfLines = 0;
    recipeDescription.font = [UIFont systemFontOfSize:14];
    recipeDescription.textColor = [UIColor lightGrayColor];
    [recipeDescription sizeToFit];

    labelHeight = CGRectGetHeight(recipeDescription.bounds);
    calculatedYPosition = startingYPosition + labelHeight+10;

    // create a UIView to attach the ingredients to
    UIView *ingredientsView = [[UIView alloc] initWithFrame:CGRectMake(0, calculatedYPosition, screenWidth, 196)];

    //set topPos for ingredients
    int topPos = 40;

    UILabel *ingredientsLabel = [[UILabel alloc] initWithFrame:CGRectMake(startingXPosition, 0, screenWidth, 40)];
    ingredientsLabel.text = @"Ingredients";
    ingredientsLabel.font = [UIFont boldSystemFontOfSize:18];

    // loop through all ingredients in a recipe and output 2 labels side by side
    for (int x = 0; x < [RARecipes count]; x++) {
        // place your labels here
        UILabel *ingredientAmount = [[UILabel alloc] initWithFrame:CGRectMake(startingXPosition, topPos, 70, 40)];
        UILabel *ingredientName = [[UILabel alloc] initWithFrame:CGRectMake(100, topPos, 200, 40)];

        // retrieve text from the datasource
        ingredientAmount.text = [RARecipes ingredientVolumeAtIndex:x inRecipeAtIndex:self.indexOfRecipe];
        ingredientName.text = [RARecipes ingredientTypeAtIndex:x inRecipeAtIndex:self.indexOfRecipe];

        // increment topPos
        topPos += 30;

        // add to new view
        [ingredientsView addSubview:ingredientAmount];
        [ingredientsView addSubview:ingredientName];
        [ingredientAmount sizeToFit];
        [ingredientName sizeToFit];
    }
    [ingredientsView sizeToFit];

    calculatedYPosition += 160;

    // directions label
    UILabel *directionsLabel = [[UILabel alloc] initWithFrame:CGRectMake(startingXPosition, calculatedYPosition, screenWidth, elementHeight)];
    directionsLabel.text = @"Directions";
    directionsLabel.font = [UIFont boldSystemFontOfSize:18];

    // top of first direction
    int topMargin = calculatedYPosition + 68;
    int sizeOfDescriptionText = 0;

    // list out all the directions for the recipe
    NSArray *directionsArray = [RARecipes directionsAtIndex:self.indexOfRecipe];
    for (int x = 0; x < directionsArray.count; x++) {
        //create labels for each direction
        UILabel *directionText = [[UILabel alloc] initWithFrame:CGRectMake(startingXPosition, (topMargin+sizeOfDescriptionText), screenWidth-20, elementHeight)];
        directionText.text = directionsArray[x];

        directionText.lineBreakMode = NSLineBreakByWordWrapping;
        directionText.numberOfLines = 0;
        [directionText sizeToFit];
        sizeOfDescriptionText += directionText.frame.size.height;
        topMargin += 20;
        [scrollView addSubview:directionText];
        calculatedYPosition =+ sizeOfDescriptionText+topMargin;
    }

    NSLog(@"Calculated Y position: %f",calculatedYPosition);
    // add all views to the screen/scrollview
    [scrollView addSubview:directionsLabel];
    [ingredientsView addSubview:ingredientsLabel];
    [scrollView addSubview:recipeDescription];

    [ingredientsView sizeToFit];
    [scrollView addSubview:ingredientsView];

    // TODO find out the height of all elements and create the appropriate size of the scrollview
    [scrollView setContentSize:CGSizeMake(screenWidth, calculatedYPosition)];
    [self.view addSubview:scrollView];

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
