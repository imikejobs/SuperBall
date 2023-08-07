#import <UIKit/UIKit.h>
#import "SuperBallViewController.h"

@interface SplashViewController : UIViewController {
	NSTimer *timer;
	UIImageView *splashImageView;
	
	SuperBallViewController *viewController;
}

@property(nonatomic,retain) NSTimer *timer;
@property(nonatomic,retain) UIImageView *splashImageView;
@property(nonatomic,retain) SuperBallViewController *viewController;

@end
