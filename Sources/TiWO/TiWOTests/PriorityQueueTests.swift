import Foundation

class PriorityQueueTests: TestCase {
    typealias Element = Int
    
    internal var sut: PriorityQueue<(vertex: Vertex<PriorityQueueTests.Element>,
                                     weight: Double,
                                     parent: Vertex<PriorityQueueTests.Element>?)>!
    
    private func setUpSut() {
        sut = PriorityQueue<(vertex: Vertex<Element>, weight: Double, parent: Vertex<Element>?)>(
        sort: { $0.weight < $1.weight })
    }
    
    private func tearDownSut() {
        sut = nil
    }
}

extension PriorityQueueTests {
    internal func testIsEmptyReturnsTrueIfThereIsNoElementsInTheQueue() {
        // Arrange
        setUpSut()
        
        // Act & Assert
        assertTrue(sut.isEmpty, testName: "testIsEmptyReturnsTrueIfThereIsNoElementsInTheQueue")
    }
    
    internal func testEnqueueAddsElementToQueue() {
        setUpSut()
        
        let graph = Prim<Int>.Graph()
        let one = graph.createVertex(data: 1)
        
        // Act & Assert
        assertTrue(sut.isEmpty, testName: "testEnqueueAddsElementToQueue - first")
        sut.enqueue((vertex: one, weight: 0.0, parent: nil))
        assertFalse(sut.isEmpty, testName: "testEnqueueAddsElementToQueue - second")
    }
    
    internal func testDequeueRemovesElementFromQueue() {
        setUpSut()
        
        let graph = Prim<Int>.Graph()
        let one = graph.createVertex(data: 1)
        sut.enqueue((vertex: one, weight: 0.0, parent: nil))
        
        // Act & Assert
        assertFalse(sut.isEmpty, testName: "testDequeueRemovesElementFromQueue - first")
        _ = sut.dequeue()
        assertTrue(sut.isEmpty, testName: "testDequeueRemovesElementFromQueue - second")
    }
    
    internal func testIsEmptyReturnsFalseIfThereIsNoElementsInTheQueue() {
        // Arrange
        setUpSut()
        
        let graph = Prim<Int>.Graph()
        let one = graph.createVertex(data: 1)
        let two = graph.createVertex(data: 2)
        
        // Act
        sut.enqueue((vertex: one, weight: 0.0, parent: two))
        
        // Assert
        assertFalse(sut.isEmpty, testName: "testIsEmptyReturnsFalseIfThereIsNoElementsInTheQueue")
    }
    
    internal func testCountReturnsNumberOfElementsInQueue() {
        // Arrange
        setUpSut()
        
        let graph = Prim<Int>.Graph()
        let one = graph.createVertex(data: 1)
        let two = graph.createVertex(data: 2)
        let three = graph.createVertex(data: 3)
        
        // Act
        sut.enqueue((vertex: one, weight: 0.0, parent: nil))
        sut.enqueue((vertex: two, weight: 0.0, parent: nil))
        sut.enqueue((vertex: three, weight: 0.0, parent: nil))
        
        // Assert
        assertEqual(sut.count, 3, testName: "testCountReturnsNumberOfElementsInQueue")
    }
    
    internal func testPeekReturnsLastElementFromQueue() {
        setUpSut()
        
        let graph = Prim<Int>.Graph()
        let one = graph.createVertex(data: 1)
        let two = graph.createVertex(data: 2)
        sut.enqueue((vertex: one, weight: 0.0, parent: nil))
        sut.enqueue((vertex: two, weight: 0.0, parent: nil))
        
        // Act
        let result = sut.peek()!.vertex
        
        // Assert
        assertEqual(result.data, 1, testName: "testPeekReturnsLastElementFromQueue")
    }
}
