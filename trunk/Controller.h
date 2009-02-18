//
//  Controller.h
//  Calculator
//
//  Created by Jason Allum on 1/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// For convenience, we define our own type to represent the different possible operations
typedef enum {
    None = 0,
    /**/
    Add,
    Subtract,
    Multiply,
    Divide,
} CalcOp;

@interface Controller : NSObject {
    
	// This is an outlet to the main display field, 
	// were the number being entered or the result of the 
	// last operation will be displayed
	IBOutlet NSTextField *numDisplayField;
	
	// This an outlet to the smaller display field
	// on the left which displays the current operator
	// if applicable
	IBOutlet NSTextField *opDisplayField;
	
	// The outlet "newDisplayField" defined above is
	// bound to this value in MainMenu.xib.  We can then
	// update the value displayed in the user interface by
	// updating this NSString object
    NSString* numDisplayValue;
	
	// Similar to "numDisplayValue", this value is bound to
	// the "opDisplayField" outlet
	NSString* opDisplayValue;
	
	// Stores the current operation when applicable
    CalcOp curOp;
	
	// Flag that determins the display behavior of
	// numDisplayField.  If NO the display field is cleared, 
	// and the new number is display and flag is then set to YES.
	// If YES, the new number is simply concatendated to the tail 
	// of the old number
	BOOL isNumberBeingEntered;
	
	// stores the current total
	NSInteger total;
}

// -- Define properties

@property (retain) NSString* numDisplayValue;   // retain because it's an object
@property (retain) NSString* opDisplayValue;    // retain because it's an object
@property (assign) CalcOp curOp;                // assign because it's a primitive value
@property (assign) NSInteger total;             // assign because it's a primitive value

// -- Two Actions are defined for this controller class

// This action is associated with all number buttons via connections in the MainMenu.xib file
- (IBAction) digitButtonClicked:(id)sender;

// This action is associated with all operations buttons via connections in the MainMenu.xib file
- (IBAction) opButtonClicked:(id)sender;

// This is a utility method to perform a calculation with two integer operands and an operator (of type CalcOp)
- (NSInteger)integerResultFromOperand:(NSInteger)int1 operand:(NSInteger)int2 operator:(CalcOp)operator;
@end


