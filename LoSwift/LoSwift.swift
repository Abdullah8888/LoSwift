//
//  LoSwift.swift
//  LoSwift
//
//  Created by Abdullah on 03/02/2024.
//

import Foundation.NSBundle
import ObjectivePGP
import UIKit

final public class LoSwift: UIViewController {
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        view.backgroundColor = .red
    }
    
    func configureUI() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
       // imageView.image = UIImage(named: "your_image_name") // Replace with your image name
//        print("asdf is \(Bundle.main.bundlePath)")
//        let frameworkBundlePath = Bundle.main.path(forResource: "LoSwift/Resources/MyImages", ofType: "bundle")
//        let frameworkBundle = Bundle(path: "/Users/abdullah/Documents/my_apps/LoSwift/LoSwift/Resources/MyImages.bundle/")
//        print("asdf is \(frameworkBundle?.bundlePath)")
//        //let frameworkBundle = Bundle.init(path: frameworkBundlePath!)
//
//        print("lala is \(YourFrameworkClass.bundle)")
        // Load the image from the framework bundle
        if let image = UIImage(named: "icons8-phone-100-v2", in: BundleHelper.resolvedBundle, compatibleWith: nil) {
            imageView.image = image
        }
        // Add the UIImageView to the view hierarchy
        imageView.backgroundColor = .green
        view.addSubview(imageView)
        
        // Set up Auto Layout constraints to center the UIImageView
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100), // Set your desired width
            imageView.heightAnchor.constraint(equalToConstant: 100) // Set your desired height
        ])
    }
}

//import class Foundation.Bundle
//private class BundleFinder {}
//extension Foundation.Bundle {
//    /// Returns the resource bundle associated with the current
//    /// Swift module.
//    static var module: Bundle = {
//        let bundleName = "MyImages"
//        let candidates = [
//            // Bundle should be present here when the package is
//            // linked into an App.
//            Bundle.main.resourceURL,
//            // Bundle should be present here when the package is
//            // linked into a framework.
//            Bundle(for: BundleFinder.self).resourceURL,
//            // For command-line tools.
//            Bundle.main.bundleURL,
//        ]
//        for candidate in candidates {
//            let bundlePath = candidate?
//                    .appendingPathComponent(bundleName + ".bundle")
//            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
//                return bundle
//            }
//        }
//        fatalError(
//         "unable to find bundle ID3TagEditor_ID3TagEditorTests"
//        )
//    }()
//
//
//}

public class YourFrameworkClass {
    static var bundle: Bundle = {
        // This assumes that the resources are located in the same bundle as the Swift file.
        // If your resources are in a different bundle, adjust the code accordingly.
        let bundle = Bundle(for: YourFrameworkClass.self)
        guard let url = bundle.url(forResource: "MyImages", withExtension: "bundle"),
              let resourceBundle = Bundle(url: url) else {
            return bundle
        }
        return resourceBundle
    }()

    public func getReferenceImage() -> UIImage? {
        return UIImage(named: "icons8-phone-100", in: YourFrameworkClass.bundle, compatibleWith: nil)
    }
}

class BundleHelper {
    static var resolvedBundle: Bundle {
        #if SWIFT_PACKAGE
            print("it is spm")
            return Bundle.module
        #else
            print("it is not spm")
            return Bundle(for: BundleHelper.self)
        #endif
    }
}
