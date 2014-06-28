//
//  TodayViewController.m
//  NumberWidget
//
//  Created by Lukas Petr on 25/06/14.
//  Copyright (c) 2014 Lukas Petr. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@end

@implementation TodayViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(userDefaultsDidChange:)
                                                     name:NSUserDefaultsDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.preferredContentSize = CGSizeMake(320, 50);
    [self updateNumberLabelText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encoutered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (void)userDefaultsDidChange:(NSNotification *)notification {
    [self updateNumberLabelText];
}

- (void)updateNumberLabelText {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.TodayExtensionSharingDefaults"];
    NSInteger number = [defaults integerForKey:@"MyNumberKey"];
    self.numberLabel.text = [NSString stringWithFormat:@"%d", number];
}

@end
