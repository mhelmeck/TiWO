import Foundation

class PrimTests: TestCase {
    typealias Element = Double
    
    internal var sut: Prim<Int>!
    
    private func setUpSut() {
        sut = Prim()
    }
    
    private func tearDownSut() {
        sut = nil
    }
}

extension PrimTests {
    internal func testIfMethodReturnsUpdatedSetForNewVertex() {
        // Arrange
        setUpSut()
        
        let parent = Vertex(data: 1)
        var set = Set<Vertex<Int>>()
        set.insert(parent)
        set.insert(Vertex(data: 2))
        
        let currentCost = 0.0
        let vertexToAdd = Vertex(data: 3)
        let head: (vertex: Vertex<Int>, weight: Double, parent: Vertex<Int>?) = (vertexToAdd, weight: 20.0, parent: parent)
        
        // Act
        let result = sut.addVertexIfNeeded(to: set, withCurrentCost: currentCost, from: head)

        // Assert
        assertTrue(result!.set.contains(vertexToAdd), testName: "testIfMethodReturnsUpdatedSetForNewVertex - first")
        assertEqual(result!.cost, 20.0, testName: "testIfMethodReturnsUpdatedSetForNewVertex - second")
        
        tearDownSut()
    }
    
    internal func testIfMethodAddsUnvisitedEdgeToQueue() {
        // Arrange
        setUpSut()
    
        let parent = Vertex<Int>(data: 1)
        let source = Vertex<Int>(data: 2)
        let destination = Vertex<Int>(data: 3)
        let neighbour = Edge(source: source, destination: destination, weight: 10.0)
        var priorityQueue = PriorityQueue<(vertex: Vertex<Int>, weight: Double, parent: Vertex<Int>?)>(sort: { $0.weight < $1.weight })
        let element: (vertex: Vertex<Int>, weight: Double, parent: Vertex<Int>?) = (Vertex<Int>(data: 100), weight: 100, parent: nil)
        priorityQueue.enqueue(element)
        var visitedSet = Set<Vertex<Int>>()
        visitedSet.insert(parent)

        // Act
        sut.add(neighbour: neighbour, to: &priorityQueue, having: visitedSet, and: parent)

        // Assert
        assertTrue(priorityQueue.dequeue()!.vertex.data == destination.data, testName: "testIfMethodAddsUnvisitedEdgeToQueue")

        tearDownSut()
    }
    
    internal func testIfMethodGeneratesCorrectMST() {
        // Arrange
        setUpSut()
        
        let graph = Prim<Int>.Graph()
        let one = graph.createVertex(data: 1)
        let two = graph.createVertex(data: 2)
        let three = graph.createVertex(data: 3)
        let four = graph.createVertex(data: 4)
        let five = graph.createVertex(data: 5)
        let six = graph.createVertex(data: 6)
        
        graph.add(.undirected, from: one, to: two, weight: 6)
        graph.add(.undirected, from: one, to: three, weight: 1)
        graph.add(.undirected, from: one, to: four, weight: 5)
        graph.add(.undirected, from: two, to: three, weight: 5)
        graph.add(.undirected, from: two, to: five, weight: 3)
        graph.add(.undirected, from: three, to: four, weight: 5)
        graph.add(.undirected, from: three, to: five, weight: 6)
        graph.add(.undirected, from: three, to: six, weight: 4)
        graph.add(.undirected, from: four, to: six, weight: 2)
        graph.add(.undirected, from: five, to: six, weight: 6)
        
        // Act
        let result = sut.produceMinimumSpanningTree(graph: graph)
        
        // Assert
        assertEqual(result.cost, 15.0, testName: "testIfMethodGeneratesCorrectMST")
        
        tearDownSut()
    }
}


