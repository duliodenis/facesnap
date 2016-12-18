//
//  PhotoListController.swift
//  FaceSnap
//
//  Created by Dulio Denis on 12/17/16.
//  Copyright © 2016 ddApps. All rights reserved.
//

import UIKit

class PhotoListController: UIViewController {
    
    lazy var cameraButton: UIButton = {
        let button = UIButton(type: .System)
        
        button.setTitle("Camera", forState: .Normal)
        button.tintColor = .whiteColor()
        button.backgroundColor = UIColor(red: 254/255.0, green: 123/255.0, blue: 135/255.0, alpha: 1.0)
        
        button.addTarget(self, action: Selector("presentImagePickerController"), forControlEvents: .TouchUpInside)
        
        //button.addTarget(self, action: #selector(PhotoListController.presentImagePickerController), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    
    lazy var mediaPickerManager: MediaPickerManager = {
        let manager = MediaPickerManager(presentingViewController: self)
        return manager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Layout
    
    override func viewWillLayoutSubviews() {
        view.addSubview(cameraButton)
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
            cameraButton.leftAnchor.constraintEqualToAnchor(view.leftAnchor),
            cameraButton.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor),
            cameraButton.rightAnchor.constraintEqualToAnchor(view.rightAnchor),
            cameraButton.heightAnchor.constraintEqualToConstant(56.0)
            ])
    }
    
    
    // MARK: - Image Picker Controller
    
    func presentImagePickerController() {
        mediaPickerManager.presentImagePickerController(animated: true)
    }

}
