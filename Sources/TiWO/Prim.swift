class Prim<T: Hashable>: PrimProtocol {
    typealias Graph = AdjacencyList<T>
    
    var priorityQueue = PriorityQueue<(vertex: Vertex<T>, weight: Double, parent: Vertex<T>?)>(
        sort: { $0.weight < $1.weight })
    
    func produceMinimumSpanningTree(graph: Graph) -> (cost: Double, mst: Graph) {
        var cost = 0.0
        let mst = Graph()
        var visited = Set<Vertex<T>>()
        
        guard let start = graph.getAllVertices().first else {
            return (cost: cost, mst: mst)
        }
        
        priorityQueue.enqueue((vertex: start, weight: 0.0, parent: nil))
        
        while let head = priorityQueue.dequeue() {
            guard let (updatedSet, updatedCost) = addVertexIfNeeded(to: visited, withCurrentCost: cost, from: head) else {
                continue
            }
            
            visited = updatedSet
            cost = updatedCost
            
            let vertex = head.vertex
            if let prev = head.parent {
                mst.add(.undirected, from: prev, to: vertex, weight: head.weight)
            }
            
            if let neighbours = graph.edges(from: vertex) {
                neighbours.forEach {
                    add(neighbour: $0, to: &priorityQueue, having: visited, and: vertex)
                }
            }
        }
        
        return (cost: cost, mst: mst)
    }
    
    func addVertexIfNeeded(to set: Set<Vertex<T>>,
                           withCurrentCost cost: Double,
                           from head: (vertex: Vertex<T>, weight: Double, parent: Vertex<T>?)) -> (set: Set<Vertex<T>>, cost: Double)? {
        if set.contains(head.vertex) {
            return nil
        }
        
        var updatedSet = set
        updatedSet.insert(head.vertex)
        
        return (updatedSet, cost + head.weight)
    }
    
    func add<T>(neighbour:  Edge<T>,
                to priorityQueue: inout PriorityQueue<(vertex: Vertex<T>, weight: Double, parent: Vertex<T>?)>,
                having visited: Set<Vertex<T>>,
                and parent: Vertex<T>) {
        
        let contains = visited.contains(neighbour.destination)
        if !contains {
            priorityQueue.enqueue((vertex: neighbour.destination, weight: neighbour.weight ?? 0.0, parent: parent))
        }
    }
}

protocol PrimProtocol {
    associatedtype T: Hashable
    
    func produceMinimumSpanningTree(graph: Prim<T>.Graph) -> (cost: Double, mst: Prim<T>.Graph)
    func addVertexIfNeeded(to set: Set<Vertex<T>>,
                           withCurrentCost cost: Double,
                           from head: (vertex: Vertex<T>, weight: Double, parent: Vertex<T>?)) -> (set: Set<Vertex<T>>, cost: Double)?
    func add<T>(neighbour:  Edge<T>,
                to priorityQueue: inout PriorityQueue<(vertex: Vertex<T>, weight: Double, parent: Vertex<T>?)>,
                having visited: Set<Vertex<T>>,
                and parent: Vertex<T>)
}


class XXX: PrimProtocol {
    typealias T = Int
    
    func produceMinimumSpanningTree(graph: Prim<Int>.Graph) -> (cost: Double, mst: Prim<Int>.Graph) {
        return (cost: 0.0, mst: Prim<Int>.Graph())
    }
    
    func addVertexIfNeeded(to set: Set<Vertex<Int>>,
                           withCurrentCost cost: Double,
                           from head: (vertex: Vertex<Int>, weight: Double, parent: Vertex<Int>?)) -> (set: Set<Vertex<Int>>, cost: Double)? {
        return (set: Set<Vertex<Int>>(), cost: 0.0)
    }
    
    func add<T>(neighbour: Edge<T>,
                to priorityQueue: inout PriorityQueue<(vertex: Vertex<T>, weight: Double, parent: Vertex<T>?)>,
                having visited: Set<Vertex<T>>,
                and parent: Vertex<T>) {
    }
}

enum PrimError: Error {
    case notImplemented
}
