// I had issues following along with instructions for this assignment.  I researched and utilized code from Big Nerd Ranch to complete this assignment.
// source:  Swift Programming: The Big Nerd Ranch Guide (3rd Edition)

//
//  Item.swift
//  Photorama
//
//  Created by Ethan Roberts on 04/02/21.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        store.fetchInterestingPhotos {
            (photosResult) in

            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos.")
                if let firstPhoto = photos.first {
                    self.updateImageView(for: firstPhoto)
                }
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
            }

        }
    }
    
    func updateImageView(for photo: Photo) {
        store.fetchImage(for: photo) {
            (imageResult) in

            switch imageResult {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error downloading image: \(error)")
            }
        }
    }
    
}
