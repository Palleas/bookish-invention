//
//  ViewController.swift
//  RomeReactiveCocoaTest
//
//  Created by Romain Pouclet on 2017-04-03.
//  Copyright © 2017 Perfectly-Cooked. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa
import Result

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var coolSwitch: UISwitch!
    @IBOutlet weak var otherSwitch: UISwitch!
    @IBOutlet weak var yetAnotherSwitch: UISwitch!

    let coolAction = Action<Bool, Bool, NoError> { input in
        return SignalProducer(value: input)
    }
    
    private let client = Client()
    
    var switchAction: CocoaAction<UISwitch>!

    override func viewDidLoad() {
        super.viewDidLoad()

        switchAction = CocoaAction<UISwitch>(coolAction, { s in
            return s.isOn
        })
        
        coolSwitch.addTarget(switchAction, action: CocoaAction<UISwitch>.selector, for: .valueChanged)
        
        otherSwitch.reactive.isOn <~ coolSwitch.reactive.isOnValues
        yetAnotherSwitch.reactive.isOn <~ coolSwitch.reactive.isOnValues.map { !$0 }
        
        let nameProducer = client.user()
            .map { return "Welcome, \($0.name)!"}
            .flatMapError { _ in SignalProducer<String, NoError>.empty }
        
        welcomeLabel.reactive.text <~ nameProducer
    }

}

