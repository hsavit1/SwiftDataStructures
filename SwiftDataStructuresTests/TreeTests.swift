import XCTest
import Foundation
@testable import SwiftDataStructures

class TreeTests: XCTestCase {
  
  func testEmptyInit() {
    
    let empty = Tree<Int>()
    
    XCTAssert(empty.isEmpty)
    
    XCTAssert(empty.isBalanced)
    
  }
  
  func testSeqInit() {
    
    let seq = (0...100).map { _ in arc4random_uniform(100) }
    
    let set = Set(seq)
    
    let tree = Tree(seq)
    
    let setFromTree = Set(tree)
    
    XCTAssertEqual(set, setFromTree)
    
    XCTAssert(tree.isBalanced)
    
  }
  
  func testArrayLiteralInit() {
    
    let tree: Tree = [1, 3, 5, 6, 7, 8, 9]
    
    XCTAssert(tree.elementsEqual([1, 3, 5, 6, 7, 8, 9]))
    
    XCTAssert(tree.isBalanced)
    
  }
  
  func testDebugDescription() {
    
    let seq = (0...100).map { _ in arc4random_uniform(100) }
    
    let arr = Set(seq).sort()
    
    let tre = Tree(seq)
    
    XCTAssertEqual(arr.debugDescription, tre.debugDescription)
    
    XCTAssert(tre.isBalanced)
    
  }
  
  func testFirst() {
    
    let seq = (0...100).map { _ in arc4random_uniform(100) }
    
    let set = Set(seq)
    
    let tre = Tree(seq)
    
    XCTAssertEqual(set.minElement(), tre.first)
    
    XCTAssert(tre.isBalanced)
    
  }
  
  func testLast() {
    
    let seq = (0...100).map { _ in arc4random_uniform(100) }
    
    let set = Set(seq)
    
    let tre = Tree(seq)
    
    XCTAssertEqual(set.maxElement(), tre.last)
    
    XCTAssert(tre.isBalanced)
    
  }
  
  func testIsEmpty() {
    
    let seq = (0...10).map { _ in arc4random_uniform(100) }
    
    XCTAssertFalse(Tree(seq).isEmpty)
    
    XCTAssert(Tree(seq).isBalanced)
    
  }
  
  func testCount() {
    
    let seq = (0...1000).map { _ in arc4random_uniform(100) }
    
    let tre = Tree(seq)
    
    XCTAssertEqual(Set(seq).count, tre.count)
    
    XCTAssert(tre.isBalanced)
    
  }
  
  func testContains() {
    
    let seq = (0...100).map { _ in Int(arc4random_uniform(100)) }
    
    let set = Set(seq)
    
    let tre = Tree(seq)
    
    for i in 0...110 {
      XCTAssertEqual(set.contains(i), tre.contains(i))
      
      XCTAssert(tre.isBalanced)
    }
  }
  
  func testRemoveMin() {
    
    let seq = (0...100).map { _ in Int(arc4random_uniform(100)) }
    
    var set = Set(seq)
    
    var tre = Tree(seq)
    
    for _ in 0...110 {
      XCTAssertEqual(set.minElement().flatMap { set.remove($0) }, tre.removeMin())
      
      XCTAssert(tre.isBalanced)
    }
  }
  
  func testRemoveMax() {
    
    let seq = (0...100).map { _ in Int(arc4random_uniform(100)) }
    
    var set = Set(seq)
    
    var tre = Tree(seq)
    
    for _ in 0...110 {
      
      XCTAssertEqual(set.maxElement().flatMap { set.remove($0) }, tre.removeMax())
      
      XCTAssert(tre.isBalanced)
    }
  }
  
  func testRemove() {
    
    let seq = (0...100).map { _ in arc4random_uniform(100) }
    
    var set = Set(seq)
    
    var tre = Tree(seq)
    
    for _ in 0...10000 {
      
      let i = arc4random_uniform(110)
      
      XCTAssertEqual(set.remove(i), tre.remove(i))
      
      XCTAssert(tre.isBalanced)
    }
  }
  
  func testReverse() {
    
    let seq = (0...100).map { _ in Int(arc4random_uniform(100)) }
    
    let sorted = Set(seq).sort(>)
    
    let tree = Tree(seq)
    
    XCTAssert(sorted.elementsEqual(tree.reverse()))
    
  }
}
