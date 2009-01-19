//
//  LittleTipper2AppDelegate.m
//  LittleTipper2
//
//  Created by Andy Mroczkowski on 1/15/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "LittleTipper2AppDelegate.h"
#import "LittleTipper2ViewController.h"

@implementation LittleTipper2AppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
