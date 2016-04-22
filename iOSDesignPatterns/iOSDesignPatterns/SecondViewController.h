//
//  SecondViewController.h
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
- (IBAction)sortArrayTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *inputArrayField;
@property (weak, nonatomic) IBOutlet UITextField *outputArrayField;

@end
