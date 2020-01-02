// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: NonMaximumSuppression.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright (c) 2018, Apple Inc. All rights reserved.
//
// Use of this source code is governed by a BSD-3-clause license that can be
// found in LICENSE.txt or at https://opensource.org/licenses/BSD-3-Clause

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

///
/// Non-maximum suppression of axis-aligned bounding boxes.
///
/// This is used primarily for object detectors that tend to produce multiple
/// boxes around a single object.  This is a byproduct of the detector's
/// robustness to spatial translation. If there are two or more bounding boxes
/// that are very similar to one another, the algorithm should return only a
/// single representative.
///
/// Similarity between two bounding boxes is measured by intersection-over-union
/// (IOU), the fraction between the area of intersection and area of the union.
/// Here is an example where the areas can be calculated by hand by counting glyphs::
///
///     +-------+                            +-------+
///     |       |                            |       |
///     |    +------+          +--+          |       +---+
///     |    |  |   |          |  |          |           |
///     +-------+   |          +--+          +----+      |
///          |      |                             |      |
///          +------+                             +------+
///                        Intersection         Union
///      IOU: 0.16      =       12       /       73
///
/// All IOU scores are fractions betwen 0.0 (fully disjoint) and 1.0 (perfect
/// overlap). The standard algorithm (PickTop) is defined as follows:
///
///  1. Sort boxes by descending order of confidence
///  2. Take the top one and mark it as keep
///  3. Suppress (mark it as discard) all boxes within a fixed IOU radius of the
///     keep box
///  4. Go to 2 and repeat on the subset of boxes not already kept or discarded
///  5. When all boxes are processed, output only the ones marked as keep
///
/// Before the algorithm, boxes that fall below the confidence threshold are
/// discarded.
struct CoreML_Specification_NonMaximumSuppression {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///
  /// Choose which underlying suppression method to use
  var suppressionMethod: OneOf_SuppressionMethod? {
    get {return _storage._suppressionMethod}
    set {_uniqueStorage()._suppressionMethod = newValue}
  }

  var pickTop: CoreML_Specification_NonMaximumSuppression.PickTop {
    get {
      if case .pickTop(let v)? = _storage._suppressionMethod {return v}
      return CoreML_Specification_NonMaximumSuppression.PickTop()
    }
    set {_uniqueStorage()._suppressionMethod = .pickTop(newValue)}
  }

  ///
  /// Optional class label mapping.
  var classLabels: OneOf_ClassLabels? {
    get {return _storage._classLabels}
    set {_uniqueStorage()._classLabels = newValue}
  }

  var stringClassLabels: CoreML_Specification_StringVector {
    get {
      if case .stringClassLabels(let v)? = _storage._classLabels {return v}
      return CoreML_Specification_StringVector()
    }
    set {_uniqueStorage()._classLabels = .stringClassLabels(newValue)}
  }

  var int64ClassLabels: CoreML_Specification_Int64Vector {
    get {
      if case .int64ClassLabels(let v)? = _storage._classLabels {return v}
      return CoreML_Specification_Int64Vector()
    }
    set {_uniqueStorage()._classLabels = .int64ClassLabels(newValue)}
  }

  ///
  /// This defines the radius of suppression. A box is considered to be within
  /// the radius of another box if their IOU score is less than this value.
  var iouThreshold: Double {
    get {return _storage._iouThreshold}
    set {_uniqueStorage()._iouThreshold = newValue}
  }

  ///
  /// Remove bounding boxes below this threshold.  The algorithm run-time is
  /// proportional to the square of the number of incoming bounding boxes
  /// (O(N^2)). This threshold is a way to reduce N to make the algorithm
  /// faster. The confidence threshold can be any non-negative value. Negative
  /// confidences are not allowed, since if the output shape is specified to be
  /// larger than boxes after suppression, the unused boxes are filled with
  /// zero confidence. If the prediction is handled by Core Vision, it is also
  /// important that confidences are defined with the following semantics:
  /// 
  ///   1. Confidences should be between 0 and 1
  ///   2. The sum of the confidences for a prediction should not exceed 1, but is
  ///      allowed to be less than 1
  ///   3. The sum of the confidences will be interpreted as the confidence of
  ///      any object (e.g. if the confidences for two classes are 0.2 and 0.4,
  ///it means there is a 60% (0.2 + 0.4) confidence that an object is
  ///present)
  var confidenceThreshold: Double {
    get {return _storage._confidenceThreshold}
    set {_uniqueStorage()._confidenceThreshold = newValue}
  }

