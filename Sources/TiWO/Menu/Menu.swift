import Foundation

public class Menu {
    private let inputReader: MenuInputReader
    private let inputMapper: MenuInputMapper
    private let executer: MenuOptionExecuter
    
    public init(inputReader: MenuInputReader, inputMapper: MenuInputMapper, executer: MenuOptionExecuter) {
        self.inputReader = inputReader
        self.inputMapper = inputMapper
        self.executer = executer
    }
    
    public func run() {
        while true {
            let input = inputReader.readUserInput()
            let menuOption = inputMapper.mapInputToMenuOption(input: input)
            
            switch menuOption {
            case .primaryExample:
                executer.executePrimaryExample()
            case .advancedExample:
                executer.executeAdvancedExample()
            case .tests:
                executer.executeTests()
            case .exit:
                executer.executeExit()
            }
        }
    }
}
