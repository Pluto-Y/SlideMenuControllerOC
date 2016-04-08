//
//  SlideMenuController.h
//  btWeighBase
//
//  Created by ChipSea on 16/1/28.
//  Copyright © 2016年 Chipsea. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    TrackActionLeftTapOpen,
    TrackActionLeftTapClose,
    TrackActionLeftFlickOpen,
    TrackActionLeftFlickClose,
    TrackActionRightTapOpen,
    TrackActionRightTapClose,
    TrackActionRightFlickOpen,
    TrackActionRightFlickClose
} TrackAction;

@protocol SlideMenuControllerDelegate <NSObject>

@optional
-(void)leftWillOpen;
-(void)leftDidOpen;
-(void)leftWillClose;
-(void)leftDidClose;
-(void)rightWillOpen;
-(void)rightDidOpen;
-(void)rightWillClose;
-(void)rightDidClose;

@end

@interface SlideMenuController : UIViewController<UIGestureRecognizerDelegate>

@property (weak, nonatomic) id<SlideMenuControllerDelegate> delegate;

@property (retain, nonatomic) UIView *opacityView;
@property (retain, nonatomic) UIView *mainContainerView;
@property (retain, nonatomic) UIView *leftContainerView;
@property (retain, nonatomic) UIView *rightContainerView;
@property (retain, nonatomic) UIPanGestureRecognizer *leftPanGesture;
@property (retain, nonatomic) UITapGestureRecognizer *leftTapGesture;
@property (retain, nonatomic) UIPanGestureRecognizer *rightPanGesture;
@property (retain, nonatomic) UITapGestureRecognizer *rightTapGesture;
@property (retain, nonatomic, readonly) UIViewController *mainViewController;
@property (retain, nonatomic, readonly) UIViewController *leftViewController;
@property (retain, nonatomic, readonly) UIViewController *rightViewController;


-(instancetype)initWithMainViewController:(UIViewController *)tMainController leftMenuViewController:(UIViewController *)tLeftMenuController;

-(instancetype)initWithMainViewController:(UIViewController *)tMainController rightMenuViewController:(UIViewController *)tRightMenuController;

-(instancetype)initWithMainViewController:(UIViewController *)tMainController leftMenuViewController:(UIViewController *)tLeftMenuController rightMenuViewController:(UIViewController *)tRightMenuController;

-(BOOL)isTagetViewController;

-(void)addLeftGestures;

-(void)addRightGestures;

-(void)removeLeftGestures;

-(void)removeRightGestures;

-(void)track:(TrackAction)action;

-(void)openLeftWithVelocity:(CGFloat) velocity;

-(void)openRightWithVelocity:(CGFloat) velocity;

-(void)closeLeftWithVelocity:(CGFloat) velocity;

-(void)closeRightWithVelocity:(CGFloat) velocity;

-(BOOL)isLeftOpen;

-(BOOL)isLeftHidden;

-(BOOL)isRightOpen;

-(BOOL)isRightHidden;

-(void)changeMainViewController:(UIViewController *)newMainController close:(BOOL)close;

-(void)changeLeftViewWidth:(CGFloat) width;

-(void)changeRightViewWidth:(CGFloat) width;

-(void)changeLeftViewController:(UIViewController *)newLeftController close:(BOOL) close;

-(void)changeRightViewController:(UIViewController *)newRightController close:(BOOL) close;

-(void)closeLeftNonAnimation;

-(void)closeRightNonAnimation;

@end


@interface UIViewController(SlideMenuVC)

-(SlideMenuController *)slideMenuController;

-(void)addLeftBarButtonWithImage:(UIImage *)buttonImage;

-(void)addRightBarButtonWithImage:(UIImage *)buttonImage;

-(void)toggleLeft;

-(void)toggleRight;

-(void)openLeft;

-(void)openRight;

-(void)closeLeft;

-(void)closeRight;

-(void)addPriorityToMenuGesture:(UIScrollView *) targetScrollView;

@end