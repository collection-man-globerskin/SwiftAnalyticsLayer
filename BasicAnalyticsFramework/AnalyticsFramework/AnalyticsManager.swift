//
//  AnalyticsManager.swift
//  BasicAnalyticsFramework
//
//  Created by Julian Llorensi on 16/07/2020.
//  Copyright © 2020 Julian Llorensi. All rights reserved.
//

import Foundation

class AnalyticsManager {
    private let engine: AnalyticsEngine
    
    init(engine: AnalyticsEngine = DummyAnalyticsEngine()) {
        self.engine = engine
    }
    
    func log(_ event: AnalyticsEvent) {
        engine.sendAnalyticsEvent(named: event.name, metadata: event.metadata)
    }
}
