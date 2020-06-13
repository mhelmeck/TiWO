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
        
        print("*******************************************************************************************")
        print("Primary Example, where a tree is built of 3(three) vertices and 3(three) edges like:\n")
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
    
    public func executeAdvancedExample() {
        let graph = AdjacencyList<Int>()
        let one = graph.createVertex(data: 1)
        let two = graph.createVertex(data: 2)
        let three = graph.createVertex(data: 3)
        let four = graph.createVertex(data: 4)
        let five = graph.createVertex(data: 5)
        let six = graph.createVertex(data: 6)
        let seven = graph.createVertex(data: 7)

        graph.add(.undirected, from: one, to: two, weight: 5)
        graph.add(.undirected, from: one, to: three, weight: 1)
        graph.add(.undirected, from: one, to: four, weight: 4)
        graph.add(.undirected, from: two, to: four, weight: 8)
        graph.add(.undirected, from: two, to: six, weight: 6)
        graph.add(.undirected, from: three, to: four, weight: 3)
        graph.add(.undirected, from: three, to: five, weight: 2)
        graph.add(.undirected, from: four, to: six, weight: 8)
        graph.add(.undirected, from: five, to: six, weight: 7)
        graph.add(.undirected, from: five, to: seven, weight: 9)
        
        let prim = Prim<Int>()
        let (cost, mst) = prim.produceMinimumSpanningTree(graph: graph)
        
        print("*******************************************************************************************")
        print("Advanced Example, where a tree is built of 7(seven) vertices and 10(ten) edges like:\n")
        print("-> .undirected, from: one, to: two, weight: 5")
        print("-> .undirected, from: one, to: three, weight: 1")
        print("-> .undirected, from: one, to: four, weight: 4")
        print("-> .undirected, from: two, to: four, weight: 8")
        print("-> .undirected, from: two, to: six, weight: 6")
        print("-> .undirected, from: three, to: four, weight: 3")
        print("-> .undirected, from: three, to: five, weight: 2")
        print("-> .undirected, from: four, to: six, weight: 8")
        print("-> .undirected, from: five, to: six, weight: 7")
        print("-> .undirected, from: five, to: seven, weight: 9")
        print("\nThe tree oryginally looks like this: ")
        print(graph.description)

        print("After Prim's algorithm execution the result is Minimum Spanning Three (MSP) like this")
        print(mst.description)
        print("And it's cost is: \(cost)")
        print("*******************************************************************************************")    }
    
    public func executeTests() {
        
    }
    
    public func executeExit() {
        print("You're leaving the program.")
        exit(0)
    }
}
