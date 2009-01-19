//
//  LittleTipper2AppDelegate.h
//  LittleTipper2
//
//  Created by Andy Mroczkowski on 1/15/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LittleTipper2ViewController;

@interface LittleTipper2AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LittleTipper2ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LittleTipper2ViewController *viewController;

@end

