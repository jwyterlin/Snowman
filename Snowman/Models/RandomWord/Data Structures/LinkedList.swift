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

/// It is the best solution for the list of words
///
/// Insertion is really fast
/// Time Complexity for insertion is O(1)
/// Space Complexity for insertion is O(1)
///
/// Random element is fast as well
/// Time Complexity for iteration in randomElement() is O(n)
/// Space Complexity for iteration in randomElement() is O(1), because it always moves current node's pointer to the next node
///
/// References:
/// https://www.geeksforgeeks.org/insertion-in-linked-list/?ref=lbp
/// https://stackoverflow.com/questions/24007129/how-to-generate-a-random-number-in-swift
///
final class LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    private var count: Int = 0
    
    private var isEmpty: Bool {
        head == nil
    }
    
    func forEach(_ body: (Element) -> Void) {
        var currentNode: Node<Element>? = head
        
        while currentNode != nil {
            if let element = currentNode?.element {
                body(element)
            }
            
            currentNode = currentNode?.next
        }
    }
}

extension LinkedList: AddElement {
    func addElement(_ element: Element) {
        let newNode = Node(element: element)
        
        guard !isEmpty else {
            head = newNode
            tail = newNode
            count += 1
            return
        }
        
        tail?.setNext(newNode)
        tail = newNode
        count += 1
    }
}

extension LinkedList: RandomElement {
    func randomElement() -> Element? {
        let randomPositionToStop = Int.random(in: 0..<count)
        var currentPosition = 0
        var currentNode = head
        
        while currentPosition < randomPositionToStop {
            currentNode = currentNode?.next
            currentPosition += 1
        }
        
        return currentNode?.element
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard !isEmpty else {
            return "Empty list"
        }
        
        var description = ""
        var currentNode = head
        
        while currentNode != nil {
            if let currentNode {
                description.append("\(currentNode.element) -> ")
            }
            
            currentNode = currentNode?.next
            
            if currentNode == nil {
                description.append("nil")
            }
        }
        
        return description
    }
}

private final class Node<Element> {
    let element: Element
    private(set) var next: Node<Element>?
    
    init(element: Element, next: Node<Element>? = nil) {
        self.element = element
        self.next = next
    }
    
    func setNext(_ next: Node<Element>?) {
        self.next = next
    }
}
