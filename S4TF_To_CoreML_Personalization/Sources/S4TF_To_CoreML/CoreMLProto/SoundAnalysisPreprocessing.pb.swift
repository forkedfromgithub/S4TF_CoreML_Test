// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: SoundAnalysisPreprocessing.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright (c) 2019, Apple Inc. All rights reserved.
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

///*
/// A model which takes audio signal samples as input and outputs an array of
/// preprocessed samples according to the specified preprocessing types
struct CoreML_Specification_CoreMLModels_SoundAnalysisPreprocessing {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Vision feature print type
  var soundAnalysisPreprocessingType: OneOf_SoundAnalysisPreprocessingType? {
    get {return _storage._soundAnalysisPreprocessingType}
    set {_uniqueStorage()._soundAnalysisPreprocessingType = newValue}
  }

  var vggish: CoreML_Specification_CoreMLModels_SoundAnalysisPreprocessing.Vggish {
    get {
      if case .vggish(let v)? = _storage._soundAnalysisPreprocessingType {return v}
      return CoreML_Specification_CoreMLModels_SoundAnalysisPreprocessing.Vggish()
    }
    set {_uniqueStorage()._soundAnalysisPreprocessingType = .vggish(newValue)}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Vision feature print type
  enum OneOf_SoundAnalysisPreprocessingType: Equatable {
    case vggish(CoreML_Specification_CoreMLModels_SoundAnalysisPreprocessing.Vggish)

  #if !swift(>=4.1)
    static func ==(lhs: CoreML_Specification_CoreMLModels_SoundAnalysisPreprocessing.OneOf_SoundAnalysisPreprocessingType, rhs: CoreML_Specification_CoreMLModels_SoundAnalysisPreprocessing.OneOf_SoundAnalysisPreprocessingType) -> Bool {
      switch (lhs, rhs) {
      case (.vggish(let l), .vggish(let r)): return l == r
      }
    }
  #endif
  }

  /// no specific parameter
  struct Vggish {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "CoreML.Specification.CoreMLModels"

extension CoreML_Specification_CoreMLModels_SoundAnalysisPreprocessing: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SoundAnalysisPreprocessing"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    20: .same(proto: "vggish"),
  ]

  fileprivate class _StorageClass {
    var _soundAnalysisPreprocessingType: CoreML_Specification_CoreMLModels_SoundAnalysisPreprocessing.OneOf_SoundAnalysisPreprocessingType?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _soundAnalysisPreprocessingType = source._soundAnalysisPreprocessingType
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
        case 20:
          var v: CoreML_Specification_CoreMLModels_SoundAnalysisPreprocessing.Vggish?
          if let current = _storage._soundAnalysisPreprocessingType {
            try decoder.handleConflictingOneOf()
            if case .vggish(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._soundAnalysisPreprocessingType = .vggish(v)}
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if case .vggish(let v)? = _storage._soundAnalysisPreprocessingType {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 20)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: CoreML_Specification_CoreMLModels_SoundAnalysisPreprocessing, rhs: CoreML_Specification_CoreMLModels_SoundAnalysisPreprocessing) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._soundAnalysisPreprocessingType != rhs_storage._soundAnalysisPreprocessingType {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension CoreML_Specification_CoreMLModels_SoundAnalysisPreprocessing.Vggish: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = CoreML_Specification_CoreMLModels_SoundAnalysisPreprocessing.protoMessageName + ".Vggish"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: CoreML_Specification_CoreMLModels_SoundAnalysisPreprocessing.Vggish, rhs: CoreML_Specification_CoreMLModels_SoundAnalysisPreprocessing.Vggish) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
