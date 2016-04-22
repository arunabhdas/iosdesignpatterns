//
//  ThirdViewController.h
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ThirdViewController : UIViewController<CLLocationManagerDelegate> {
    
}

@property(nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSDictionary *weatherData;
@property (nonatomic, strong) NSDictionary *mainWeatherData;
@property (nonatomic, strong) NSArray *currentWeather;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *tempTextField;


- (IBAction)showButtonTapped:(id)sender;

@end
