public enum EdgeType {
    case directed
    case undirected
}

public struct Edge<T: Hashable> {
    public var source: Vertex<T>
    public var destination: Vertex<T>
    public let weight: Double?
}

extension Edge: Hashable {
    static public func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.source == rhs.source &&
            lhs.destination == rhs.destination &&
            lhs.weight == rhs.weight
    }
}

//extension Edge: CustomStringConvertible {
//    public var description: String {
//        return "-> .undirected, from: \(source.description), to: \(destination.description), weight: \(weight)"
//    }
//}
