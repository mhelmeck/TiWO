import Foundation

public protocol TestCase {
    associatedtype Element: Equatable
    
    func assertTrue(_: Bool, testName: String)
    func assertFalse(_: Bool, testName: String)
    func assertEqual(_ e1: Element, _ e2: Element, testName: String)
}

extension TestCase {
    func assertTrue(_ e: Bool, testName: String) {
        if e {
            print("SUCCESS - \(testName)")
        } else {
            print("FAILURE - \(testName)")
        }
    }
    
    func assertFalse(_ e: Bool, testName: String) {
        if e {
            print("FAILURE - \(testName)")
        } else {
            print("SUCCESS - \(testName)")
        }
    }
    
    func assertEqual(_ e1: Element, _ e2: Element, testName: String) {
        if e1 == e2 {
            print("SUCCESS - \(testName)")
        } else {
            print("FAILURE - \(testName)")
        }
    }
}
