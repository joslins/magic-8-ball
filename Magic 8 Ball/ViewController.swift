//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Joslin Koren on 9/5/25.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet weak var splashView: UIView!
    @IBOutlet weak var answerLabel: UILabel!
    let responses = [
        "It is certain",
        "Reply hazy, try again",
        "Don't count on it",
        "Yes definitely",
        "Ask again later",
        "My sources say no",
        "Outlook good",
        "Very doubtful",
        "Signs point to yes",
        "Better not tell you now",
        "Without a doubt",
        "My reply is no",
        "Most likely",
        "Cannot predict now",
        "Yes",
        "Outlook not so good",
        "You may rely on it",
        "Concentrate and ask again"
    ]
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            UIView.animate(withDuration: 0.5) {
                self.splashView.alpha = 0.0
            }
        }
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            playShakeSound() // Add this line
            // Fade out animation
            UIView.animate(withDuration: 0.3, animations: {
                self.answerLabel.alpha = 0.0
            }) { _ in
                // Change the text while it's invisible
                let randomIndex = Int.random(in: 0..<self.responses.count)
                self.answerLabel.text = self.responses[randomIndex]
                
                // Fade in animation
                UIView.animate(withDuration: 0.5) {
                    self.answerLabel.alpha = 1.0
                }
            }
        }
    }
    func playShakeSound() {
        // Use a system sound that should work in simulator
        AudioServicesPlaySystemSound(SystemSoundID(1104)) // Camera shutter sound
        
        // Also add haptic feedback if on device
        let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
        impactFeedback.impactOccurred()
    }

}

