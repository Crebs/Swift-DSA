import Foundation

class Node<T: Comparable> {
    var left: Node?
    var right: Node?
    var data: T
    
    init(value: T) {
        data = value
    }
    
    func insert(value: T) {
        if value <= data {
            if left == nil {
                left = Node(value: value)
            } else {
                left?.insert(value: value)
            }
        } else {
            if right == nil {
                right = Node(value: value)
            } else {
                right?.insert(value: value)
            }
        }
    }
    
    func contains(value: T) -> Bool {
        if value == data {
            return true
        } else if value < data {
            if let left = left {
                return left.contains(value: value)
            }
        } else if value > data {
            if let right = right {
                return right.contains(value: value)
            }
        }
        return false
    }
    
    func printInOrder() {
        left?.printInOrder()
        print("\(data)")
        right?.printInOrder()
    }
    
    func printPreOrder() {
        print("\(data)")
        left?.printPreOrder()
        right?.printPreOrder()
    }
    
    func printPostOrder() {
        left?.printPreOrder()
        right?.printPreOrder()
        print("\(data)")
    }
}

let root = Node(value: "B")
root.insert(value: "A")
root.insert(value: "C")


root.printInOrder()
