//
//  XPhotoBrowserTransition.m
//  PhotoBrowserDemo
//
//  Created by xzy on 2018/11/3.
//  Copyright © 2018年 xiezongyuan. All rights reserved.
//

#import "XPhotoBrowserTransition.h"
#import "XPhotoBrowserVC.h"
#import "UIView+XExtension.h"

@interface XPhotoBrowserTransition ()

@end

@implementation XPhotoBrowserTransition


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.35;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];

    if ([toVC isKindOfClass:[XPhotoBrowserVC class]]) { // 推出动画
        XPhotoBrowserVC * photoVC = (XPhotoBrowserVC *)toVC;
        UIImageView *originalImageView = photoVC.imageViewArray[photoVC.currentImageIndex];
        originalImageView.hidden = photoVC.hiddenOrignView;
        
        UIImage *image = nil;
        if ([originalImageView respondsToSelector:@selector(image)]) {
            if ([[originalImageView image] isKindOfClass:[UIImage class]]) {
                image = [originalImageView image];
            }
        }
        if (photoVC.currentImageIndex < photoVC.imageArray.count) {
            image = photoVC.imageArray[photoVC.currentImageIndex];
        }
        image = image?image:[UIView imageWithColor:[UIColor colorWithWhite:0.8 alpha:1]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.frame = [originalImageView.superview convertRect:originalImageView.frame toView:containerView];
        [containerView addSubview:imageView];
        CGRect finalFrame = [self showImageViewFrame:image containerView:containerView];
        
        containerView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            imageView.frame = finalFrame;
            containerView.backgroundColor = [UIColor colorWithWhite:0 alpha:1];
        } completion:^(BOOL finished) {
            [imageView removeFromSuperview];
            [containerView addSubview:toVC.view];
            containerView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
            [transitionContext completeTransition:YES];
        }];
    }else if([fromVC isKindOfClass:[XPhotoBrowserVC class]]) { // dismiss
        XPhotoBrowserVC * photoVC = (XPhotoBrowserVC *)fromVC;
        for (UIView *imageView in photoVC.imageViewArray) {
            imageView.hidden = NO;
        }
        UIView *originalImageView = photoVC.imageViewArray[photoVC.currentImageIndex];
        originalImageView.hidden = photoVC.hiddenOrignView;
        UIImageView *currentImageView = photoVC.currentShowImageView;
        
        UIImage *image = currentImageView.image;
        image = image?image:[UIView imageWithColor:[UIColor colorWithWhite:0.8 alpha:1]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        CGRect rect = [currentImageView.superview convertRect:currentImageView.frame toView:containerView];
        if (!currentImageView) {
            rect = [self showImageViewFrame:image containerView:containerView];
        }
        imageView.frame = rect;
        [containerView addSubview:imageView];
        
        fromVC.view.hidden = YES;
        containerView.backgroundColor = fromVC.view.backgroundColor;
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            if (originalImageView.superview) {
                 imageView.frame = [originalImageView.superview convertRect:originalImageView.frame toView:containerView];
                containerView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
            }else{
                containerView.alpha = 0;
            }
        } completion:^(BOOL finished) {
            [imageView removeFromSuperview];
            originalImageView.hidden = NO;
            [transitionContext completeTransition:YES];
        }];
        
        

    }else{
        [transitionContext completeTransition:YES];
    }
}

/// 计算要展示图片的最终frame
- (CGRect)showImageViewFrame:(UIImage *)image containerView:(UIView *)containerView{
    CGFloat maxWidth = CGRectGetWidth(containerView.bounds);
    CGFloat maxHeight = CGRectGetHeight(containerView.bounds);
    CGSize size = CGSizeMake(maxWidth, maxHeight);
    CGSize imageSize = image.size;
    if (image && !isnan(imageSize.width) && !isnan(imageSize.height) && imageSize.width > 0 && imageSize.height > 0) {
        if (imageSize.height/imageSize.width > maxHeight/maxWidth && imageSize.height/imageSize.width <= 5) { // 高度长图，以高度为比例基准。如果高宽比大于5，则认为是超长高图，则不执行。
            size = CGSizeMake(round(maxHeight*imageSize.width/imageSize.height), maxHeight);
        }else{ // 以宽度为比例基准
            size = CGSizeMake(maxWidth,round(maxWidth*imageSize.height/imageSize.width));
        }
    }
    CGFloat x = (maxWidth-size.width)/2;
    CGFloat y = (maxHeight-size.height)/2;
    // scrollView初始位移为(0,0),故当xy小于0时置0。
    x = x > 0 ? x : 0;
    y = y > 0 ? y : 0;
    return CGRectMake(x, y, size.width, size.height);
}


@end
