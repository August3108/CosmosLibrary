//
//  CoreGraphics.swift
//  Cosmos Library
//
//  Created by Rahul Jha on 08/11/24.
//

import Foundation
import SwiftUI

struct CoreGraphicsPreview: View {
    var body: some View {
        VStack {
            // Example 1: Vector-based Scalable and Resolution-Independent Graphics
            // A vector-based star is defined by its mathematical equations, not pixels
            StarView()
                .frame(width: 100, height: 100) // The star scales without losing quality
                .padding()

            // Example 2: Rendering Context and Paths
            // A path is created to define the shape of a circle, drawn on a rendering context
            CircleView()
                .frame(width: 150, height: 150)
                .padding()

            // Example 3: Transformations
            // Applying scaling, rotation, and translation to a square
            TransformedSquareView()
                .frame(width: 100, height: 100)
                .padding()

            // Example 4: Clipping
            // A square with a circular clip, showing only the part inside the circle
            ClippedSquareView()
                .frame(width: 100, height: 100)
                .padding()

            // Example 5: Masking
            // A masked image, where a heart shape mask is applied
            MaskedImageView()
                .frame(width: 100, height: 100)
                .padding()

            // Example 6: Image Manipulation
            // Resizing, cropping, and applying a blur filter to an image
            ImageManipulationView()
                .frame(width: 150, height: 150)
                .padding()
        }
    }
}

// MARK: - Example Views

// 1. Vector-based Star
struct StarView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear

        // Create a path to define a star
        let path = UIBezierPath()
        let center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        let outerRadius: CGFloat = 30
        let innerRadius: CGFloat = 15
        let points = 5
        
        for i in 0..<points {
            let angle = CGFloat(i) * 2 * CGFloat.pi / CGFloat(points) - CGFloat.pi / 2
            let x = center.x + outerRadius * cos(angle)
            let y = center.y + outerRadius * sin(angle)
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            let angle2 = CGFloat(i) * 2 * CGFloat.pi / CGFloat(points) - CGFloat.pi / 2 + CGFloat.pi / CGFloat(points)
            let x2 = center.x + innerRadius * cos(angle2)
            let y2 = center.y + innerRadius * sin(angle2)
            path.addLine(to: CGPoint(x: x2, y: y2))
        }
        path.close()

        // Create a shape layer to render the path
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.yellow.cgColor
        view.layer.addSublayer(shapeLayer)

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

// 2. Rendering Context and Paths: Circle
struct CircleView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear

        // Create a path to define a circle
        let path = UIBezierPath(ovalIn: view.bounds)
        
        // Create a shape layer to render the path
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.blue.cgColor
        view.layer.addSublayer(shapeLayer)

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

// 3. Transformations: Square
struct TransformedSquareView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear

        // Create a path for a square
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        // Create a shape layer to render the path
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.green.cgColor
        view.layer.addSublayer(shapeLayer)

        // Apply transformations (scale, rotate, translate)
        shapeLayer.transform = CATransform3DMakeScale(1.5, 1.5, 1) // Scale
        shapeLayer.transform = CATransform3DRotate(shapeLayer.transform, CGFloat.pi / 4, 0, 0, 1) // Rotate
        shapeLayer.transform = CATransform3DTranslate(shapeLayer.transform, 20, 20, 0) // Translate

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

// 4. Clipping: Square with Circular Clip
struct ClippedSquareView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear

        // Create a path for a square
        let squarePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        // Create a shape layer to render the square
        let squareLayer = CAShapeLayer()
        squareLayer.path = squarePath.cgPath
        squareLayer.fillColor = UIColor.red.cgColor
        view.layer.addSublayer(squareLayer)

        // Create a circular clip path
        let circlePath = UIBezierPath(ovalIn: view.bounds)
        
        // Apply the circular clip to the square layer
        squareLayer.mask = CAShapeLayer()
//        squareLayer.mask?.path = circlePath.cgPath

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

// 5. Masking: Masked Image
struct MaskedImageView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear

        // Load an image
        let image = UIImage(named: "your_image_name")!
        
        // Create an image view
        let imageView = UIImageView(image: image)
        imageView.frame = view.bounds
        view.addSubview(imageView)

        // Create a mask path (heart shape)
        let maskPath = UIBezierPath()
        maskPath.move(to: CGPoint(x: view.frame.width / 2, y: 0))
        maskPath.addCurve(to: CGPoint(x: view.frame.width, y: view.frame.height / 2), controlPoint1: CGPoint(x: view.frame.width / 2, y: 0), controlPoint2: CGPoint(x: view.frame.width, y: view.frame.height / 4))
        maskPath.addCurve(to: CGPoint(x: view.frame.width / 2, y: view.frame.height), controlPoint1: CGPoint(x: view.frame.width, y: view.frame.height * 3 / 4), controlPoint2: CGPoint(x: view.frame.width / 2, y: view.frame.height))
        maskPath.addCurve(to: CGPoint(x: 0, y: view.frame.height / 2), controlPoint1: CGPoint(x: view.frame.width / 2, y: view.frame.height), controlPoint2: CGPoint(x: 0, y: view.frame.height * 3 / 4))
        maskPath.addCurve(to: CGPoint(x: view.frame.width / 2, y: 0), controlPoint1: CGPoint(x: 0, y: view.frame.height / 4), controlPoint2: CGPoint(x: view.frame.width / 2, y: 0))
        maskPath.close()
        
        // Apply the mask to the image view
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        imageView.layer.mask = maskLayer

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

// 6. Image Manipulation
struct ImageManipulationView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear

        // Load an image
        let image = UIImage(named: "your_image_name")!
        
        // Create an image view
        let imageView = UIImageView()
        imageView.frame = view.bounds
        view.addSubview(imageView)

        // Image manipulation: resize, crop, blur
        let newSize = CGSize(width: 50, height: 50) // New size
        let resizedImage = image.resizeImage(targetSize: newSize)!

        // Crop (you can define a crop rect)
        let cropRect = CGRect(x: 10, y: 10, width: 30, height: 30)
        let croppedImage = resizedImage.cropImage(toRect: cropRect)!

        // Blur
        let blurEffect = CIFilter(name: "CIGaussianBlur", parameters: ["inputRadius": 10])!
        let blurredImage = blurEffect.outputImage!.cgImage!

        imageView.image = UIImage(cgImage: blurredImage)

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

// MARK: - Helper Extensions for Image Manipulation

extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage? {
        let size = self.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Calculate the aspect ratio
        let aspectRatio = min(widthRatio, heightRatio)
        
        // Calculate the new size based on the aspect ratio
        let newSize = CGSize(width: size.width * aspectRatio, height: size.height * aspectRatio)
        
        // Create a drawing context
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        
        // Draw the image into the context
        self.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        
        // Get the new image from the context
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func cropImage(toRect rect: CGRect) -> UIImage? {
        // Create a new context with the specified crop rect
        guard let imageRef = self.cgImage else { return nil }
        let croppedImageRef = imageRef.cropping(to: rect)
        
        // Create a new image from the cropped image ref
        return UIImage(cgImage: croppedImageRef!)
    }
}

#Preview {
    CoreGraphicsPreview()
}
