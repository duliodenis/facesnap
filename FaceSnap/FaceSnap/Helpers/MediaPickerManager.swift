//
//  MediaPickerManager.swift
//  FaceSnap
//
//  Created by Dulio Denis on 12/18/16.
//  Copyright © 2016 ddApps. All rights reserved.
//

import UIKit
import MobileCoreServices

// protocol restricted to classes only in order to allow weak reference
protocol MediaPickerManagerDelegate: class {
    func mediaPickerManager(manager: MediaPickerManager, didFinishPickingImage image: UIImage)
}


class MediaPickerManager: NSObject {
    
    private let imagePickerController = UIImagePickerController()
    private let presentingViewController: UIViewController
    
    weak var delegate: MediaPickerManagerDelegate?
    
    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
        super.init()
        
        //imagePickerController.delegate = self
        
        // check to see if there is a camera
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePickerController.sourceType = .Camera
            imagePickerController.cameraDevice = .Front
        } else {
            imagePickerController.sourceType = .PhotoLibrary
        }
        
        imagePickerController.mediaTypes = [kUTTypeImage as String]
    }
    
    
    func presentImagePickerController(animated animated:Bool) {
        presentingViewController.presentViewController(imagePickerController, animated: animated, completion: nil)
    }
    
    
    func dismissImagePickerController(animated animated: Bool, completion: (()->Void)) {
        imagePickerController.dismissViewControllerAnimated(animated, completion: completion)
    }
    
}


extension MediaPickerManager: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        delegate?.mediaPickerManager(self, didFinishPickingImage: image)
    }
    
}