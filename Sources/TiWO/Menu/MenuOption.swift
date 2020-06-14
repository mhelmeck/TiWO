import Foundation

public enum MenuOption: CaseIterable, Equatable {
    case primaryExample
    case advancedExample
    case tests
    case exit
    
    public var description: String {
        switch self {
        case .primaryExample:
            return "1 - run primary example"
        case .advancedExample:
            return "2 - run advanced example"
        case .tests:
            return "3 - run tests"
        case .exit:
            return "4 - exit program"
        }
    }
}
