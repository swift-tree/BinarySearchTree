import XCTest

#if !canImport(ObjectiveC)
  public func allTests() -> [XCTestCaseEntry] {
    [
      testCase(BinarySearchTreeTests.allTests),
    ]
  }
#endif
