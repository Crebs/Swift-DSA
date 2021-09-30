import Foundation

class Node {
    var children: Dictionary<Character, Node>
    var isWord: Bool
    init() {
        children = [:]
        isWord = false
        return
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        var text = "["
        for (charr, node) in children {
            text += "\(charr)"
            text += node.description
        }
        text += "]"
        return text
    }
}

class Trie {
    var root: Node
    init() {
        root = Node()
    }
    
    func insert(word: String) {
        var current = root
        for charr in word {
            guard let node = current.children[charr] else {
                let newNode = Node()
                current.children[charr] = newNode
                current = newNode
                continue
            }
            current = node
        }
        current.isWord = true
    }
    
    func getNode(word: String) -> Node? {
        var current = root
        for charr in word {
            guard let node = current.children[charr] else {
                return nil
            }
            current = node
        }
        return current
    }
    
    func search(word: String) -> Bool {
        guard let node = getNode(word: word) else {
            return false
        }
        return node.isWord
    }
    
    func prefix(word: String) -> Bool {
        return getNode(word: word) != nil
    }
}

extension Trie: CustomStringConvertible {
    public var description: String {
        return root.description
    }
}

let trie = Trie()
trie.insert(word: "cat")
trie.insert(word: "car")
trie.insert(word: "cats")
trie.insert(word: "cars")
trie.insert(word: "dog")
trie.insert(word: "dogs")
trie.insert(word: "trains")
trie.insert(word: "train")
trie.insert(word: "dot")
trie.insert(word: "dots")

//print("\(trie.search(word: "trains"))")
//print("\(trie.search(word: "train"))")
//print("\(trie.search(word: "cat"))")
//print("\(trie.search(word: "dog"))")
//print("\(trie.search(word: "cats"))")
//print("\(trie.search(word: "dogs"))")

print(trie)
