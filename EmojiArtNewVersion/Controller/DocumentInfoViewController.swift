//
//  DocumentInfoViewController.swift
//  EmojiArtNewVersion
//
//  Created by Sonali Patel on 6/3/18.
//  Copyright © 2018 Sonali Patel. All rights reserved.
//

import UIKit

class DocumentInfoViewController: UIViewController {
    
    var document: EmojiArtDocument? {
        didSet { updateUI() }
    }
    
    @IBOutlet weak var thumbnailImageView: UIImageView!    
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var thumbnailAspectRatio: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    private func updateUI() {
        if sizeLabel != nil, createdLabel != nil, let url = document?.fileURL, let attributes = try? FileManager.default.attributesOfItem(atPath: url.path) {
            sizeLabel.text = "\(attributes[.size] ?? 0) bytes"
            if let created = attributes[.creationDate] as? Date {
                createdLabel.text = shortDateFormatter.string(from: created)
            }
        }
        
        if thumbnailImageView != nil, thumbnailAspectRatio != nil, let thumbnail = document?.thumbnail {
            thumbnailImageView.image = thumbnail
            thumbnailImageView.removeConstraint(thumbnailAspectRatio)
            thumbnailAspectRatio = NSLayoutConstraint(
                item: thumbnailImageView,
                attribute: .width,
                relatedBy: .equal,
                toItem: thumbnailImageView,
                attribute: .height,
                multiplier: thumbnail.size.width / thumbnail.size.height,
                constant: 0
            )
            thumbnailImageView.addConstraint(thumbnailAspectRatio)
        }
    }
    
    @IBAction func done(_ sender: Any) {
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}