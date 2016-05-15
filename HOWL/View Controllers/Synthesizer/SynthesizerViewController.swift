//
//  SynthesizerViewController.swift
//  HOWL
//
//  Created by Daniel Clelland on 1/12/15.
//  Copyright © 2015 Daniel Clelland. All rights reserved.
//

import UIKit
import ProtonomeAudioKitControls

class SynthesizerViewController: UIViewController {
    
    @IBOutlet weak var vibratoDepthControl: AudioControl? {
        didSet {
            vibratoDepthControl?.value = Settings.vibratoDepth.value
            vibratoDepthControl?.onChangeValue = { value in
                Audio.synthesizer.vibratoDepth.value = value
                Settings.vibratoDepth.value = value
            }
        }
    }
    
    @IBOutlet weak var vibratoFrequencyControl: AudioControl? {
        didSet {
            vibratoFrequencyControl?.value = Settings.vibratoFrequency.value
            vibratoFrequencyControl?.onChangeValue = { value in
                Audio.synthesizer.vibratoFrequency.value = value
                Settings.vibratoFrequency.value = value
            }
        }
    }
    
    @IBOutlet weak var keyboardLeftIntervalControl: AudioControl? {
        didSet {
            keyboardLeftIntervalControl?.value = Float(Settings.keyboardLeftInterval.value)
            keyboardLeftIntervalControl?.onChangeValue = { value in
                self.keyboardViewController?.keyboard.leftInterval = Int(value)
                self.keyboardViewController?.refreshNotes()
                self.keyboardViewController?.refreshView()
                Settings.keyboardLeftInterval.value = Int(value)
            }
            keyboardLeftIntervalControl?.onTouchDown = {
                self.keyboardViewController?.mode = self.keyboardViewControllerMode
            }
            keyboardLeftIntervalControl?.onTouchUp = {
                self.keyboardViewController?.mode = self.keyboardViewControllerMode
            }
        }
    }
    
    @IBOutlet weak var keyboardRightIntervalControl: AudioControl? {
        didSet {
            keyboardRightIntervalControl?.value = Float(Settings.keyboardRightInterval.value)
            keyboardLeftIntervalControl?.onChangeValue = { value in
                self.keyboardViewController?.keyboard.rightInterval = Int(value)
                self.keyboardViewController?.refreshNotes()
                self.keyboardViewController?.refreshView()
                Settings.keyboardRightInterval.value = Int(value)
            }
            keyboardLeftIntervalControl?.onTouchDown = {
                self.keyboardViewController?.mode = self.keyboardViewControllerMode
            }
            keyboardLeftIntervalControl?.onTouchUp = {
                self.keyboardViewController?.mode = self.keyboardViewControllerMode
            }
        }
    }
    
    // MARK: - Interface events
    
    @IBAction func flipButtonTapped(button: UIButton) {
        flipViewController?.flip()
    }
    
    @IBAction func resetButtonTapped(button: UIButton) {
        vibratoDepthControl?.value = Settings.vibratoDepth.defaultValue
        vibratoFrequencyControl?.value = Settings.vibratoFrequency.defaultValue
        keyboardLeftIntervalControl?.value = Float(Settings.keyboardLeftInterval.defaultValue)
        keyboardRightIntervalControl?.value = Float(Settings.keyboardRightInterval.defaultValue)
    }
    
    // MARK: - Private getters
    
    private var keyboardViewController: KeyboardViewController? {
        if let flipViewController = flipViewController {
            return flipViewController.howlViewController?.keyboardViewController
        } else {
            return howlViewController?.keyboardViewController
        }
    }
    
    private var keyboardViewControllerMode: KeyboardViewController.Mode {
        if keyboardLeftIntervalControl?.selected == true || keyboardRightIntervalControl?.selected == true {
            return .ShowBackground
        }
        
        return .Normal
    }
    
}
