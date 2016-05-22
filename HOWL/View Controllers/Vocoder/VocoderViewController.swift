//
//  VocoderViewController.swift
//  HOWL
//
//  Created by Daniel Clelland on 1/12/15.
//  Copyright © 2015 Daniel Clelland. All rights reserved.
//

import UIKit
import ProtonomeAudioKitControls

class VocoderViewController: UIViewController {
    
    @IBOutlet weak var formantsFrequencyControl: AudioControl? {
        didSet {
            formantsFrequencyControl?.onChangeValue = { value in
                Audio.vocoder.formantsFrequency.value = value
                Settings.formantsFrequency.value = value
            }
            formantsFrequencyControl?.value = Settings.formantsFrequency.value
        }
    }
    
    @IBOutlet weak var formantsBandwidthControl: AudioControl? {
        didSet {
            formantsBandwidthControl?.onChangeValue = { value in
                Audio.vocoder.formantsBandwidth.value = value
                Settings.formantsBandwidth.value = value
            }
            formantsBandwidthControl?.value = Settings.formantsBandwidth.value
        }
    }
    
    @IBOutlet weak var effectsBitcrushControl: AudioControl? {
        didSet {
            effectsBitcrushControl?.onChangeValue = { value in
                Audio.master.effectsBitcrush.value = value
                Settings.effectsBitcrush.value = value
            }
            effectsBitcrushControl?.value = Settings.effectsBitcrush.value
        }
    }
    
    @IBOutlet weak var effectsReverbControl: AudioControl? {
        didSet {
            effectsReverbControl?.onChangeValue = { value in
                Audio.master.effectsReverb.value = value
                Settings.effectsReverb.value = value
            }
            effectsReverbControl?.value = Settings.effectsReverb.value
        }
    }
    
    @IBOutlet weak var lfoXWaveformControl: AudioControl? {
        didSet {
            lfoXWaveformControl?.onChangeValue = { value in
                Audio.vocoder.lfoXWaveform.value = value
                Settings.lfoXWaveform.value = value
            }
            lfoXWaveformControl?.value = Settings.lfoXWaveform.value
        }
    }
    
    @IBOutlet weak var lfoXDepthControl: AudioControl? {
        didSet {
            lfoXDepthControl?.onChangeValue = { value in
                Audio.vocoder.lfoXDepth.value = value
                Settings.lfoXDepth.value = value
            }
            lfoXDepthControl?.value = Settings.lfoXDepth.value
        }
    }
    
    @IBOutlet weak var lfoXRateControl: AudioControl? {
        didSet {
            lfoXRateControl?.onChangeValue = { value in
                Audio.vocoder.lfoXRate.value = value
                Settings.lfoXRate.value = value
            }
            lfoXRateControl?.value = Settings.lfoXRate.value
        }
    }
    
    @IBOutlet weak var lfoYWaveformControl: AudioControl? {
        didSet {
            lfoYWaveformControl?.onChangeValue = { value in
                Audio.vocoder.lfoYWaveform.value = value
                Settings.lfoYWaveform.value = value
            }
            lfoYWaveformControl?.value = Settings.lfoYWaveform.value
        }
    }
    
    @IBOutlet weak var lfoYDepthControl: AudioControl? {
        didSet {
            lfoYDepthControl?.onChangeValue = { value in
                Audio.vocoder.lfoYDepth.value = value
                Settings.lfoYDepth.value = value
            }
            lfoYDepthControl?.value = Settings.lfoYDepth.value
        }
    }
    
    @IBOutlet weak var lfoYRateControl: AudioControl? {
        didSet {
            lfoYRateControl?.onChangeValue = { value in
                Audio.vocoder.lfoYRate.value = value
                Settings.lfoYRate.value = value
            }
            lfoYRateControl?.value = Settings.lfoYRate.value
        }
    }
    
    // MARK: - Interface events
    
    @IBAction func flipButtonTapped(button: UIButton) {
        flipViewController?.flip()
    }
    
    @IBAction func resetButtonTapped(button: UIButton) {
        formantsFrequencyControl?.value = Settings.formantsFrequency.defaultValue
        formantsBandwidthControl?.value = Settings.formantsBandwidth.defaultValue
        
        effectsBitcrushControl?.value = Settings.effectsBitcrush.defaultValue
        effectsReverbControl?.value = Settings.effectsReverb.defaultValue
        
        lfoXWaveformControl?.value = Settings.lfoXWaveform.defaultValue
        lfoXDepthControl?.value = Settings.lfoXDepth.defaultValue
        lfoXRateControl?.value = Settings.lfoXRate.defaultValue
        
        lfoYWaveformControl?.value = Settings.lfoYWaveform.defaultValue
        lfoYDepthControl?.value = Settings.lfoYDepth.defaultValue
        lfoYRateControl?.value = Settings.lfoYRate.defaultValue
    }
    
}
