//
//  ViewController.m
//
#define IMAGE_URL "http://cdn2.ubergizmo.com/wp-content/uploads/2011/04/apple-toshiba.gif"
#import "FirstViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)showImageTapped:(id)sender {
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@IMAGE_URL] placeholderImage:[UIImage imageNamed:@"AppIcon"]
                             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *url) {
                                 NSLog(@"Handle any completion here");
                             }];
    
    
    /* NOTE : The method below can be used also but is not needed since SDWebImage downloads asynchronously on a background thread
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @IMAGE_URL]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.contentMode = UIViewContentModeScaleAspectFill;
            self.imageView.image = [UIImage imageWithData:data];
        });
    });
    */
    
}
@end
