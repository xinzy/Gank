//
//  GirlShowViewController.swift
//  Gank
//
//  Created by Yang on 2020/4/11.
//  Copyright © 2020 Xinzy. All rights reserved.
//

import UIKit
import Kingfisher

class GirlShowViewController: UIViewController {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var girlImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    var girlArticle: Article!
    
    private var mCurrentScale: CGFloat = 1.0
    private var mImageViewFrame: CGRect? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
        girlImageView.contentMode = .scaleAspectFit
        girlImageView.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 2
        girlImageView.addGestureRecognizer(tapGestureRecognizer)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
        girlImageView.addGestureRecognizer(panGestureRecognizer)
        
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture(_:)))
        girlImageView.addGestureRecognizer(pinchGestureRecognizer)
        
        display()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        girlImageView.frame.size = CGSize(width: screenWidth, height: screenHeight)
    }
    
    override var prefersStatusBarHidden: Bool {
        true
    }

    @objc private func back() {
        dismiss(animated: true, completion: nil)
    }
    
    private func display() {
        title = girlArticle.title
        descLabel.text = girlArticle.desc
        guard let imageUrl = girlArticle.cover else { return }
        girlImageView.kf.setImage(with: URL(string: imageUrl))
    }
}

extension GirlShowViewController {
    @objc private func tapGesture(_ tap: UITapGestureRecognizer) {
        if mCurrentScale <= 1.0 {
            mCurrentScale = 1.5
        } else if mCurrentScale > 1.0 && mCurrentScale <= 1.5 {
            mCurrentScale = 2.0
        } else {
            mCurrentScale = 1.0
        }
        let w = screenWidth * mCurrentScale
        let h = screenHeight * mCurrentScale
        
        let left = (screenWidth - w) / 2
        let top = (screenHeight - h) / 2
    
        UIView.animate(withDuration: 0.5) { [unowned self] in
            self.girlImageView.frame = CGRect(x: left, y: top, width: w, height: h)
        }
    }
    
    @objc private func panGesture(_ pan: UIPanGestureRecognizer) {
        if pan.state == .began {
            mImageViewFrame = girlImageView.frame
        }
        if pan.state == .ended {
            var bounds = girlImageView.frame
            var needReset = false
            if bounds.left > 0 {
                bounds.left = 0
                needReset = true
            }
            if bounds.top > 0 {
                bounds.top = 0
                needReset = true
            }
            if bounds.right < screenWidth {
                bounds.right = screenWidth
                needReset = true
            }
            if bounds.bottom < screenHeight {
                bounds.bottom = screenHeight
                needReset = true
            }
            
            if needReset {
                UIView.animate(withDuration: 0.3) { [unowned self] in
                    self.girlImageView.frame = bounds
                }
            }
            return
        }
        
        if pan.state == .changed {
            let point = pan.translation(in: girlImageView)
            
            guard var bounds = mImageViewFrame else { return }
            bounds.left += point.x
            bounds.top += point.y
            girlImageView.frame = bounds
        }
    }
    
    @objc private func pinchGesture(_ pinch: UIPinchGestureRecognizer) {
        if pinch.state == .began {
            mImageViewFrame = girlImageView.frame
        } else if pinch.state == .changed {
            let scale = pinch.scale
            
            let w = (mImageViewFrame?.width ?? screenWidth) * scale
            let h = (mImageViewFrame?.height ?? screenHeight) * scale
            let left = (screenWidth - w) / 2
            let top = (screenHeight - h) / 2
            
            girlImageView.frame = CGRect(x: left, y: top, width: w, height: h)
            mCurrentScale = scale
        } else if pinch.state == .ended {
            if mCurrentScale < 1 {
                mCurrentScale = 1
                UIView.animate(withDuration: 0.3) { [unowned self] in
                    self.girlImageView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
                }
            } else if mCurrentScale > 2 {
                mCurrentScale = 2
                let w = screenWidth * mCurrentScale
                let h = screenHeight * mCurrentScale
                
                let left = (screenWidth - w) / 2
                let top = (screenHeight - h) / 2
            
                UIView.animate(withDuration: 0.5) { [unowned self] in
                    self.girlImageView.frame = CGRect(x: left, y: top, width: w, height: h)
                }
            }
        }
    }
    
}
