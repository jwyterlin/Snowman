/// Copyright (c) 2023 Kodeco Inc.
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.
import Foundation

/// It is taking a long time to add all words of the list in the game
/// Also, it is not iterating correctly in randomElement()
///
/// Time Complexity for insertion looks like O(n) but it is taking a long time ( 25 seconds to run it )
/// Space Complexity for insertion is O(1), because it's moving the pointer of current node down the next nodes to iterate
///
/// Time Complexity for iteration in randomElement() is O(n)
/// Space Complexity for iteration in randomElement() is O(n), because it uses a stack to keep the visited nodes
///
/// References:
/// https://en.wikipedia.org/wiki/Binary_tree
/// https://medium.com/swlh/data-structures-algorithms-in-swift-part-3-binary-tree-2de778058d12
/// https://medium.com/nickelfox/binary-search-tree-in-swift-9158aadbe6a3
/// https://crackinterviewtoday.wordpress.com/2010/03/15/rebuild-a-binary-tree-from-inorder-and-preorder-traversals/
/// https://github.com/soapyigu/LeetCode-Swift/blob/master/Stack/BinarySearchTreeIterator.swift
/// https://stackoverflow.com/questions/31462272/stack-implementation-in-swift
/// https://www.geeksforgeeks.org/select-random-node-tree-equal-probability/
/// https://stackoverflow.com/questions/24007129/how-to-generate-a-random-number-in-swift
/// https://stackoverflow.com/questions/50950092/calculating-the-difference-between-two-dates-in-swift
/// https://www.geeksforgeeks.org/complexity-different-operations-binary-tree-binary-search-tree-avl-tree/
///
final class BinaryTreeC<Element: Comparable> {
    private var root: Node<Element>?
    private var count: Int = 0
}

extension BinaryTreeC: AddElement {
    func addElement(_ element: Element) {
        let node = Node(data: element)
        
        guard let root = self.root else {
            self.root = node
            count += 1
            return
        }
        
        var previous: Node<Element>? = nil
        var currentNode: Node<Element>? = root
        
        while currentNode != nil {
            if let temp = currentNode {
                previous = temp
                if temp.data > element {
                    currentNode = temp.left
                } else if temp.data < element {
                    currentNode = temp.right
                }
            }
        }
        
        if let previous {
            if previous.data > element {
                previous.setLeft(node)
            } else {
                previous.setRight(node)
            }
        }
        
        count += 1
    }
}

extension BinaryTreeC: RandomElement {
    func randomElement() -> Element? {
        let startDate = Date()
        print("RE start date: \(startDate)")
        let positionToStop = Int.random(in: 0..<count)
        print("positionToStop: \(positionToStop)")
        
        var index = 0
        var stack = Stack<Node<Element>>()
        var currentNode = root
        var elementToReturn = currentNode
        
        while index == positionToStop {
            if let temp = currentNode {
                stack.push(temp)
                currentNode = temp.left
            } else {
                if let poppedElement = stack.pop() {
                    elementToReturn = poppedElement
                }
                currentNode = currentNode?.right
            }
            if let elementToReturn {
                print("current index: \(index) current word: \(elementToReturn.data)")
            }
            index += 1
        }
        print("end index: \(index)")
        let endDate = Date()
        print("RE end date: \(endDate)")
        print("RE elapsed time: \(endDate - startDate) seconds")
        
        return elementToReturn?.data
    }
}

///
/// Incomplete implementation
///
//extension BinaryTreeC: CustomStringConvertible {
//    var description: String {
//        guard let root else {
//            return "Empty tree"
//        }
//
//        var result = "\(root.data)\n"
//        var stack = Stack<Node<T>>()
//        var previous: Node<T>? = root
//        var currentNode: Node<T>? = root.left
//
//        // result.append("L: \(left.data)\t")
//        // result.append("R: \(right.data)\n")
//
//        while currentNode != nil {
//            previous = currentNode
//            if let temp = currentNode?.left {
//                stack.push(temp)
//            }
//            currentNode = currentNode?.left
//        }
//
//        return result
//    }
//}

private final class Node<T: Equatable> {
    let data: T
    private(set) var left: Node?
    private(set) var right: Node?
    
    init(data: T, left: Node? = nil, right: Node? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }
    
    func setLeft(_ left: Node) {
        self.left = left
    }
    
    func setRight(_ right: Node) {
        self.right = right
    }
}

extension Node: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        lhs.data == rhs.data
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        "Node: \(data) L: \(left?.description ?? "Empty node") R: \(right?.description ?? "Empty node")"
    }
}

protocol Stackable {
    associatedtype Element
    func peek() -> Element?
    mutating func push(_ element: Element)
    @discardableResult mutating func pop() -> Element?
}

extension Stackable {
    var isEmpty: Bool { peek() == nil }
}

struct Stack<Element>: Stackable where Element: Equatable {
    private var storage = [Element]()
    func peek() -> Element? { storage.last }
    mutating func push(_ element: Element) { storage.append(element)  }
    mutating func pop() -> Element? { storage.popLast() }
}

extension Stack: Equatable {
    static func == (lhs: Stack<Element>, rhs: Stack<Element>) -> Bool {
        lhs.storage == rhs.storage
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        "\(storage)"
    }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Self.Element...) {
        storage = elements
    }
}
