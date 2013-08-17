//
//  ComposeVC.m
//  twitter
//
//  Created by Seema Kamath on 8/17/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "ComposeVC.h"
#import "TwitterClient.h"

@interface ComposeVC ()

- (IBAction)onCancel:(id)sender;
- (IBAction)onPost:(id)sender;

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
    
    self.tweetTextView.delegate = self;
    [self.tweetTextView becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TextView delegates

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    
    return YES;
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
   
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //Don't allow new characters after 140
    if([text isEqualToString:@"\b"]){
        return YES;
    }else if([[textView text] length] - range.length + text.length > 140){
        return NO;
    }

    return YES;
}

- (BOOL)textViewShouldReturn:(UITextField *)textView
{
    [textView resignFirstResponder];
    return YES;
}


#pragma mark - Private methods

- (IBAction) onCancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onPost:(id)sender {

    //post the text to twitter
    [[TwitterClient instance] postTweet:self.tweetTextView.text success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        //Dismiss the modal dialog on successful POST.
        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Do nothing
    }];
}


@end
