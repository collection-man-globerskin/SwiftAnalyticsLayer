//
//  ViewController.swift
//  BasicAnalyticsFramework
//
//  Created by Julian Llorensi on 16/07/2020.
//  Copyright © 2020 Julian Llorensi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!
    
    private var analytics: AnalyticsManager
    
    init(analytics: AnalyticsManager = AnalyticsManager()) {
        self.analytics = analytics
        super.init(nibName: String(describing: ViewController.self), bundle: nil)
    }
    
    required init(coder: NSCoder) {
        self.analytics = AnalyticsManager()
        super.init(coder: coder)!
        // fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        analytics.log(SpecificAnalyticsEvent.screenViewed)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.addTarget(self, action: #selector(valuaHasChanged(_:)), for: .valueChanged)
        loginButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction private func screenTapped(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        analytics.log(SpecificAnalyticsEvent.screenTapped(location: (Float(location.x), Float(location.y))))
    }
    
    @objc private func valuaHasChanged(_ sender: UISlider) {
        analytics.log(SpecificAnalyticsEvent.valueChanged(value: sender.value))
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        analytics.log(SpecificAnalyticsEvent.buttonTapped(buttonSelected: sender.titleLabel?.text ?? ""))
    }
}

