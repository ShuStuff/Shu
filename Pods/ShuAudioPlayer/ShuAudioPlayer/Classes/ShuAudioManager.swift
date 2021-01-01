//
//  ShuAudioManager.swift
//  ShuAudioPlayer
//
//  Created by sun well on 2020/10/30.
//

import Foundation
import AVFoundation

class ShuAudioManager {
    var audioURL: URL?
    var player: AVAudioPlayer?
    lazy var downloader: ShuAudioDownloader = ShuAudioDownloader()
    
    init(audioURL: URL) {
        self.audioURL = audioURL
    }
    
    public func playAudio(fromNet audioURL: String) {
//        self.player.data = self.downloader.downloadAudio(audioURL: self.audioURL)
    }
    
    public func playAudio(fromLocal audioPath: String?)  {
        guard let audio = audioPath, !audio.isEmpty else {
            assert(false, "⚠️WARNING: audio path is empty !")
            return
        }
        
        guard let audioURL = URL(string: audio) else {
            assert(false, "⚠️WARNING: audio path is wrong. And can not be transformed to a correct URL !")
            return
        }
        player = try? AVAudioPlayer.init(contentsOf: audioURL)
        player?.numberOfLoops = -1
        player?.play()
    }
    
    public func pauseAudio() {
        // TODO: what is this function really mean ??
        // it does not release the audio hardware that was required upon calling play() or prepareToPlay().
        player?.pause()
    }
    
    //
    public func stopAudio() {
        // this seems like pause function since the value of the currentTime does not be resetted to 0,
        // and it release the audio hardware.
        player?.stop()
    }
    
    public func resumeAudio() {
        player?.play()
    }
}
