//
//  ComposeVC.m
//  twitter
//
//  Created by Seema Kamath on 8/17/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "ComposeVC.h"

@interface ComposeVC ()

- (IBAction) onCancel:(id)sender;

@end

@implementation ComposeVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (IBAction) onCancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
