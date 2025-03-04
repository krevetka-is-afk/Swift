//
//  Tracker.swift
//  Unit tests test projet
//
//  Created by Сергей Растворов on 21/1/25.
//

import Foundation

// Не трогать
public final class Tracker {
    
    private init() { }
    
    public static let shared = Tracker()
    
    public func track(event: String) {
        print("Event \(event)")
    }
}

/// ------

final class Analytics {
    var tracker: TrackerProtocol = Tracker.shared
    var expectetedEvent: String
    
    init(event: String) {
        self.expectetedEvent = event
    }
    
    init(with tracker: TrackerProtocol) {
        self.tracker = tracker
    }
    
    func trackScreen() {
        // Tracker.shared.track(event: "Screen")
        
        tracker.track(event: "Screen")
    }
}

final class MockTracker: TrackerProtocol {
    var wasCalled: Bool = false
    
    func track(event: String) {
        wasCalled = true
    }
}

func testAnalytics(for analytics: Analytics) -> Bool {
    // arrange
    var tracker : MockTracker = MockTracker()
    var analytics = Analytics(with: tracker)
    
    // act
    analytics.trackScreen()
    
    // assert
    if tracker.wasCalled { return true }
    return false
    
}

protocol TrackerProtocol {
    func track(event: String)
}
extension Tracker: TrackerProtocol{ }

var tracker: TrackerProtocol = MockTracker()
print(testAnalytics(for: Analytics(with: tracker)))

