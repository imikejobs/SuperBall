#import "SuperBallAppDelegate.h"

@implementation SuperBallAppDelegate

@synthesize window;
@synthesize viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    UIViewController* vc = [[UIViewController alloc]initWithNibName:nil bundle:nil];
    self.window.rootViewController = vc;
	viewController = [[SplashViewController alloc] init];
    // Override point for customization after app launch    
    [window addSubview:[viewController view]];
	
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
