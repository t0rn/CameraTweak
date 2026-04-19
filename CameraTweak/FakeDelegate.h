//
//  FakeDelegate.h
//  CameraTweak
//
//  Created by Batman on 19/4/26.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@class UIImage;

NS_ASSUME_NONNULL_BEGIN

@interface FakeVideoDelegate : NSObject <AVCaptureVideoDataOutputSampleBufferDelegate>
@property (nonatomic, strong, nullable) id<AVCaptureVideoDataOutputSampleBufferDelegate> realDelegate;
@property (nonatomic, strong, nullable) UIImage *fakeImage;
- (instancetype)initWithRealDelegate:(_Nullable id<AVCaptureVideoDataOutputSampleBufferDelegate>)realDelegate;
@end


@interface FakePhotoDelegate : NSObject <AVCapturePhotoCaptureDelegate>
@property (nonatomic, strong, nullable) UIImage *fakeImage;
@property (nonatomic, strong, nullable) id<AVCapturePhotoCaptureDelegate> realDelegate;
- (instancetype)initWithRealDelegate:(_Nullable id <AVCapturePhotoCaptureDelegate>)realDelegate;

@end

NS_ASSUME_NONNULL_END
