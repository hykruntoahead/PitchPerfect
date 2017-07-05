//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by 何育昆 on 2017/7/4.
//  Copyright © 2017年 Hyk. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    var recordedAudioURL : URL!;
    
    var audioFile : AVAudioFile!;
    var audioEngine:AVAudioEngine!;
    var audioPlayerNode:AVAudioPlayerNode!;
    var stopTimer:Timer!;
    
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        setupAudio()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         configureUI(.notPlaying)
    }
    @IBAction func playSound(_sender:UIButton){
        switch(ButtonType(rawValue: _sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
     }
    
    @IBAction func stopSound(_sender:UIButton){
         stopAudio()
    }
}