  ///
  /// Set the name of the confidence input.
  ///
  /// The input should be a multi-array of type double and shape N x C. N is
  /// the number of boxes and C the number of classes. Each row describes the
  /// confidences of each object category being present at that particular
  /// location. Confidences should be nonnegative, where 0.0 means the highest
  /// certainty the object is not present.
  ///
  /// Specifying shape is optional.
  var confidenceInputFeatureName: String {
    get {return _storage._confidenceInputFeatureName}
    set {_uniqueStorage()._confidenceInputFeatureName = newValue}
  }

  ///
  /// Set the name of the coordinates input.
  ///
  /// The input should be a multi-array of type double and shape N x 4. The
  /// rows correspond to the rows of the confidence matrix. The four values
  /// describe (in order):
  ///
  ///  - x (center location of the box along the horizontal axis)
  ///  - y (center location of the box along the vertical axis)
  ///  - width (size of box along the horizontal axis)
  ///  - height (size of box on along the vertical axis)
  ///
  /// Specifying shape is optional.
  var coordinatesInputFeatureName: String {
    get {return _storage._coordinatesInputFeatureName}
    set {_uniqueStorage()._coordinatesInputFeatureName = newValue}
  }

  ///
  /// The iouThreshold can be optionally overridden by specifying this string
  /// and providing a corresponding input of type double. This allows changing
  /// the value of the parameter during run-time.
  ///
  /// The input should be a scalar double between 0.0 and 1.0. Setting it to 1.0
  /// means there will be no suppression based on IOU.
  var iouThresholdInputFeatureName: String {
    get {return _storage._iouThresholdInputFeatureName}
    set {_uniqueStorage()._iouThresholdInputFeatureName = newValue}
  }

  ///
  /// The confidenceThreshold can be optionally overridden by specifying this
  /// string and providing a corresponding input. This allows changing the
  /// value of the parameter during run-time, which can aid setting it just
  /// right for a particular use case.
  ///
  /// The input should be a scalar double with nonnegative value.
  var confidenceThresholdInputFeatureName: String {
    get {return _storage._confidenceThresholdInputFeatureName}
    set {_uniqueStorage()._confidenceThresholdInputFeatureName = newValue}
  }

  ///
  /// Set the name of the confidence output. The output will be the same type
  /// and shape as the corresponding input. The only difference is that the
  /// number of rows may have been reduced.
  ///
  /// Specifying shape is optional. One reason to specify shape is to limit
  /// the number of output boxes. This can be done is several ways:
  ///
  /// Fixed shape:
  /// The output can be pinned to a fixed set of boxes. If this number is larger
  /// than the number of boxes that would have been returned, the output is padded
  /// with zeros for both confidence and coordinates. Specifying a fixed shape
  /// can be done by setting either shape (deprecated) or allowedShapes set to
  /// fixedsize.
  ///
  /// Min/max:
  /// It is also possible to set both a minimum and a maximum. The same zero-padding
  /// as for fixed shape is applied when necessary. Setting min/max is done by defining
  /// two allowedShapes, where the first dimension uses a rangeofsizes defining lowerbound
  /// and upperbound.
  var confidenceOutputFeatureName: String {
    get {return _storage._confidenceOutputFeatureName}
    set {_uniqueStorage()._confidenceOutputFeatureName = newValue}
  }

