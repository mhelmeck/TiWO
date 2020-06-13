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
