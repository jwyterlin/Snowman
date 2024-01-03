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
import Darwin.C

///
/// Incomplete implementation
///  Because all of examples I found used a list of integer numbers
///  But I found here one approximate solution:
///  https://github.com/haveahennessy/Patrician/blob/master/Patrician/Node.swift
///
///  References:
///  https://www.geeksforgeeks.org/radix-sort/
///  https://www.kodeco.com/51-data-structures-and-algorithms-in-swift-radix-sort
///  https://en.wikipedia.org/wiki/Radix_tree
///  https://victorqi.gitbooks.io/swift-algorithm/content/radix_tree.html
///  https://www.quora.com/What-is-the-fastest-way-to-sort-a-list-of-words-in-computer-science
///  https://stackoverflow.com/questions/50950092/calculating-the-difference-between-two-dates-in-swift
///  https://developer.apple.com/documentation/swift/string/max(_:_:)
///  https://stackoverflow.com/questions/36891147/swift-best-practice-to-find-the-longest-string-at-string-array
///
struct RadixSort {
    
    private let minWordLength: Int
    private let maxWordLength: Int
    private let useProperNouns: Bool
    
    func getRandomWord() -> String {
        guard
            let url = Bundle.main.url(forResource: "words", withExtension: "txt"),
            let wordsList = try? String(contentsOf: url)
        else {
            return "SNOWMAN"
        }
        
        let startDate = Date()
        print("start date: \(startDate)")
        let words = radixSort(words: wordsList.components(separatedBy: .newlines))
        
        ///
        /// Filter words here
        ///
        
        let endDate = Date()
        print("end date: \(endDate)")
        print("elapsed time: \(endDate - startDate)")
        
        let word = words.randomElement() ?? "SNOWMAN"
        
        print(word)
        return word.uppercased()
    }
    
    private func isFiltered(_ word: String) -> Bool {
        guard word.count >= minWordLength && word.count <= maxWordLength else {
            return false
        }
        
        return isUsingProperNouns(word)
    }
    
    private func isUsingProperNouns(_ word: String) -> Bool {
        if useProperNouns {
            return true
        }
        let firstLetter = word[word.startIndex]
        return !firstLetter.isUppercase
    }
    
    // Attempt #1
    //    func radixSort(words: [String]) -> [String] {
    //        let base = 26
    //        /// A flag that determines whether the sort is complete
    //        var done = false
    //        /// Keeps track of the current digit you’re looking at
    //        var digits = 1
    //
    //        while !done {
    //            /// You instantiate the buckets using a two-dimensional array.
    //            /// Because you’re using base 26, you need 26 buckets.
    //            var buckets: [[String]] = .init(repeating: [], count: base)
    //
    //            /// You place each number in the correct bucket.
    //            words.forEach { word in
    //              let remainingPart = word / digits // I'm using String, not Int. Where do I go from here?
    //              let digit = remainingPart % base
    //              buckets[digit].append(number)
    //            }
    //            // 3
    //            digits *= base
    //            return buckets.flatMap { $0 }
    //        }
    //    }
    
    // Attempt #2
    //    private let words: [String]
    //    private let base = 26 // number of letters of the alphabet
    
    init(
        //        words: [String],
        minWordLength: Int,
        maxWordLength: Int,
        useProperNouns: Bool
    ) {
        //        self.words = words
        self.minWordLength = minWordLength
        self.maxWordLength = maxWordLength
        self.useProperNouns = useProperNouns
    }
    
    func radixSort(words: [String]) -> [String] {
        //        let maxLength = lengthOfBiggestWord(words)
        //        var currentDigit = 1
        //
        //        while maxLength / currentDigit > 0 {
        //            countSort(digit: currentDigit, words: words)
        //            currentDigit *= base
        //        }
        return []
    }
    //
    //    private func lengthOfBiggestWord(words: [String]) -> Int {
    //        guard let biggestWord = words.max(by: { return $0.count < $1.count }) else {
    //            return 0
    //        }
    //
    //        return biggestWord.count
    //    }
    
    //    private func countSort(digit: Int, words: [String]) {
    //        let output: [Int] = Array(repeating: "", count: words.count)
    //        let i = 0
    //        let countOfOccurrences: [Int] = Array(repeating: 0, count: base)
    //        for i in 0..<words.count {
    //            countOfOccurrences[(words[i] / digit) % base] += 1
    //        }
    //    }
}
