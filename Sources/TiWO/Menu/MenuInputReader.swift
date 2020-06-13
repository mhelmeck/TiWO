public class MenuInputReader {
    public func readUserInput() -> String {
        printAvailableOptions()
        
        var userInput: String = String()
        var validInput = false
        
        while !validInput {
            print("Type input:")
            userInput = readLine() ?? "empty_input"
            validInput = isInputValid(userInput)
            if !validInput { print("\n- FAILURE: Provided input is invalid."); printAvailableOptions() }
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

