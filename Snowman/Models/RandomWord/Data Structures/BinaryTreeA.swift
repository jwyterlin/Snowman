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
///  https://www.geeksforgeeks.org/complexity-different-operations-binary-tree-binary-search-tree-avl-tree/
///  https://medium.com/swlh/data-structures-algorithms-in-swift-part-3-binary-tree-2de778058d12
///  https://www.geeksforgeeks.org/select-random-node-tree-equal-probability/
///  https://stackoverflow.com/questions/24007129/how-to-generate-a-random-number-in-swift
///
enum BinaryTreeA<Element: Comparable> {
    case empty
    indirect case node(BinaryTreeA, Element, BinaryTreeA)
    
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    mutating func naiveInsert(newValue: Element) {
        guard case .node(var left, let value, var right) = self else {
            self = .node(.empty, newValue, .empty)
            return
        }
        
        if newValue < value {
            left.naiveInsert(newValue: newValue)
        } else {
            right.naiveInsert(newValue: newValue)
        }
    }
    
    func traverseInOrder(process: (Element) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    func traversePreOrder(process: (Element) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    func traversePostOrder(process: (Element) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
    
    func search(searchValue: Element) -> BinaryTreeA? {
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            if searchValue == value {
                return self
            }
            
            if searchValue < value {
                return left.search(searchValue: searchValue)
            } else {
                return right.search(searchValue: searchValue)
            }
        }
    }
}

extension BinaryTreeA: AddElement {
    mutating func addElement(_ element: Element) {
        self = newTreeWithInsertedValue(newValue: element)
    }
    
    private func newTreeWithInsertedValue(newValue: Element) -> BinaryTreeA {
        switch self {
        case .empty:
            return .node(.empty, newValue, .empty)
        case let .node(left, value, right):
            if newValue < value {
                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
            } else {
                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
            }
        }
    }
}

extension BinaryTreeA: RandomElement {
    func randomElement() -> Element? {
        let positionToStop = Int.random(in: 0..<count)
        return randomElement(count: positionToStop)
    }
    
    private func randomElement(count: Int) -> Element? {
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            if count == left.count {
                return value
            }
            
            if count < left.count {
                return left.randomElement(count: count)
            }
            
            return right.randomElement(count: count - left.count - 1)
        }
    }
}

extension BinaryTreeA: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
        case .empty:
            return ""
        }
    }
}

extension String {
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.count < rhs.count
    }
}
