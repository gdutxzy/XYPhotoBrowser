# XPhotoBrowser

[![CI Status](https://img.shields.io/travis/gdutxzy/XPhotoBrowser.svg?style=flat)](https://travis-ci.org/gdutxzy/XPhotoBrowser)
[![Version](https://img.shields.io/cocoapods/v/XPhotoBrowser.svg?style=flat)](https://cocoapods.org/pods/XPhotoBrowser)
[![License](https://img.shields.io/cocoapods/l/XPhotoBrowser.svg?style=flat)](https://cocoapods.org/pods/XPhotoBrowser)
[![Platform](https://img.shields.io/cocoapods/p/XPhotoBrowser.svg?style=flat)](https://cocoapods.org/pods/XPhotoBrowser)



1. 支持3D-Touch推出，并支持3D-Touch保存图片。
2. 支持屏幕旋转。
3. 支持图片跟随手势运动而消失，类似微信等APP的图片浏览器。
4. 支持普遍的图片浏览器所拥有的单击退出、双击缩放、捏合手势缩放、滑动切换图片的功能。
5. 渐变跟踪原图大小的推出及消失转场动画。
6. 支持高宽比大于5的长图画布展示。

## Screenshots

<p align="left">
<img src="./IMG_0148.PNG" width=240px">&nbsp;<img src="./IMG_0149.PNG" width=430px">&nbsp;<img src="./IMG_0151.PNG" width=240px">
</p>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Demo code

``` objective-c

NSArray *urlArray = self.urlArray;
NSArray *imageViewArray = @[self.imageView1,self.imageView2];

XPhotoBrowserVC *vc = [XPhotoBrowserVC photoBrowserWithImageURLs:urlArray images:nil imageViews:imageViewArray currentIndex:index];
[self presentViewController:vc animated:YES completion:^{

}];

``` 

## Requirements

## Installation

XPhotoBrowser is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XPhotoBrowser'
```

## Author

gdutxzy, gdutxzy@163.com

## License

XPhotoBrowser is available under the MIT license. See the LICENSE file for more info.
