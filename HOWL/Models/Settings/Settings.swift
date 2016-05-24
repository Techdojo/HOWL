//
//  Settings.swift
//  HOWL
//
//  Created by Daniel Clelland on 16/11/15.
//  Copyright © 2015 Daniel Clelland. All rights reserved.
//

import UIKit
import AudioKit

struct Settings {
    
    static let phonemeboardSustain = Setting<Bool>(key: "phonemeboardSustain", defaultValue: false)
    static let keyboardSustain = Setting<Bool>(key: "keyboardSustain", defaultValue: false)
    
    static let formantsFrequency = Setting<Float>(key: "formantsFrequency", defaultValue: 1.0)
    static let formantsBandwidth = Setting<Float>(key: "formantsBandwidth", defaultValue: 1.0)
    
    static let effectsBitcrush = Setting<Float>(key: "effectsBitcrush", defaultValue: 0.0)
    static let effectsReverb = Setting<Float>(key: "effectsReverb", defaultValue: 0.0)
    
    static let lfoXShape = Setting<Float>(key: "lfoXShape", defaultValue: 0.0)
    static let lfoXDepth = Setting<Float>(key: "lfoXDepth", defaultValue: 0.0)
    static let lfoXRate = Setting<Float>(key: "lfoXRate", defaultValue: 0.0)
    
    static let lfoYShape = Setting<Float>(key: "lfoYShape", defaultValue: 0.0)
    static let lfoYDepth = Setting<Float>(key: "lfoYDepth", defaultValue: 0.0)
    static let lfoYRate = Setting<Float>(key: "lfoYRate", defaultValue: 0.0)
    
    static let keyboardLeftInterval = Setting<Int>(key: "keyboardLeftInterval", defaultValue: 4)
    static let keyboardRightInterval = Setting<Int>(key: "keyboardRightInterval", defaultValue: 7)
    
    static let envelopeAttack = Setting<Float>(key: "envelopeAttack", defaultValue: 0.002)
    static let envelopeDecay = Setting<Float>(key: "envelopeDecay", defaultValue: 0.002)
    static let envelopeSustain = Setting<Float>(key: "envelopeSustain", defaultValue: 1.0)
    static let envelopeRelease = Setting<Float>(key: "envelopeRelease", defaultValue: 0.002)
    
    static let vibratoWaveform = Setting<Float>(key: "vibratoWaveform", defaultValue: AKLowFrequencyOscillator.waveformTypeForSine().value)
    static let vibratoDepth = Setting<Float>(key: "vibratoDepth", defaultValue: 0.0)
    static let vibratoRate = Setting<Float>(key: "vibratoRate", defaultValue: 0.0)
    
    static let tremoloWaveform = Setting<Float>(key: "tremoloWaveform", defaultValue: AKLowFrequencyOscillator.waveformTypeForSine().value)
    static let tremoloDepth = Setting<Float>(key: "tremoloDepth", defaultValue: 0.0)
    static let tremoloRate = Setting<Float>(key: "tremoloRate", defaultValue: 0.0)

}
