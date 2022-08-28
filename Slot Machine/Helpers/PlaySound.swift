//
//  PlaySound.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 28/08/2022.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print("ERROR: Could not found the sound file!")
        }
    }
}
