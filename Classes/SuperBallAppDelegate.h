#import <UIKit/UIKit.h>

#import "SplashViewController.h"

@interface SuperBallAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	SplashViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SplashViewController *viewController;

@end

