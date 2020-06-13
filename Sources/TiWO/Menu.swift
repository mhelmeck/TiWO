public class Menu {
    private let inputReader: MenuInputReader
    private let inputMapper: MenuInputMapper
    
    public init(inputReader: MenuInputReader, inputMapper: MenuInputMapper) {
        self.inputReader = inputReader
        self.inputMapper = inputMapper
    }
    
    public func run() {
//        while true {
            let input = inputReader.readUserInput()
            let menuOption = inputMapper.mapInputToMenuOption(input: input)
//        }
    }
}

public class MenuInputReader {
    public func readUserInput() -> String {
        printAvailableOptions()
        
        var userInput: String = String()
        var validInput = false
        
        while !validInput {
            print("Type input:")
            userInput = readLine() ?? "empty_input"
            validInput = isInputValid(userInput)
            if !validInput { print("\n- Failure: Provided input is invalid."); printAvailableOptions() }
        }
    
        return userInput
    }
    
    public func isInputValid(_ input: String?) -> Bool {
        guard let input = input else { return false }
        
        return input == "1" || input == "2" || input == "3" || input == "4"
    }
    
    private func printAvailableOptions() {
        print("\nChoose one option:")
        MenuOption.allCases.forEach {
            print($0.description)
        }
    }
}

public class MenuInputMapper {
    public func mapInputToMenuOption(input: String) -> MenuOption {
        if input == "1" { return .primaryExample }
        if input == "2" { return .advancedExample }
        if input == "3" { return .tests }
        if input == "4" { return .exit }
        
        assertionFailure("Input should be already validated and should match the options given above.")
        return .exit
    }
}
