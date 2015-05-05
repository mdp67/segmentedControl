//
//  ViewController.m
//  segmentedControl
//
//  Created by Mark Porcella on 5/4/15.
//  Copyright (c) 2015 Mark Porcella. All rights reserved.
//

#import "ViewController.h"
//#include "math.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property NSNumber *caTax;
@property NSNumber *chiTax;
@property NSNumber *nyTax;
@property double selectedTax;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.caTax = @7.5;
    self.chiTax = @9.25;
    self.nyTax = @4.5;
    NSLog(@"%f", self.selectedTax);
    self.selectedTax = [self.caTax doubleValue];
}

- (void) displayTax {
    NSInteger numberFromText = [[self.priceTextField text] integerValue];
    double tax = numberFromText * self.selectedTax * 0.01;
    NSString *forDisplay = [NSString stringWithFormat:@"%.2f", tax];
    self.resultLabel.text = forDisplay;
}

- (IBAction)onCalculateButtonTapped:(id)sender {
    [self displayTax];

    [self.priceTextField resignFirstResponder];
}

// Change the tax rate based upon the segmented control selection
- (IBAction)stateChambed:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.selectedTax = [self.caTax doubleValue];
            break;
        case 1:
            self.selectedTax = [self.chiTax doubleValue];
            break;
        case 2:
            self.selectedTax = [self.nyTax doubleValue];
            break;
        default:
            break;
    }
    [self displayTax];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];

    if (![[touch view] isKindOfClass:[UITextField class]]) {
        [self.view endEditing:YES];
    }
    [super touchesBegan:touches withEvent:event];
}

@end
