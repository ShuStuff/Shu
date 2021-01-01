//
//  ShuAudioDownloader.swift
//  ShuAudioPlayer
//
//  Created by sun well on 2020/10/30.
//

import Foundation
import Alamofire

class ShuAudioDownloader {
    var audioURL: URL?
    
    deinit {
        self.audioURL = nil
    }
}

extension ShuAudioDownloader {
    func downloadAudio(audioURL: URL) -> Data {
        let data = Data.init()
        return data
    }
    
    func headRequest(audioURL: URL) -> Dictionary<String, Any> {
        let dic = Dictionary<String, Any>.init()
        return dic
    }
}
