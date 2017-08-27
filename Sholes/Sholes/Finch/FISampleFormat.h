#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <OpenAL/al.h>
#import <OpenAL/alc.h>



typedef enum {
    FISampleFormatMono8,
    FISampleFormatMono16,
    FISampleFormatStereo8,
    FISampleFormatStereo16
} FISampleFormat;

FISampleFormat FISampleFormatMake(NSUInteger numberOfChannels, NSUInteger sampleResolution);
