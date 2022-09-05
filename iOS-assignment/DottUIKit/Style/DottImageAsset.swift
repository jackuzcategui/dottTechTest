// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum DottImageAsset {
  internal enum Brand {
    internal enum LaunchImage {
      internal static let blueSemiCircle = ImageAsset(name: "brand/launchImage/blueSemiCircle")
      internal static let dott = ImageAsset(name: "brand/launchImage/dott")
      internal static let line = ImageAsset(name: "brand/launchImage/line")
    }
    internal enum Shapes {
      internal static let yellowArc = ImageAsset(name: "brand/shapes/yellowArc")
      internal static let yellowCorner = ImageAsset(name: "brand/shapes/yellowCorner")
      internal static let yellowHalfCircle = ImageAsset(name: "brand/shapes/yellowHalfCircle")
    }
  }
  internal enum Icon {
    internal static let blueRedScooter = ImageAsset(name: "icon/blueRedScooter")
    internal static let checkmark = ImageAsset(name: "icon/checkmark")
    internal static let cross = ImageAsset(name: "icon/cross")
    internal static let pinkYellowScooter = ImageAsset(name: "icon/pinkYellowScooter")
    internal static let redGreenScooter = ImageAsset(name: "icon/redGreenScooter")
    internal static let scooter = ImageAsset(name: "icon/scooter")
    internal static let yellowBlueScooter = ImageAsset(name: "icon/yellowBlueScooter")
  }
  internal enum Scooter {
    internal static let blueRed = ImageAsset(name: "scooter/blueRed")
    internal static let blueYellow = ImageAsset(name: "scooter/blueYellow")
    internal static let pinkYellow = ImageAsset(name: "scooter/pinkYellow")
    internal static let redGreen = ImageAsset(name: "scooter/redGreen")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
