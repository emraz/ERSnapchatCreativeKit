//
//  ViewController.swift
//  ERSnapchatCreativeKit
//
//  Created by Mahmudul Hasan on 6/1/21.
//

import UIKit
import SCSDKCreativeKit

class ViewController: UIViewController {
    
    var snapAPI: SCSDKSnapAPI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        snapAPI = SCSDKSnapAPI()
    }
    
    
    @IBAction func didPressImageShareButton(_ sender: UIButton) {
        
        if let snapImageUrl = Bundle.main.url(forResource: "img", withExtension: "jpg") {
            
            guard let stickerImage = UIImage.init(named: "sticker") else {return}
            let sticker = SCSDKSnapSticker(stickerImage: stickerImage)
            
            let photo = SCSDKSnapPhoto(imageUrl: snapImageUrl)
            let photoContent = SCSDKPhotoSnapContent(snapPhoto: photo)
            
            photoContent.sticker = sticker
            photoContent.caption = "Matrix Solution"
            photoContent.attachmentUrl = "https://matrixsolution.xyz/"

            //disable user interaction until the share is over.
            view.isUserInteractionEnabled = false
            snapAPI?.startSending(photoContent) { [weak self] (error: Error?) in
              self?.view.isUserInteractionEnabled = true
              // Handle response
            }

        }

    }
    
    @IBAction func didPressVideoShareButton(_ sender: UIButton) {
        if let videoUrl = Bundle.main.url(forResource: "video", withExtension: "mp4") {
            
            guard let stickerImage = UIImage.init(named: "sticker") else {return}
            let sticker = SCSDKSnapSticker(stickerImage: stickerImage)
            
            let video = SCSDKSnapVideo(videoUrl: videoUrl)
            let videoContent = SCSDKVideoSnapContent(snapVideo: video)
            
            videoContent.sticker = sticker
            videoContent.caption = "Matrix Solution"
            videoContent.attachmentUrl = "https://matrixsolution.xyz/"

            //disable user interaction until the share is over.
            view.isUserInteractionEnabled = false
            snapAPI?.startSending(videoContent) { [weak self] (error: Error?) in
              self?.view.isUserInteractionEnabled = true
              // Handle response
            }
        }
    }
    
    @IBAction func didPressStickerShareButton(_ sender: UIButton) {
        
        guard let stickerImage = UIImage.init(named: "sticker") else {return}
        let sticker = SCSDKSnapSticker(stickerImage: stickerImage)
        /* Alternatively, use a URL instead */
        // let sticker = SCSDKSnapSticker(stickerUrl: stickerImageUrl, isAnimated: false)

        /* Modeling a content using SCSDKNoSnapContent */
        let content = SCSDKNoSnapContent()
        content.sticker = sticker /* Optional */
        content.caption = "Hello Guys!" /* Optional */
        content.attachmentUrl = "https://matrixsolution.xyz/" /* Optional */
        
        //disable user interaction until the share is over.
        view.isUserInteractionEnabled = false
        snapAPI?.startSending(content) { [weak self] (error: Error?) in
          self?.view.isUserInteractionEnabled = true
          // Handle response
        }
    }
    
}