  ///
  /// Set the name of the coordinates output. The output will be the same type
  /// and shape as the corresponding input. The only difference is that the
  /// number of rows may have been reduced.
  ///
  /// Specifying shape is optional. See confidence output for a more detailed
  /// description. Note that to achieve either fixed shape output or a
  /// constraint range of boxes, only one of confidence or coordinates need to
  /// set a shape. Both shapes are allowed to be defined, but in such case they
  /// have to be consistent along dimension 0.
  var coordinatesOutputFeatureName: String {
    get {return _storage._coordinatesOutputFeatureName}
    set {_uniqueStorage()._coordinatesOutputFeatureName = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  ///
  /// Choose which underlying suppression method to use
  enum OneOf_SuppressionMethod: Equatable {
    case pickTop(CoreML_Specification_NonMaximumSuppression.PickTop)

  #if !swift(>=4.1)
    static func ==(lhs: CoreML_Specification_NonMaximumSuppression.OneOf_SuppressionMethod, rhs: CoreML_Specification_NonMaximumSuppression.OneOf_SuppressionMethod) -> Bool {
      switch (lhs, rhs) {
      case (.pickTop(let l), .pickTop(let r)): return l == r
      }
    }
  #endif
  }

  ///
  /// Optional class label mapping.
  enum OneOf_ClassLabels: Equatable {
    case stringClassLabels(CoreML_Specification_StringVector)
    case int64ClassLabels(CoreML_Specification_Int64Vector)

  #if !swift(>=4.1)
    static func ==(lhs: CoreML_Specification_NonMaximumSuppression.OneOf_ClassLabels, rhs: CoreML_Specification_NonMaximumSuppression.OneOf_ClassLabels) -> Bool {
      switch (lhs, rhs) {
      case (.stringClassLabels(let l), .stringClassLabels(let r)): return l == r
      case (.int64ClassLabels(let l), .int64ClassLabels(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  ///
  /// Pick the bounding box of the top confidence, suppress all within a radius.
  struct PickTop {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    ///
    /// Suppression is only done among predictions with the same label
    /// (argmax of the confidence).
    var perClass: Bool = false

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "CoreML.Specification"

extension CoreML_Specification_NonMaximumSuppression: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".NonMaximumSuppression"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "pickTop"),
    100: .same(proto: "stringClassLabels"),
    101: .same(proto: "int64ClassLabels"),
    110: .same(proto: "iouThreshold"),
    111: .same(proto: "confidenceThreshold"),
    200: .same(proto: "confidenceInputFeatureName"),
    201: .same(proto: "coordinatesInputFeatureName"),
    202: .same(proto: "iouThresholdInputFeatureName"),
    203: .same(proto: "confidenceThresholdInputFeatureName"),
    210: .same(proto: "confidenceOutputFeatureName"),
    211: .same(proto: "coordinatesOutputFeatureName"),
  ]

  fileprivate class _StorageClass {
    var _suppressionMethod: CoreML_Specification_NonMaximumSuppression.OneOf_SuppressionMethod?
    var _classLabels: CoreML_Specification_NonMaximumSuppression.OneOf_ClassLabels?
    var _iouThreshold: Double = 0
    var _confidenceThreshold: Double = 0
    var _confidenceInputFeatureName: String = String()
    var _coordinatesInputFeatureName: String = String()
    var _iouThresholdInputFeatureName: String = String()
    var _confidenceThresholdInputFeatureName: String = String()
    var _confidenceOutputFeatureName: String = String()
    var _coordinatesOutputFeatureName: String = String()

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _suppressionMethod = source._suppressionMethod
      _classLabels = source._classLabels
      _iouThreshold = source._iouThreshold
      _confidenceThreshold = source._confidenceThreshold
      _confidenceInputFeatureName = source._confidenceInputFeatureName
      _coordinatesInputFeatureName = source._coordinatesInputFeatureName
      _iouThresholdInputFeatureName = source._iouThresholdInputFeatureName
      _confidenceThresholdInputFeatureName = source._confidenceThresholdInputFeatureName
      _confidenceOutputFeatureName = source._confidenceOutputFeatureName
      _coordinatesOutputFeatureName = source._coordinatesOutputFeatureName
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1:
          var v: CoreML_Specification_NonMaximumSuppression.PickTop?
          if let current = _storage._suppressionMethod {
            try decoder.handleConflictingOneOf()
            if case .pickTop(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._suppressionMethod = .pickTop(v)}
        case 100:
          var v: CoreML_Specification_StringVector?
          if let current = _storage._classLabels {
            try decoder.handleConflictingOneOf()
            if case .stringClassLabels(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._classLabels = .stringClassLabels(v)}
        case 101:
          var v: CoreML_Specification_Int64Vector?
          if let current = _storage._classLabels {
            try decoder.handleConflictingOneOf()
            if case .int64ClassLabels(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._classLabels = .int64ClassLabels(v)}
        case 110: try decoder.decodeSingularDoubleField(value: &_storage._iouThreshold)
        case 111: try decoder.decodeSingularDoubleField(value: &_storage._confidenceThreshold)
        case 200: try decoder.decodeSingularStringField(value: &_storage._confidenceInputFeatureName)
        case 201: try decoder.decodeSingularStringField(value: &_storage._coordinatesInputFeatureName)
        case 202: try decoder.decodeSingularStringField(value: &_storage._iouThresholdInputFeatureName)
        case 203: try decoder.decodeSingularStringField(value: &_storage._confidenceThresholdInputFeatureName)
        case 210: try decoder.decodeSingularStringField(value: &_storage._confidenceOutputFeatureName)
        case 211: try decoder.decodeSingularStringField(value: &_storage._coordinatesOutputFeatureName)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if case .pickTop(let v)? = _storage._suppressionMethod {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      switch _storage._classLabels {
      case .stringClassLabels(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 100)
      case .int64ClassLabels(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 101)
      case nil: break
      }
      if _storage._iouThreshold != 0 {
        try visitor.visitSingularDoubleField(value: _storage._iouThreshold, fieldNumber: 110)
      }
      if _storage._confidenceThreshold != 0 {
        try visitor.visitSingularDoubleField(value: _storage._confidenceThreshold, fieldNumber: 111)
      }
      if !_storage._confidenceInputFeatureName.isEmpty {
        try visitor.visitSingularStringField(value: _storage._confidenceInputFeatureName, fieldNumber: 200)
      }
      if !_storage._coordinatesInputFeatureName.isEmpty {
        try visitor.visitSingularStringField(value: _storage._coordinatesInputFeatureName, fieldNumber: 201)
      }
      if !_storage._iouThresholdInputFeatureName.isEmpty {
        try visitor.visitSingularStringField(value: _storage._iouThresholdInputFeatureName, fieldNumber: 202)
      }
      if !_storage._confidenceThresholdInputFeatureName.isEmpty {
        try visitor.visitSingularStringField(value: _storage._confidenceThresholdInputFeatureName, fieldNumber: 203)
      }
      if !_storage._confidenceOutputFeatureName.isEmpty {
        try visitor.visitSingularStringField(value: _storage._confidenceOutputFeatureName, fieldNumber: 210)
      }
      if !_storage._coordinatesOutputFeatureName.isEmpty {
        try visitor.visitSingularStringField(value: _storage._coordinatesOutputFeatureName, fieldNumber: 211)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: CoreML_Specification_NonMaximumSuppression, rhs: CoreML_Specification_NonMaximumSuppression) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._suppressionMethod != rhs_storage._suppressionMethod {return false}
        if _storage._classLabels != rhs_storage._classLabels {return false}
        if _storage._iouThreshold != rhs_storage._iouThreshold {return false}
        if _storage._confidenceThreshold != rhs_storage._confidenceThreshold {return false}
        if _storage._confidenceInputFeatureName != rhs_storage._confidenceInputFeatureName {return false}
        if _storage._coordinatesInputFeatureName != rhs_storage._coordinatesInputFeatureName {return false}
        if _storage._iouThresholdInputFeatureName != rhs_storage._iouThresholdInputFeatureName {return false}
        if _storage._confidenceThresholdInputFeatureName != rhs_storage._confidenceThresholdInputFeatureName {return false}
        if _storage._confidenceOutputFeatureName != rhs_storage._confidenceOutputFeatureName {return false}
        if _storage._coordinatesOutputFeatureName != rhs_storage._coordinatesOutputFeatureName {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension CoreML_Specification_NonMaximumSuppression.PickTop: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = CoreML_Specification_NonMaximumSuppression.protoMessageName + ".PickTop"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "perClass"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self.perClass)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.perClass != false {
      try visitor.visitSingularBoolField(value: self.perClass, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: CoreML_Specification_NonMaximumSuppression.PickTop, rhs: CoreML_Specification_NonMaximumSuppression.PickTop) -> Bool {
    if lhs.perClass != rhs.perClass {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}