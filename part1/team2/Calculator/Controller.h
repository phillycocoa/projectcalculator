//
//  Controller.h
//  Calculator
//
//  Created by Jason Allum on 1/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef enum {
    None = 0,
    /**/
    Add,
    Subtract,
    Multiply,
    Divide,
} CalcOp;

@interface Controller : NSObject {
    IBOutlet NSTextField* display;
    
    NSString* value;
    CalcOp operation;
}

@property (retain) NSString* value;

- (IBAction) buttonClicked:(id)sender;

@end
