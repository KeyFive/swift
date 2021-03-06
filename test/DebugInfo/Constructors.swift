// RUN: %target-swift-frontend %s -emit-ir -g -o - | FileCheck %s
struct Foo {
  // Allocating constructor - should have no line table info.
  // CHECK: !DISubprogram(name: "init", linkageName: "_TFV12Constructors3FooCfT1xVs5Int64_S0_",
  // CHECK-SAME:          line: [[@LINE+3]]
  // CHECK-NOT:           scopeLine: 0
  // CHECK-SAME:          isDefinition: true
  init(x: Int64) {}
  func bar(x: Int64) {}
}

var f = Foo(x: 1)
f.bar(2)
