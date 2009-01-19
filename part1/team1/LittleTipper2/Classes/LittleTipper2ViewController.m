//
//  LittleTipper2ViewController.m
//  LittleTipper2
//
//  Created by Andy Mroczkowski on 1/15/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "LittleTipper2ViewController.h"

@implementation LittleTipper2ViewController



/*
// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}




- (IBAction)calculate
{
	NSLog( @"calculate" );

	// -- get number of guests as an int
	NSString *numberOfGuestsFieldText = [numberOfGuestsField text];
	NSLog( @"numberOfGuestsFieldText: %@", numberOfGuestsFieldText );
	
	float numberOfGuestsFieldInt = [numberOfGuestsFieldText intValue];
	NSLog( @"numberOfGuestsFieldInt: %f", numberOfGuestsFieldInt );
	
	
	// -- get total as float
	NSString *totalFieldText = [totalField text];
	NSLog( @"totalFieldText: %@", totalFieldText );
	
	float totalFieldDouble = [totalFieldText floatValue];
	NSLog( @"totalFieldDouble: %f", totalFieldDouble );

	
	// -- get tip percentage
	float tipPercent = [tipSlider value];
	float totalTip = totalFieldDouble * tipPercent;
	float tipPerPerson = totalTip / numberOfGuestsFieldInt;
	
	NSLog( @"tipPerPerson: %f", tipPerPerson );
	
	// -- hooray, update UI
	
	
	[numberOfGuestsField resignFirstResponder];
	[totalField resignFirstResponder];
	
	
	// -- unhide the label
	[finalLabel setText:[[NSNumber numberWithFloat:tipPerPerson] stringValue]];	
	
	[finalLabel setHidden:NO];

}


@end
