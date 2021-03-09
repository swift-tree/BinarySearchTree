// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "BinarySearchTree",
  products: [
    .library(
      name: "BinarySearchTree",
      targets: ["BinarySearchTree"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/swift-tree/BinaryTree.git", .exact("1.0.0")),
  ],
  targets: [
    .target(
      name: "BinarySearchTree",
      dependencies: ["BinaryTree"]
    ),
    .testTarget(
      name: "BinarySearchTreeTests",
      dependencies: ["BinarySearchTree", "BinaryTree"]
    ),
  ]
)
