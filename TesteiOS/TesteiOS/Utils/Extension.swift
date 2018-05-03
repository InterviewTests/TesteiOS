//
//  Extension.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 30/04/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

// MARK: - JSONCodable
extension JSONCodable where Self: Codable {
    // An encoder and decoder for our convenience methods to use.
    // These are static variables to be used by the types
    // themselves instead of instances.
    static var encoder: JSONEncoder { return JSONEncoder() }
    static var decoder: JSONDecoder { return JSONDecoder() }
    // A convenience method to return instances as JSON Data.
    func jsonData() -> Data? {
        return try? Self.encoder.encode(self)
    }
    // An convenience init method to create instances of our type from JSON Data.
    init?(jsonData: Data?) {
        guard let data = jsonData,
            let anInstance = try? Self.decoder.decode(Self.self, from: data)
            else { return nil }
        self = anInstance
    }
}

// MARK - UIView
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }
        
        get {
            return self.layer.cornerRadius
        }
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

// MARK: - UIImage
extension UIImage {
    class func imageWithColor(color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}

// MARK: - String
extension String {
    func isEmailFormat() -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate  = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
}
