import Foundation

public class Node<T> {
    var next: Node<T>?
    let data: T
    init(data: T) {
        self.data = data
    }
}

public class LinkedList<T: Equatable> {
    var head: Node<T>?
    
    func append(data: T) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = Node(data: data)
    }
    
    func prepend(data: T) {
        let newHead = Node(data: data)
        newHead.next = head
        head = newHead
    }
    
    func delete(data: T) {
        if head == nil {
            return
        }
        
        if head?.data == data {
            head = head?.next
        }
        
        var current = head
        while current?.next != nil {
            if current?.next?.data == data {
                current?.next = current?.next?.next
                return
            }
            current = current?.next
        }
    }
    
    func rever(){
        var previous: Node<T>?
        var current = head
        while current != nil {
            let next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
        head = previous
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var current = head
        while current != nil {
            guard let data = current?.data else {
                text += "empty"
                continue
            }
            text += "\(data)"
            current = current?.next
            if current != nil {
                text += ", "
            }
        }
        text += "]"
        return text
    }
}

let dogBreeds = LinkedList<String>()
dogBreeds.append(data: "Labrador")
dogBreeds.append(data: "Cat")
dogBreeds.append(data: "Beagle")
dogBreeds.append(data: "Husky")

print(dogBreeds)

dogBreeds.delete(data: "Cat")

print(dogBreeds)

dogBreeds.append(data: "Poodle")

print(dogBreeds)

dogBreeds.prepend(data: "Bulldog")

print(dogBreeds)

dogBreeds.rever()
print(dogBreeds)
dogBreeds.rever()
print(dogBreeds)

//dogBreeds.delete(data: "Poodle")
//print(dogBreeds)
//
//dogBreeds.delete(data: "Bulldog")
//print(dogBreeds)
//
//dogBreeds.delete(data: "Beagle")
//print(dogBreeds)
//
//dogBreeds.delete(data: "Husky")
//print(dogBreeds)
//
//dogBreeds.delete(data: "Labrador")
//print(dogBreeds)
