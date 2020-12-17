import XCTest
import BinaryTree

final class BinaryTreeTests: XCTestCase {
  var tree: BinaryTree<Int>!
  var initialItems: [Int]!
  var capturedItems: [Int]!
  
  override func setUp() {
    super.setUp()
    
    tree = .empty
    initialItems = [5, 5, 10, 15, 6]
    initialItems.forEach{tree.inserting($0)}

    capturedItems = []
  }
  
  override func tearDown() {
    tree = nil
    initialItems = nil
    capturedItems = nil
    
    super.tearDown()
  }

  func test_init() {
    XCTAssertEqual(tree, tree5_10_6_15)
  }
  
  func test_traversals_preOrder() {
    tree.traverse(method: .preOrder) { [weak self] value, _ in
      self?.capturedItems.append(value)
    }
    
    XCTAssertEqual(capturedItems, [5,10,6,15])
  }
  
  func test_traversals_inOrder() {
    tree.traverse(method: .inOrder) { [weak self] value, _ in
      self?.capturedItems.append(value)
    }

    XCTAssertEqual(capturedItems, [5,6,10,15])
  }

  func test_traversals_postOrder() {
    tree.traverse(method: .postOrder) { [weak self] value, _ in
      self?.capturedItems.append(value)
    }

    XCTAssertEqual(capturedItems, [6,15,10,5])
  }

  func test_height(){
    var tree: BinaryTree<Int> = .empty
    tree.inserting(5)

    XCTAssertEqual(tree.height, 1)

    tree.inserting(10)

    XCTAssertEqual(tree.height, 2)

    tree.inserting(15)

    XCTAssertEqual(tree.height, 3)

    tree.inserting(6)

    XCTAssertEqual(tree.height, 3)
  }

  func test_contains_bool(){
    initialItems.forEach{
      XCTAssertTrue(tree.contains($0))
    }
  }

  func test_search_path(){
    XCTAssertEqual(tree.search(6), [5,10,6])
    XCTAssertEqual(tree.search(1), [])
  }

  func test_contains_other_tree(){
    XCTAssertTrue(tree.contains(tree5_10_6_15))
    XCTAssertTrue(tree5_10_6_15.contains(tree))
    XCTAssertTrue(tree5_10_6_15.contains(tree10_6_15))
    XCTAssertTrue(tree.contains(.empty))
    XCTAssertTrue(BinaryTree<Int>.empty.contains(.empty))
  }

  func test_string_preOrder(){
    var paths = [String]()
    var tree: BinaryTree<String> = .empty
    tree.inserting("abc")
    tree.inserting("bca")
    tree.inserting("acb")
    tree.inserting("ab")
    tree.inserting("ca")

    tree.traverse(method: .preOrder) { _, path in
      paths.append(path.joined(separator: "/"))
    }

    XCTAssertEqual(tree.height, 3)

    XCTAssertEqual(
      paths,
      [
        "abc",
        "abc/ab",
        "abc/bca",
        "abc/bca/acb",
        "abc/bca/ca",
      ]
    )
  }

  private let tree5_10_6_15: BinaryTree<Int> = .node(
    value: 5,
    .init(
      left: .empty,
      right: .node(
        value: 10, .init(
          left: .node(
            value: 6,
            .init(
              left: .empty,
              right: .empty
            )
          ), right: .node(
            value: 15,
            .init(
              left: .empty,
              right: .empty
            )
          )
        )
      )
    )
  )

  private let tree10_6_15: BinaryTree<Int> = .node(
    value: 10, .init(
      left: .node(
        value: 6,
        .init(
          left: .empty,
          right: .empty
        )
      ), right: .node(
        value: 15,
        .init(
          left: .empty,
          right: .empty
        )
      )
    )
  )

  static var allTests = [
    ("test_init", test_init),
    ("test_traversals_preOrder", test_traversals_preOrder),
    ("test_traversals_inOrder", test_traversals_inOrder),
    ("test_traversals_postOrder", test_traversals_postOrder),
    ("test_string_preOrder", test_string_preOrder),
    ("test_contains_other_tree", test_contains_other_tree),
    ("test_contains_bool", test_contains_bool),
    ("test_height", test_height),
  ]
}
