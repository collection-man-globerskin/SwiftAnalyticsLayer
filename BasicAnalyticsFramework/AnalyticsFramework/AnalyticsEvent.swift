//
//  AnalyticsEvent.swift
//  BasicAnalyticsFramework
//
//  Created by Julian Llorensi on 16/07/2020.
//  Copyright © 2020 Julian Llorensi. All rights reserved.
//

import Foundation

typealias Key = String
typealias Value = Any
typealias AnalyticsMetadata = [Key : Value]

protocol AnalyticsEvent {
    var name: String { get }
    var metadata: AnalyticsMetadata { get }
}

enum SpecificAnalyticsEvent: AnalyticsEvent {
    case screenViewed
    case screenTapped(location: (Float, Float))
    case valueChanged(value: Float)
    case buttonTapped(buttonSelected: String)
    
    var name: String {
        switch self {
        case .screenViewed:
            return String(describing: self)
        case .screenTapped:
            return "screenTapped"
        case .valueChanged:
            return "valueChanged"
        case .buttonTapped:
            return "buttonTapped"
        }
    }
    
    var metadata: AnalyticsMetadata {
        switch self {
        case .screenViewed:
            return [:]
        case .screenTapped(let location):
            return ["xAxis" : location.0, "yAxis" : location.1]
        case .valueChanged(let value):
            return ["current value" : value]
        case .buttonTapped(let buttonSelected):
            return ["button name" : buttonSelected]
        }
    }
}
