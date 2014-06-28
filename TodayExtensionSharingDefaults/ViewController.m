//
//  ViewController.m
//  TodayExtensionSharingDefaults
//
//  Created by Lukas Petr on 25/06/14.
//  Copyright (c) 2014 Lukas Petr. All rights reserved.
//




#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation ViewController

- (IBAction)setButtonPressed:(id)sender {
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.TodayExtensionSharingDefaults"];
    
    [sharedDefaults setInteger:[self.textField.text integerValue] forKey:@"MyNumberKey"];
    [sharedDefaults synchronize];   // (!!) This is crucial.
}

            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
