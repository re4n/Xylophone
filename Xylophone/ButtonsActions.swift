//
//  ButtonsActions.swift
//  Xylophone
//
//  Created by Ryan Rouxinol on 21/07/24.
//
    
import Foundation
import UIKit
import AVFoundation

public class ButtonActions {
    var player: AVAudioPlayer?
    
    public func buttonTapped(_ sender: UIButton, note: String) {
        playSound(note: note)
    }
    
    func playSound(note: String) {
        if let url = Bundle.main.url(forResource: note, withExtension: "wav") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Error loading sound file: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found")
        }
    }
}
