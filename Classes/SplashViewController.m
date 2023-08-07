#import "SplashViewController.h"


@implementation SplashViewController

@synthesize timer,splashImageView,viewController;

- (void)loadView {
	
	CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
	UIView *view = [[UIView alloc] initWithFrame:appFrame];
	view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
	self.view = view;
	[view release];
	
	splashImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default.png"]];
	splashImageView.frame = CGRectMake(0, 0, 320, 480);
	[self.view addSubview:splashImageView];
	
	viewController = [[SuperBallViewController alloc] initWithNibName:@"SuperBallViewController" bundle:[NSBundle mainBundle]];
	viewController.view.alpha = 0.0;
	[self.view addSubview:viewController.view];
	
	timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(fadeScreen) userInfo:nil repeats:NO];
}

-(void) onTimer{
	NSLog(@"LOAD");
}

- (void)fadeScreen
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.75];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(finishedFading)];
	self.view.alpha = 0.0;
	[UIView commitAnimations];
}


- (void) finishedFading
{
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.75];
	self.view.alpha = 1.0;
	viewController.view.alpha = 1.0;
	[UIView commitAnimations];
	[splashImageView removeFromSuperview];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; 
   
}


- (void)dealloc {
    [super dealloc];
}


@end
