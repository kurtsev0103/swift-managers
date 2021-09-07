//  ************************  //
//  StorageHelpers.swift      //
//  ------------------------  //
//         Created by         //
//     Oleksandr Kurtsev      //
//  ------------------------  //
//   github:    kurtsev0103   //
//   linkedin:  kurtsev0103   //
//   facebook:  kurtsev0103   //
//  ------------------------  //
//      Copyright © 2021      //
//  ************************  //

import UIKit

extension UIImage {
    
    var scaleToSafeUploadSize: UIImage? {
        let maxImageSideLenght: CGFloat = 480
        let largerSide: CGFloat = max(size.width, size.height)
        let ratioScale: CGFloat = largerSide > maxImageSideLenght ? largerSide / maxImageSideLenght : 1
        let newImageSize = CGSize(width: size.width / ratioScale, height: size.height / ratioScale)
        return image(scaledTo: newImageSize)
    }
    
    func image(scaledTo size: CGSize) -> UIImage? {
        defer { UIGraphicsEndImageContext() }
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
