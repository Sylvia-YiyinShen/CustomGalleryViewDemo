//
//  ViewController.swift
//  GalleryViewDemo
//
//  Created by Yiyin Shen on 11/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var GalleryView: GalleryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurGalleryView()
    }
    
    private func configurGalleryView() {
        let models = [MyGalleryViewCellModel(imageName: "tarot_01"),
                      MyGalleryViewCellModel(imageName: "tarot_02"),
                      MyGalleryViewCellModel(imageName: "tarot_03")]
        
        GalleryView.configure(models: models, customCellNib: UINib(nibName: "MyGalleryViewCell", bundle: .main), backgroundColor: .black)
    }
}

