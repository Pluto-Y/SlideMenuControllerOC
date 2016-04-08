//
//  UIImageView+SlideMenuControllerOC.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/29.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "UIImageView+SlideMenuControllerOC.h"
#import "UIImage+SlideMenuController.h"

@implementation UIImageView (SlideMenuControllerOC)

-(void)setRandomDownloadImage:(int)width height:(int)height {
    if (self.image != nil) {
        self.alpha = 1;
        return;
    }
    self.alpha = 0;
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"https://ssl.webpack.de/lorempixel.com/%d/%d/", width, height]];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.timeoutIntervalForRequest = 15;
    configuration.timeoutIntervalForResource = 15;
    configuration.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            return;
        }
        NSHTTPURLResponse *httpResp = (NSHTTPURLResponse *)response;
        if (httpResp.statusCode/100 != 2) {
            return;
        }
        UIImage *image = [UIImage imageWithData:data];
        if (data != nil && image != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = image;
                [UIView animateWithDuration:.3 animations:^{
                    self.alpha = 1;
                } completion:^(BOOL finished) {
                    
                }];
            });
        }
    }];
    [task resume];
}

-(void)clipParallaxEffec:(UIImage *)baseImage screenSize:(CGSize)screenSize displayHeight:(CGFloat)displayHeight {
    if (baseImage != nil) {
        if (displayHeight < 0) {
            return;
        }
        CGFloat aspect = screenSize.width / screenSize.height;
        CGSize imageSize = baseImage.size;
        CGFloat imageScale = imageSize.height / screenSize.height;
        
        CGFloat cropWidth = floor(aspect < 1.0 ? imageSize.width * aspect : imageSize.width);
        CGFloat cropHeight = floor(displayHeight * imageScale);
        
        CGFloat left = (imageSize.width - cropWidth) / 2;
        CGFloat top = (imageSize.height - cropHeight) / 2;
        
        CGRect trimRect = CGRectMake(left, top, cropWidth, cropHeight);
        self.image = [baseImage trimRect:trimRect];
        self.frame = CGRectMake(0, 0, screenSize.width, displayHeight);
    }
}

@end
