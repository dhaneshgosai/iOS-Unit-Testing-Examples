/*:
 # Unit Testing in Swift
 > Unit Test will improve a quality of a software.
 */
import UIKit
import XCTest
import PlaygroundSupport

// MARK: - Implementation code for social media post timestamp
enum Time: String {
    case second = "second"
    case minute = "minute"
    case hour = "hour"
    case day  = "day"
    case week = "week"
    case month = "month"
    case year = "year"
}

class Post {
    var timeAgo: Int
    var time: Time
    
    init(timeAgo: Int, time: Time) {
        self.timeAgo = timeAgo
        self.time = time
    }
}

class TimeManager {
    func displayTimeAgo(forPost post: Post) -> String {
        let timeAgo = post.timeAgo
        let appendingMsg = "s ago"
        return String(timeAgo) + " " + post.time.rawValue + appendingMsg
    }
}


let post = Post(timeAgo: 42, time: .second)
let timeManager = TimeManager()
print(timeManager.displayTimeAgo(forPost: post), "\n")


// MARK: - Test code for social media post timestamp
class TimeManagerTests: XCTestCase {
    var timeManager: TimeManager!
    
    override func setUp() {
        super.setUp()
        timeManager = TimeManager()
    }
    
    override func tearDown() {
        timeManager = nil
        super.tearDown()
    }
    
    func testTimeDisplay_ShouldReturnAppendingMessageForTime() {
        let post = Post(timeAgo: 48, time: .minute)
        let timeAgoMsg = timeManager.displayTimeAgo(forPost: post)
        XCTAssertEqual(timeAgoMsg, "48 minutes ago")
    }
}

TimeManagerTests.defaultTestSuite.run()
