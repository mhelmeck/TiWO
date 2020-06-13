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

public class MenuOptionExecuter {
    public func executePrimaryExample() {
        let graph = AdjacencyList<Int>()
        let one = graph.createVertex(data: 1)
        let two = graph.createVertex(data: 2)
        let three = graph.createVertex(data: 3)

        graph.add(.undirected, from: one, to: two, weight: 2)
        graph.add(.undirected, from: one, to: three, weight: 10)
        graph.add(.undirected, from: two, to: three, weight: 3)
        
        let prim = Prim<Int>()
        let (cost, mst) = prim.produceMinimumSpanningTree(graph: graph)
        
        describeExample(graph: graph, mst: mst, cost: cost)
    }
    
    public func executeAdvancedExample() {
        
    }
    
    public func executeTests() {
        
    }
    
    public func executeExit() {
        print("You're leaving the program.")
        exit(0)
    }
    
    private func describeExample(graph: AdjacencyList<Int>, mst: AdjacencyList<Int>, cost: Double) {
        print("*******************************************************************************************")
        print("Primary Example, where a tree is built of three vertices and edges like:\n")
        print("-> .undirected, from: one, to: two, weight: 2")
        print("-> .undirected, from: one, to: three, weight: 10")
        print("-> .undirected, from: two, to: three, weight: ")
        print("\nThe tree oryginally looks like this: ")
        print(graph.description)

        print("After Prim's algorithm execution the result is Minimum Spanning Three (MSP) like this")
        print(mst.description)
        print("And it's cost is: \(cost)")
        print("*******************************************************************************************")
    }
}
