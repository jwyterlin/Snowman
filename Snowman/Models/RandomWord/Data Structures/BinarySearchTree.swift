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

/// It uses too many space for a long list of words in the game
/// It is iterating correctly and fastly in randomElement()
///
///  Space Complexity for insertion is O(n)
///  Because of this, operating system breaks the app because it consumes too much memory
///
///  Time Complexity for iteration in randomElement() is O(n)
///  Space Complexity for iteration in randomElement() is O(1), because it moves current node's pointer as it needs to back and forth through the tree
///
/// References:
/// https://en.wikipedia.org/wiki/Binary_tree
/// https://medium.com/nickelfox/binary-search-tree-in-swift-9158aadbe6a3
/// https://www.kodeco.com/books/data-structures-algorithms-in-swift/v3.0/chapters/14-binary-search-trees
/// https://www.kodeco.com/990-swift-algorithm-club-swift-binary-search-tree-data-structure
/// https://www.geeksforgeeks.org/insertion-in-binary-search-tree/
/// https://www.geeksforgeeks.org/insertion-in-a-binary-tree-in-level-order/?ref=lbp
/// https://www.geeksforgeeks.org/select-random-node-tree-equal-probability/
/// https://www.geeksforgeeks.org/complexity-different-operations-binary-tree-binary-search-tree-avl-tree/
/// https://stackoverflow.com/questions/24007129/how-to-generate-a-random-number-in-swift
///
struct BinarySearchTree<Element: Comparable> {
    private var root: BinaryNode<Element>?
    private var count: Int = 0
    
    init() {}
}

extension BinarySearchTree: AddElement {
    mutating func addElement(_ element: Element) {
        root = insert(from: root, value: element)
        count += 1
    }
    
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node = node else {
            return BinaryNode(value: value)
        }
        
        if value < node.value {
            let newNode = insert(from: node.leftChild, value: value)
            newNode.previous = node
            node.leftChild = newNode
        } else {
            let newNode = insert(from: node.rightChild, value: value)
            newNode.previous = node
            node.rightChild = newNode
        }
        
        return node
    }
}

///
///  Time Complexity for iteration in randomElement() is O(n)
///  Space Complexity for iteration in randomElement() is O(1), because it moves current node's pointer as it needs to back and forth through the tree
///
extension BinarySearchTree: RandomElement {
    func randomElement() -> Element? {
        var currentNode = root
        let positionToStop = Int.random(in: 0..<count)
        var currentPosition = 0
        
        while currentPosition < positionToStop {
            if currentNode == nil {
                break
            }
            
            if let leftNode = currentNode?.leftChild {
                currentNode = leftNode
            } else if let rightNode = currentNode?.rightChild {
                currentNode = rightNode
            } else {
                currentNode = currentNode?.previous
            }
            
            currentPosition += 1
        }
        
        return currentNode?.value
    }
}

extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        guard let root = root else {
            return "empty tree"
        }
        
        return String(describing: root)
    }
}

extension BinarySearchTree {
    // Version 1
    //    func contains(_ value: Element) -> Bool {
    //        guard let root = root else {
    //            return false
    //        }
    //        var found = false
    //        root.traverseInOrder {
    //            if $0 == value {
    //                found = true
    //            }
    //        }
    //        return found
    //    }
    
    // Version 2
    func contains(_ value: Element) -> Bool {
        var current = root
        
        while let node = current {
            if node.value == value {
                return true
            }
            
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        
        return false
    }
}

extension BinarySearchTree {
    mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
        if count > 0 {
            count -= 1
        }
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }
        
        if value == node.value {
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            if node.leftChild == nil {
                return node.rightChild
            }
            if node.rightChild == nil {
                return node.leftChild
            }
            
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        
        return node
    }
}

///
/// BinaryNode
///
private final class BinaryNode<Element> {
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    var previous: BinaryNode?
    
    init(value: Element) {
        self.value = value
    }
}

extension BinaryNode {
    func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
}

private extension BinaryNode {
    var min: BinaryNode {
        leftChild?.min ?? self
    }
}
