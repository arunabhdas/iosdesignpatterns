//
//  ViewController.h
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
- (IBAction)showImageTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

