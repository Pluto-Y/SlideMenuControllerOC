//
//  SlideMenuController.h
//  btWeighBase
//
//  Created by ChipSea on 16/1/28.
//  Copyright © 2016年 Chipsea. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TrackAction) {
    TrackActionLeftTapOpen,
    TrackActionLeftTapClose,
    TrackActionLeftFlickOpen,
    TrackActionLeftFlickClose,
    TrackActionRightTapOpen,
    TrackActionRightTapClose,
    TrackActionRightFlickOpen,
    TrackActionRightFlickClose
};

@protocol SlideMenuControllerDelegate <NSObject>

@optional
- (void)leftWillOpen;
- (void)leftDidOpen;
- (void)leftWillClose;
- (void)leftDidClose;
- (void)rightWillOpen;
- (void)rightDidOpen;
- (void)rightWillClose;
- (void)rightDidClose;

@end

@interface SlideMenuOption : NSObject

@property (nonatomic, assign) CGFloat leftViewWidth;
@property (nonatomic, assign) CGFloat leftBezelWidth;
@property (nonatomic, assign) CGFloat contentViewScale;
@property (nonatomic, assign) CGFloat contentViewOpacity;
@property (nonatomic, assign) CGFloat shadowOpacity;
@property (nonatomic, assign) CGFloat shadowRadius;
@property (nonatomic, assign) CGSize shadowOffset;
@property (nonatomic, assign) BOOL panFromBezel;
@property (nonatomic, assign) CGFloat animationDuration;
@property (nonatomic, assign) CGFloat rightViewWidth;
@property (nonatomic, assign) CGFloat rightBezelWidth;
@property (nonatomic, assign) BOOL rightPanFromBezel;
@property (nonatomic, assign) BOOL hideStatusBar;
@property (nonatomic, assign) CGFloat pointOfNoReturnWidth;
@property (nonatomic, assign) BOOL simultaneousGestureRecognizers;
@property (nonatomic, retain) UIColor *opacityViewBackgroundColor;

@end

@interface SlideMenuController : UIViewController<UIGestureRecognizerDelegate>

@property (nonatomic, weak) id<SlideMenuControllerDelegate> delegate;

@property (nonatomic, retain) SlideMenuOption *option;

@property (nonatomic, retain) UIView *opacityView;
@property (nonatomic, retain) UIView *mainContainerView;
@property (nonatomic, retain) UIView *leftContainerView;
@property (nonatomic, retain) UIView *rightContainerView;
@property (nonatomic, retain) UIPanGestureRecognizer *leftPanGesture;
@property (nonatomic, retain) UITapGestureRecognizer *leftTapGesture;
@property (nonatomic, retain) UIPanGestureRecognizer *rightPanGesture;
@property (nonatomic, retain) UITapGestureRecognizer *rightTapGesture;
@property (nonatomic, retain) UIViewController *mainViewController;
@property (nonatomic, retain) UIViewController *leftViewController;
@property (nonatomic, retain) UIViewController *rightViewController;


- (instancetype)initWithMainViewController:(UIViewController *)tMainController leftMenuViewController:(UIViewController *)tLeftMenuController;

- (instancetype)initWithMainViewController:(UIViewController *)tMainController rightMenuViewController:(UIViewController *)tRightMenuController;

- (instancetype)initWithMainViewController:(UIViewController *)tMainController leftMenuViewController:(UIViewController *)tLeftMenuController rightMenuViewController:(UIViewController *)tRightMenuController;

- (BOOL)isTagetViewController;

- (void)addLeftGestures;

- (void)addRightGestures;

- (void)removeLeftGestures;

- (void)removeRightGestures;

- (void)track:(TrackAction)action;

- (void)openLeftWithVelocity:(CGFloat) velocity;

- (void)openRightWithVelocity:(CGFloat) velocity;

- (void)closeLeftWithVelocity:(CGFloat) velocity;

- (void)closeRightWithVelocity:(CGFloat) velocity;

- (BOOL)isLeftOpen;

- (BOOL)isLeftHidden;

- (BOOL)isRightOpen;

- (BOOL)isRightHidden;

- (void)changeMainViewController:(UIViewController *)newMainController close:(BOOL)close;

- (void)changeLeftViewWidth:(CGFloat) width;

- (void)changeRightViewWidth:(CGFloat) width;

- (void)changeLeftViewController:(UIViewController *)newLeftController close:(BOOL) close;

- (void)changeRightViewController:(UIViewController *)newRightController close:(BOOL) close;

- (void)closeLeftNonAnimation;

- (void)closeRightNonAnimation;

@end


@interface UIViewController(SlideMenuVC)

@property (nonatomic, retain, readonly) SlideMenuController *slideMenuController;

- (void)addLeftBarButtonWithImage:(UIImage *)buttonImage;

- (void)addRightBarButtonWithImage:(UIImage *)buttonImage;

- (void)toggleLeft;

- (void)toggleRight;

- (void)openLeft;

- (void)openRight;

- (void)closeLeft;

- (void)closeRight;

- (void)addPriorityToMenuGesture:(UIScrollView *) targetScrollView;

@end
