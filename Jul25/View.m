//
//  View.m
//  Jul25
//
//  Created by Sir Andrew on 7/23/13.
//  Copyright (c) 2013 edu.nyu.spcs. All rights reserved.
//

#import "View.h"

@implementation View
@synthesize player;


- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
        
		//Create the paddle.
		frame = CGRectMake(40, 100, 20, 100);
		paddle = [[UIView alloc] initWithFrame: frame];
		//paddle.backgroundColor = [UIColor whiteColor];
        paddle.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"horizpad.png"]];
		[self addSubview: paddle];
        
		//Create the ball in the upper left corner of this View.
		frame = CGRectMake(0, 0, 20, 20);
		ball = [[UIView alloc] initWithFrame: frame];
		//ball.backgroundColor = [UIColor whiteColor];
        ball.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pinballer.png"]];
		[self addSubview: ball];
        
        //Ball initially moves to lower right.
		dx = 4;
		dy = 4;
        
        //Create the wall1.
		frame = CGRectMake(90, 33, 100, 40);
		wall1 = [[UIView alloc] initWithFrame: frame];
		wall1.backgroundColor = [UIColor blackColor];
		[self addSubview: wall1];
        
        //Create the wall2.
		frame = CGRectMake(100, 233, 50, 50);
		wall2 = [[UIView alloc] initWithFrame: frame];
		wall2.backgroundColor = [UIColor blackColor];
		[self addSubview: wall2];
        
        //Create the wall3.
		frame = CGRectMake(155, 177, 73, 68);
		wall3 = [[UIView alloc] initWithFrame: frame];
		wall3.backgroundColor = [UIColor blackColor];
		[self addSubview: wall3];
        
        //Create the wall4.
		frame = CGRectMake(255, 33, 48, 129);
		wall4 = [[UIView alloc] initWithFrame: frame];
		wall4.backgroundColor = [UIColor blackColor];
		[self addSubview: wall4];
        

	}
	return self;
}

//Change the ball's direction of motion,
//if necessary to avoid an impending collision.

- (void) bounce {
	//Where the ball would be if its horizontal motion were allowed
	//to continue for one more move.
	CGRect horizontal = ball.frame;
	horizontal.origin.x += dx;
	
	//Where the ball would be if its vertical motion were allowed
	//to continue for one more move.
	CGRect vertical = ball.frame;
	vertical.origin.y += dy;
	
	//Ball must remain inside self.bounds.
	if (!CGRectEqualToRect(horizontal, CGRectIntersection(horizontal, self.bounds))) {
		//Ball will bounce off left or right edge of View.
		dx = -dx;
	}
	
	if (!CGRectEqualToRect(vertical, CGRectIntersection(vertical, self.bounds))) {
		dy = -dy;
	}
	
	//If the ball is not currently intersecting the paddle,
	if (!CGRectIntersectsRect(ball.frame, paddle.frame)) {
		
		//but if the ball will intersect the paddle on the next move,
		if (CGRectIntersectsRect(horizontal, paddle.frame)) {
			dx = -dx;
            NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"paddle" ofType: @"mp3"];
            NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
            // player.numberOfLoops = -1;
            [player play];
		}
		
		if (CGRectIntersectsRect(vertical, paddle.frame)) {
			dy = -dy;
            NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"paddle" ofType: @"mp3"];
            NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
            // player.numberOfLoops = -1;
            [player play];
		}
	}
    
    //----------------------------
    
    //Wall1
    if (!CGRectIntersectsRect(ball.frame, wall1.frame)) {
        
        //but if the ball will intersect the paddle on the next move,
        if (CGRectIntersectsRect(horizontal, wall1.frame)) {
            dx = -dx;
		    wall1.backgroundColor = [UIColor redColor];
            NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"wall1" ofType: @"mp3"];
            NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
           // player.numberOfLoops = -1;
            [player play];
        }
        
        if (CGRectIntersectsRect(vertical, wall1.frame)) {
            dy = -dy;
            wall1.backgroundColor = [UIColor blueColor];
            NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"wall1" ofType: @"mp3"];
            NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
            // player.numberOfLoops = -1;
            [player play];
        }
    }
    //----------------------------
    
    //Wall2
    if (!CGRectIntersectsRect(ball.frame, wall2.frame)) {
        
        //but if the ball will intersect the paddle on the next move,
        if (CGRectIntersectsRect(horizontal, wall2.frame)) {
            dx = -dx;
            wall2.backgroundColor = [UIColor orangeColor];
            NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"wall2" ofType: @"mp3"];
            NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
            // player.numberOfLoops = -1;
            [player play];
        }
        
        if (CGRectIntersectsRect(vertical, wall2.frame)) {
            dy = -dy;
            wall2.backgroundColor = [UIColor greenColor];
            NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"wall2" ofType: @"mp3"];
            NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
            // player.numberOfLoops = -1;
            [player play];
        }
    }
    //----------------------------
    //Wall3
    if (!CGRectIntersectsRect(ball.frame, wall3.frame)) {
        
        //but if the ball will intersect the paddle on the next move,
        if (CGRectIntersectsRect(horizontal, wall3.frame)) {
            dx = -dx;
            wall3.backgroundColor = [UIColor redColor];
            NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"wall3" ofType: @"mp3"];
            NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
            // player.numberOfLoops = -1;
            [player play];
        }
        
        if (CGRectIntersectsRect(vertical, wall3.frame)) {
            dy = -dy;
            wall3.backgroundColor = [UIColor blueColor];
            NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"wall3" ofType: @"mp3"];
            NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
            // player.numberOfLoops = -1;
            [player play];
        }
    }
    //----------------------------
    //Wall4
    if (!CGRectIntersectsRect(ball.frame, wall4.frame)) {
        
        //but if the ball will intersect the paddle on the next move,
        if (CGRectIntersectsRect(horizontal, wall4.frame)) {
            dx = -dx;
            wall4.backgroundColor = [UIColor yellowColor];
            NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"wall4" ofType: @"mp3"];
            NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
            // player.numberOfLoops = -1;
            [player play];
        }
        if (CGRectIntersectsRect(vertical, wall4.frame)) {
            dy = -dy;
            wall4.backgroundColor = [UIColor greenColor];
            NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"wall4" ofType: @"mp3"];
            NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
            // player.numberOfLoops = -1;
            [player play];
        }
    }
    //----------------------------
    
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	UITouch *touch = [touches anyObject];
	CGPoint p = [touch locationInView: self];
	CGFloat y = p.y;
	
	//Don't let the paddle move off the bottom or top of the View.
	CGFloat half = paddle.bounds.size.height / 2;
	y = MIN(y, self.bounds.size.height - half); //don't let y get too big
	y = MAX(y, half);                         //don't let y get too small
	
	paddle.center = CGPointMake(paddle.center.x, y);
	[self bounce];
}

- (void) move: (CADisplayLink *) displayLink {
	NSLog(@"%.15g", displayLink.timestamp);	//15 significant digits
	
	ball.center = CGPointMake(ball.center.x + dx, ball.center.y + dy);
	[self bounce];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */

@end
