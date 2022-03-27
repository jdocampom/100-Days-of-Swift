//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Juan Diego Ocampo on 27/03/22.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    var selectedImage: String?
    
    var currentPicture: Int?
    var totalPictures: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentPicture = (self.currentPicture ?? 0)
        let totalPictures = self.totalPictures ?? 0
        title = "Picture \(currentPicture) of \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .secondarySystemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        if let selectedImage = selectedImage {
            navigationController?.title = selectedImage
            image.image = UIImage(named: selectedImage)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //        navigationController?.hidesBarsOnTap = false
    }
    
    @objc private func shareTapped() {
        guard let imageData = image.image?.pngData() else { return }
        guard let imageName = selectedImage else { return }
        let shareVC = UIActivityViewController(activityItems: [imageData, imageName], applicationActivities: [])
        shareVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(shareVC, animated: true)
    }
    
}
