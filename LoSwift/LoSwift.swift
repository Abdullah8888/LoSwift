//
//  LoSwift.swift
//  LoSwift
//
//  Created by Abdullah on 03/02/2024.
//

import Foundation
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
    }
    
    func configureUI() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
       // imageView.image = UIImage(named: "your_image_name") // Replace with your image name
        let frameworkBundle = Bundle(for: LoSwift.self)

        // Load the image from the framework bundle
        if let image = UIImage(named: "phone-100", in: frameworkBundle, compatibleWith: nil) {
            imageView.image = image
        }
        // Add the UIImageView to the view hierarchy
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
