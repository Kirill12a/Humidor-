
#if canImport(UIKit)

import UIKit

extension UIImage {

  @nonobjc public func toByteArrayRGBA() -> [UInt8]?
  {
    return cgImage?.toByteArrayRGBA()
  }


  @nonobjc public class func fromByteArrayRGBA(_ bytes: [UInt8],
                                               width: Int,
                                               height: Int,
                                               scale: CGFloat = 0,
                                               orientation: UIImage.Orientation = .up) -> UIImage?
  {
    if let cgImage = CGImage.fromByteArrayRGBA(bytes, width: width, height: height) {
      return UIImage(cgImage: cgImage, scale: scale, orientation: orientation)
    } else {
      return nil
    }
  }


  @nonobjc public class func fromByteArrayGray(_ bytes: [UInt8],
                                               width: Int,
                                               height: Int,
                                               scale: CGFloat = 0,
                                               orientation: UIImage.Orientation = .up) -> UIImage?
  {
    if let cgImage = CGImage.fromByteArrayGray(bytes, width: width, height: height)
    {
      return UIImage(cgImage: cgImage, scale: scale, orientation: orientation)
    } else {
      return nil
    }
  }
}

#endif
