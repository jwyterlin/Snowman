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

///  It uses too many space for a long list of words in the game
///  Space Complexity for insertion is O(n)
///  Because of this, operating system breaks the app because it consumes too much memory
///  
///  References:
///  https://en.wikipedia.org/wiki/Binary_tree
///  https://medium.com/swlh/data-structures-algorithms-in-swift-part-3-binary-tree-2de778058d12
///  https://www.geeksforgeeks.org/select-random-node-tree-equal-probability/
///  https://stackoverflow.com/questions/24007129/how-to-generate-a-random-number-in-swift
///  https://www.geeksforgeeks.org/complexity-different-operations-binary-tree-binary-search-tree-avl-tree/
///  
final class BinaryTreeB<Element: Comparable> {
    private var root: Node<Element>?
    private var count: Int = 0
}

extension BinaryTreeB: AddElement {
    func addElement(_ element: Element) {
        let node = Node(data: element)
        if let root = self.root {
            insert(root: root, node: node)
        } else {
            self.root = node
        }
        
        count += 1
    }
    
    private func insert(root: Node<Element>, node: Node<Element>) {
        if root.data > node.data {
            if let left = root.left {
                insert(root: left, node: node)
            } else {
                root.setLeft(node)
            }
        } else {
            if let right = root.right {
                insert(root: right, node: node)
            } else {
                root.setRight(node)
            }
        }
    }
}

extension BinaryTreeB: RandomElement {
    func randomElement() -> Element? {
        let positionToStop = Int.random(in: 0..<count)
        return randomElement(node: root, index: 0, positionToStop: positionToStop)
    }
    
    private func randomElement(node: Node<Element>?, index: Int, positionToStop: Int) -> Element? {
        guard let node = root else {
            return nil
        }
        
        if index == positionToStop {
            return node.data
        }
        
        if let left = node.left {
            return randomElement(node: left, index: index + 1, positionToStop: positionToStop)
        }
        
        if let right = node.right {
            return randomElement(node: right, index: index + 1, positionToStop: positionToStop)
        }
        
        print("unexpected return")
        return nil
    }
}

private final class Node<T> {
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
