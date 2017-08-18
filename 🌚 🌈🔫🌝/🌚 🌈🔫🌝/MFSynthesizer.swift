//
//  MFSynthesizer.swift
//  🌚 🌈🔫🌝
//
//  Created by Lei Mingyu on 18/8/17.
//  Copyright © 2017 MFRG. All rights reserved.
//

import AVFoundation

class MFSynthesizer {
    static let sharedInstance: MFSynthesizer = MFSynthesizer()
    
    // The maximum number of audio buffers in flight. Setting to two allows one
    // buffer to be played while the next is being written.
    var inFlightAudioBuffers = 2
    
    // The number of audio samples per buffer. A lower value reduces latency for
    // changes but requires more processing but increases the risk of being unable
    // to fill the buffers in time. A setting of 1024 represents about 23ms of
    // samples.
    
    let samplesPerBuffer: AVAudioFrameCount = 2000
    let audioEngine = AVAudioEngine()
    var playerNodesPool = [AVAudioPlayerNode]()
    let audioFormat = AVAudioFormat(standardFormatWithSampleRate: 44100.0, channels: 2)
    var audioBuffers = [AVAudioPCMBuffer]()
    var bufferIndex = 0
    let audioQueue: DispatchQueue = DispatchQueue(label: "MFSynthesizerQueue", attributes: [])
    
    init() {
        audioBuffers = [AVAudioPCMBuffer](repeating: AVAudioPCMBuffer(pcmFormat: audioFormat, frameCapacity: UInt32(samplesPerBuffer)), count: 2)
        for _ in 0..<10 {
            let node = AVAudioPlayerNode()
            playerNodesPool.append(node)
            audioEngine.attach(node)
            audioEngine.connect(node, to: audioEngine.mainMixerNode, format: audioFormat)
        }

        
        do {
            try audioEngine.start()
        } catch {
            print("AudioEngine failed")
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(MFSynthesizer.audioEngineConfigurationChange(_:)), name: NSNotification.Name.AVAudioEngineConfigurationChange, object: audioEngine)
    }
    
    func play(frequency: Float32, force: Int) {
        var playerNode: AVAudioPlayerNode? = nil
        while playerNode == nil {
            for node in playerNodesPool {
                print(node.isPlaying)
                if !node.isPlaying {
                    playerNode = node
                    break
                }
            }
        }
        
        let unitVelocity = Float32(2.0 * Double.pi / audioFormat.sampleRate)
        let carrierVelocity = frequency * unitVelocity
        audioQueue.async() {
            var sampleTime: Float32 = 0
            
            // Fill the buffer with new samples.
            let audioBuffer = self.audioBuffers[self.bufferIndex]
            let leftChannel = audioBuffer.floatChannelData?[0]
            let rightChannel = audioBuffer.floatChannelData?[1]
            for sampleIndex in 0 ..< Int(self.samplesPerBuffer) {
                let amplitude = self.adsr(sampleIndex: sampleIndex)
                let sample = amplitude * sin(carrierVelocity * sampleTime) * min(1, Float32(force * force * force) * 0.02)
                leftChannel?[sampleIndex] = sample
                rightChannel?[sampleIndex] = sample
                sampleTime += 1
            }
            audioBuffer.frameLength = self.samplesPerBuffer
            
            // Schedule the buffer for playback and release it for reuse after
            // playback has finished.
            playerNode?.scheduleBuffer(audioBuffer) {
                playerNode?.stop()
                return
            }
            
            self.bufferIndex = (self.bufferIndex + 1) % self.audioBuffers.count
        }
        
        playerNode?.pan = 0
        playerNode?.play()
        
    }
    
    func adsr(sampleIndex: Int) -> Float32{
        // hack hack hack
        let release: Int = Int(Float(self.samplesPerBuffer) * 0.9)
        var envelope: Float = 0
        if sampleIndex < release {
            let relativeIndex = Float(release - sampleIndex)
            envelope = relativeIndex / Float(release)
        } else {
            envelope = 0.0
        }
        return envelope
    }
    
    @objc func audioEngineConfigurationChange(_ notification: Notification) -> Void {
        NSLog("Audio engine configuration change: \(notification)")
    }
}
