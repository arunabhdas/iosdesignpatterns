//
//  ThirdViewController.m
//
#define WEATHER_URL "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&APPID=998011554e66f285ac58fbfaa4fce461"
#import "ThirdViewController.h"
#import "AFNetworking.h"
static NSString *const BASEURL = @"http://api.openweathermap.org/data/2.5/";
static NSString *const NAME_KEY = @"name";
static NSString *const MAIN_KEY = @"main";
static NSString *const TEMP_KEY = @"temp";
static dispatch_once_t predicate;
@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (IBAction)showButtonTapped:(id)sender {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    
   [self.locationManager requestWhenInUseAuthorization];
   if([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    
}


#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [manager stopUpdatingLocation];
    
    manager = nil;
    
    CLLocation *currentLocation = locations.lastObject;
    
    double lat = currentLocation.coordinate.latitude;
    double lng = currentLocation.coordinate.longitude;
    
    
    dispatch_once(&predicate, ^{
        
        NSString *urlString = [NSString stringWithFormat:@"%@weather?lat=%lf&lon=%lf&APPID=998011554e66f285ac58fbfaa4fce461&units=metric", BASEURL, lat, lng];
        
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFJSONResponseSerializer serializer];
        
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            self.weatherData = (NSDictionary *)responseObject;
          
            NSEnumerator *enu = [self.weatherData keyEnumerator];
            
            self.mainWeatherData = [self.weatherData valueForKey:MAIN_KEY];
            
            NSString *currentCity = [self.weatherData valueForKey:NAME_KEY];
            
            self.cityTextField.text = currentCity;
            
            NSString *currentTemp = [self.mainWeatherData valueForKey:TEMP_KEY];
            
            NSString *currentTempString = [NSString stringWithFormat:@"%@", currentTemp];
            
            [self.tempTextField setText:currentTempString];
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"%@", error);
            
        }];
        
        [operation start];
        
    });
    
    
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager*)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined: {
            NSLog(@"Waiting for permission");
        } break;
        case kCLAuthorizationStatusDenied: {
            NSLog(@"Permission denied");
        } break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        case kCLAuthorizationStatusAuthorizedAlways: {
            [_locationManager startUpdatingLocation];
        } break;
        default:
            break;
    }
}
@end
