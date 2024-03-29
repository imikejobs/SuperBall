#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>

@interface SuperBallViewController : UIViewController {
	IBOutlet UIImageView *ball;
	IBOutlet UIImageView *racquet_yellow;
	IBOutlet UIImageView *racquet_green;
	IBOutlet UILabel     *tapToBegin;
	
	IBOutlet UILabel *player_score;
	IBOutlet UILabel *computer_score;
	
	CGPoint ballVelocity;
	
	NSInteger gameState;
	
	NSInteger player_score_value;
	NSInteger computer_score_value;
	
	SystemSoundID volleyFileID;
	SystemSoundID clappingFileID;
}

@property(nonatomic) SystemSoundID volleyFileID;
@property(nonatomic) SystemSoundID clappingFileID;

@property(nonatomic,retain) IBOutlet UIImageView *ball;
@property(nonatomic,retain) IBOutlet UIImageView *racquet_green;
@property(nonatomic,retain) IBOutlet UIImageView *racquet_yellow;
@property(nonatomic,retain) IBOutlet UILabel     *tapToBegin;

@property(nonatomic,retain) IBOutlet UILabel *player_score;
@property(nonatomic,retain) IBOutlet UILabel *computer_score;

@property(nonatomic) CGPoint ballVelocity;
@property(nonatomic) NSInteger gameState;

-(void)reset:(BOOL) newGame;

@end

