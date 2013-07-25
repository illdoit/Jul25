//
//  View.h
//  Jul25
//
//  Created by Sir Andrew on 7/23/13.
//  Copyright (c) 2013 edu.nyu.spcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <audioToolbox/AudioServices.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <QuartzCore/QuartzCore.h>


@interface View: UIView {
	UIView *paddle;
	UIView *ball;
	UIView *wall1;
    UIView *wall2;
    UIView *wall3;
    UIView *wall4;
    AVAudioPlayer *player;


	CGFloat dx, dy;	//direction and speed of ball's motion
}

- (void) move: (CADisplayLink *) displayLink;

@property (nonatomic, retain) AVAudioPlayer *player;

@end

