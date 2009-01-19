//
//  LittleTipper2ViewController.h
//  LittleTipper2
//
//  Created by Andy Mroczkowski on 1/15/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LittleTipper2ViewController : UIViewController
{
	IBOutlet UITextField *numberOfGuestsField;
	IBOutlet UITextField *totalField;
	IBOutlet UISlider *tipSlider;
	IBOutlet UILabel *finalLabel;
}


- (IBAction)calculate;

@end

