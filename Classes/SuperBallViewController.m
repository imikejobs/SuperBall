#import "SuperBallViewController.h"

#define kGameStateRunning 1
#define kGameStatePaused  2

#define kBallSpeedX 3
#define kBallSpeedY 4

#define kCompMoveSpeed 3
#define kScoreToWin 6

@implementation SuperBallViewController
@synthesize ball,racquet_yellow,racquet_green,player_score,computer_score,gameState,ballVelocity,tapToBegin;

@synthesize volleyFileID, clappingFileID;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if(gameState == kGameStatePaused) {
		tapToBegin.hidden = YES;
		gameState = kGameStateRunning;
	} else if(gameState == kGameStateRunning) {
		[self touchesMoved:touches withEvent:event];
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint location = [touch locationInView:touch.view];
	CGPoint xLocation = CGPointMake(location.x,racquet_yellow.center.y);
	racquet_yellow.center = xLocation;
}

-(void) gameLoop {
	if(gameState == kGameStateRunning) {

		ball.center = CGPointMake(ball.center.x + ballVelocity.x , ball.center.y + ballVelocity.y);
		
		if(ball.center.x > self.view.bounds.size.width || ball.center.x < 0) {
			ballVelocity.x = -ballVelocity.x;
		}
		
		if(ball.center.y > self.view.bounds.size.height || ball.center.y < 0) {
			ballVelocity.y = -ballVelocity.y;
		}
		
		if(CGRectIntersectsRect(ball.frame,racquet_yellow.frame)) {
			if(ball.center.y < racquet_yellow.center.y) {
				ballVelocity.y = -ballVelocity.y;
				AudioServicesPlaySystemSound (volleyFileID);
			}
		}
		
		if(CGRectIntersectsRect(ball.frame,racquet_green.frame)) {
			if(ball.center.y > racquet_green.center.y) {
				ballVelocity.y = -ballVelocity.y;
				AudioServicesPlaySystemSound (volleyFileID);
			}
		}
		
		
		if(ball.center.y <= self.view.center.y) {
			if(ball.center.x < racquet_green.center.x) {
				CGPoint compLocation = CGPointMake(racquet_green.center.x - kCompMoveSpeed, racquet_green.center.y);
				racquet_green.center = compLocation;
			}
			
			if(ball.center.x > racquet_green.center.x) {
				CGPoint compLocation = CGPointMake(racquet_green.center.x + kCompMoveSpeed, racquet_green.center.y);
				racquet_green.center = compLocation;
			}
		}
		if(ball.center.y <= 0) {
			player_score_value++;
			[self reset:(player_score_value >= kScoreToWin)];
		}
		
		if(ball.center.y > self.view.bounds.size.height) {
			computer_score_value++;
			[self reset:(computer_score_value >= kScoreToWin)];
		}
		
	} else {
		if(tapToBegin.hidden) {
			tapToBegin.hidden = NO;
		}
	}
}

-(void)reset:(BOOL) newGame {
	self.gameState = kGameStatePaused;
	AudioServicesPlaySystemSound (clappingFileID);
	ball.center = self.view.center;
	if(newGame) {
		if(computer_score_value > player_score_value) {
			tapToBegin.text = @"Computer Wins!";
		} else {
			tapToBegin.text = @"Player Wins!";
		}
		
		computer_score_value = 0;
		player_score_value = 0;
	} else {
		tapToBegin.text = @"Tap To Begin";
	}
	
    player_score.text = [NSString stringWithFormat:@"%ld",(long)player_score_value];
    computer_score.text = [NSString stringWithFormat:@"%ld",(long)computer_score_value];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.gameState = kGameStatePaused;
	ballVelocity = CGPointMake(kBallSpeedX,kBallSpeedY);
	
	NSString *clapPath = [[NSBundle mainBundle] pathForResource:@"Clapping Crowd Studio 01" ofType:@"caf"];
	CFURLRef clapURL = (CFURLRef ) [NSURL fileURLWithPath:clapPath];
	AudioServicesCreateSystemSoundID (clapURL, &clappingFileID);

	NSString *volleyPath = [[NSBundle mainBundle] pathForResource:@"Tennis Volley 01" ofType:@"caf"];
	CFURLRef volleyURL = (CFURLRef ) [NSURL fileURLWithPath:volleyPath];
	AudioServicesCreateSystemSoundID (volleyURL, &volleyFileID);
	
	[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; 
}

- (void)dealloc {
    [super dealloc];
	[ball release];
	[racquet_green release];
	[racquet_yellow release];
	[player_score release];
	[computer_score release];
	[tapToBegin release];
}

@end
