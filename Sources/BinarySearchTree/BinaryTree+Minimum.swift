import BinaryTree
import Tree

public extension BinaryTree where Descendent == BinaryChildren<Element> {
  var min: Tree? {
    guard case let .node(value: _, children) = self else { return nil }
    return children.left.min ?? self
  }
}
