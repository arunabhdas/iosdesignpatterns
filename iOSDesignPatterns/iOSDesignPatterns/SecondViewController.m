//
//  SecondViewController.m
//

#import "SecondViewController.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)sortArrayTapped:(id)sender {
    
    NSString *inputString = self.inputArrayField.text;
    NSArray *inputArray = [inputString componentsSeparatedByString:@", "];
    
    NSMutableArray *uniqueArray = [NSMutableArray array];
    
    [uniqueArray addObjectsFromArray:[[NSSet setWithArray:inputArray] allObjects]];
    
    
    NSArray *sortedNumbers = [uniqueArray sortedArrayUsingSelector:@selector(compare:)];
    
    
    NSString *outputString = [[sortedNumbers valueForKey:@"description"] componentsJoinedByString:@", "];
    
    
    [self.outputArrayField setText: outputString];
    
}
@end
