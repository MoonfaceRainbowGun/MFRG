#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <OpenAL/al.h>
#import <OpenAL/alc.h>

@class FISampleBuffer;

@interface FISampleDecoder : NSObject

+ (FISampleBuffer*) decodeSampleAtPath: (NSString*) path error: (NSError**) error;

@end
