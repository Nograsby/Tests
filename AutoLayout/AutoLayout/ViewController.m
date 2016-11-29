//
//  ViewController.m
//  AutoLayout
//
//  Created by Vladimir Ananko on 11/29/16.
//  Copyright © 2016 Vladimir Ananko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *buttonOne = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonOne setTitle:@"Button 1" forState:UIControlStateNormal];
    buttonOne.tag = 1;
    buttonOne.backgroundColor = [UIColor orangeColor];
    buttonOne.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIButton *buttonTwo = [UIButton buttonWithType:UIButtonTypeRoundedRect];[buttonTwo setTitle:@"Button 2" forState:UIControlStateNormal];
    buttonTwo.tag = 2;
    buttonTwo.backgroundColor = [UIColor orangeColor];
    buttonTwo.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIButton *buttonThree = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonThree setTitle:@"Button 3" forState:UIControlStateNormal];
    buttonThree.tag = 3;
    buttonThree.backgroundColor = [UIColor orangeColor];
    buttonThree.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview: buttonOne];
    [self.view addSubview: buttonTwo];
    [self.view addSubview: buttonThree];
   
    // Constraints from code
    NSLayoutConstraint *pinToLeft = [NSLayoutConstraint constraintWithItem:buttonOne
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1.0f
                                                                  constant:16.0f];
    
    NSLayoutConstraint *pinToRight = [NSLayoutConstraint constraintWithItem:buttonThree
                                                                  attribute:NSLayoutAttributeTrailing
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeTrailing
                                                                 multiplier:1.0f
                                                                   constant:-16.0f];
    
    NSLayoutConstraint *horizontalSpace1 = [NSLayoutConstraint constraintWithItem:buttonTwo
                                                                        attribute:NSLayoutAttributeLeading
                                                                        relatedBy:NSLayoutRelationLessThanOrEqual
                                                                           toItem:buttonOne
                                                                        attribute:NSLayoutAttributeTrailing
                                                                       multiplier:1.0f
                                                                         constant:20.0f];
    
    NSLayoutConstraint *horizontalSpace2 = [NSLayoutConstraint constraintWithItem:buttonThree
                                                                        attribute:NSLayoutAttributeLeading
                                                                        relatedBy:NSLayoutRelationLessThanOrEqual
                                                                           toItem:buttonTwo
                                                                        attribute:NSLayoutAttributeTrailing
                                                                       multiplier:1.0f
                                                                         constant:20.0f];
    
    NSLayoutConstraint *vertical1 = [NSLayoutConstraint constraintWithItem:buttonOne
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-70.0f];
    
    NSLayoutConstraint *vertical2 = [NSLayoutConstraint constraintWithItem:buttonTwo
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-70.0f];
    
    NSLayoutConstraint *vertical3 = [NSLayoutConstraint constraintWithItem:buttonThree
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-70.0f];
    
    NSLayoutConstraint *center = [NSLayoutConstraint constraintWithItem:buttonTwo
                                                              attribute:NSLayoutAttributeCenterX
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeCenterX
                                                             multiplier:1.0f
                                                               constant:0.0f];
    
    NSLayoutConstraint *width1 = [NSLayoutConstraint constraintWithItem:buttonTwo
                                                              attribute:NSLayoutAttributeWidth
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:buttonOne
                                                              attribute:NSLayoutAttributeWidth
                                                             multiplier:1.0f
                                                               constant:0.0f];
    
    NSLayoutConstraint *width2 = [NSLayoutConstraint constraintWithItem:buttonTwo
                                                              attribute:NSLayoutAttributeWidth
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:buttonThree
                                                              attribute:NSLayoutAttributeWidth
                                                             multiplier:1.0f
                                                               constant:0.0f];
    
    [self.view addConstraints:@[vertical1, vertical2, vertical3, pinToLeft, pinToRight, center, horizontalSpace1, horizontalSpace2, width1, width2]];


    // Visual constraints
    UIButton *buttonOneV = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonOneV setTitle:@"Button 1" forState:UIControlStateNormal];
    buttonOneV.tag = 1;
    buttonOneV.backgroundColor = [UIColor orangeColor];
    buttonOneV.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIButton *buttonTwoV = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonTwoV setTitle:@"Button 2" forState:UIControlStateNormal];
    buttonTwoV.tag = 2;
    buttonTwoV.backgroundColor = [UIColor orangeColor];
    buttonTwoV.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIButton *buttonThreeV = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonThreeV setTitle:@"Button 3" forState:UIControlStateNormal];
    buttonThreeV.tag = 3;
    buttonThreeV.backgroundColor = [UIColor orangeColor];
    buttonThreeV.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview: buttonOneV];
    [self.view addSubview: buttonTwoV];
    [self.view addSubview: buttonThreeV];
    
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(buttonOneV, buttonTwoV, buttonThreeV);
    NSNumber *space= @20.0f;
    NSDictionary *metrics = NSDictionaryOfVariableBindings(space);
    
    NSString *format = @"|-[buttonOneV]-(<=space)-[buttonTwoV(==buttonOneV)]-(<=space)-[buttonThreeV(==buttonTwoV)]-|";
    
    NSArray *visualConstraintsArray = [NSLayoutConstraint constraintsWithVisualFormat:format
                                                                              options:NSLayoutFormatDirectionLeadingToTrailing
                                                                              metrics:metrics
                                                                                views:viewsDictionary];
    
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    [constraints addObjectsFromArray:visualConstraintsArray];
    
    NSLayoutConstraint *vertical1V = [NSLayoutConstraint constraintWithItem:buttonOneV
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0f
                                                                   constant:-120.0f];
    
    NSLayoutConstraint *vertical2V = [NSLayoutConstraint constraintWithItem:buttonTwoV
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0f
                                                                   constant:-120.0f];
    
    NSLayoutConstraint *vertical3V = [NSLayoutConstraint constraintWithItem:buttonThreeV
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0f
                                                                   constant:-120.0f];
    
    NSLayoutConstraint *centerV = [NSLayoutConstraint constraintWithItem:buttonTwoV
                                                               attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:1.0f
                                                                constant:0.0f];

    [constraints addObject:vertical1V];
    [constraints addObject:vertical2V];
    [constraints addObject:vertical3V];
    [constraints addObject:centerV];
    
    [self.view addConstraints:constraints];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
