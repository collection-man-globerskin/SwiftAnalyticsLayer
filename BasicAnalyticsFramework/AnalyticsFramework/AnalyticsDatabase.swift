//
//  AnalyticsDatabase.swift
//  BasicAnalyticsFramework
//
//  Created by Julian Llorensi on 16/07/2020.
//  Copyright © 2020 Julian Llorensi. All rights reserved.
//

import Foundation

enum DatabaseError: Error {
    case invalidData
    case cannotSave
    
    var localizedDescription: String {
        switch self {
        case .invalidData, .cannotSave:
            return "[DatabaseError]: \(String(describing: self))"
        }
    }
}

protocol AnalyticsDatabase: class {
    func save(_ record: AnalyticsRecord, completion: (Result<AnalyticsRecord, DatabaseError>) -> Void)
}

final class DummyAnalyticsDatabase: AnalyticsDatabase {
    var records: [AnalyticsRecord] = []
    var shouldSendError: Bool = false
    
    func save(_ record: AnalyticsRecord, completion: (Result<AnalyticsRecord, DatabaseError>) -> Void) {
        guard !shouldSendError else {
            completion(.failure(.invalidData))
            return
        }
        
        records.append(record)
        completion(.success(record))
    }
}


