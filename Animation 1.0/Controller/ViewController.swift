//
//  ViewController.swift
//  Animation 1.0
//
//  Created by Ivan Nikitin on 22/05/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftLegImageView: UIImageView!
    @IBOutlet weak var rightLegImageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var moveLeftButton: UIButton!
    @IBOutlet weak var moveRightButton: UIButton!


    @IBAction func startButtonTapped(_ sender: Any) {
        startButton.isEnabled = false
            UIView.animate(withDuration: 0.12, animations: {
                let scaleTransform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.startButton.transform = scaleTransform
            }) { _ in
                UIView.animate(withDuration: 0.06, animations: {
                    self.startButton.transform = CGAffineTransform.identity
                    self.startButton.setImage(#imageLiteral(resourceName: "pause"), for: [])
                })
            }
        legsAnimation()
    }
    
    @IBAction func moveLeftButtonTapped(_ sender: UIButton) {

        UIView.animate(withDuration: 0.12, animations: {
            let scaleTransform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = scaleTransform
        }) { _ in
            UIView.animate(withDuration: 0.06, animations: {
                sender.transform = CGAffineTransform.identity
            })
        }
        legsAnimationIn()
    }
    @IBAction func moveRightButtonTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.12, animations: {
            let scaleTransform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = scaleTransform
        }) { _ in
            UIView.animate(withDuration: 0.06, animations: {
                sender.transform = CGAffineTransform.identity
            })
        }
        legsAnimationOut()
    }
    
    //MARK: - Animations
    func legsAnimationOut() {
        //Left leg transform
        let rotateTransformLeftLeg = CGAffineTransform(rotationAngle: .pi / 8)
        let translateTransformLeftLeg = CGAffineTransform(translationX: -35, y: 0)
        let comboTransformLeftLeg = rotateTransformLeftLeg.concatenating(translateTransformLeftLeg)
        
        //Right leg transform
        let rotateTransformRightLeg = CGAffineTransform(rotationAngle: -.pi / 8)
        let translateTransformRightLeg = CGAffineTransform(translationX: 35, y: 0)
        let comboTransformRightLeg = rotateTransformRightLeg.concatenating(translateTransformRightLeg)
        
        let animator = UIViewPropertyAnimator(duration: 1, curve: .linear) {
            print("Animation")
            self.leftLegImageView.transform = comboTransformLeftLeg
            self.rightLegImageView.transform = comboTransformRightLeg
        }
        animator.startAnimation()
    }
    
    func legsAnimationIn() {
        
        let animator = UIViewPropertyAnimator(duration: 1, curve: .linear) {
            print("Animation")
            self.leftLegImageView.transform = CGAffineTransform.identity
            self.rightLegImageView.transform = CGAffineTransform.identity
        }
        animator.startAnimation()
    }
    
    func legsAnimation() {
        
        //Left leg transform
        let rotateTransformLeftLeg = CGAffineTransform(rotationAngle: .pi / 8)
        let translateTransformLeftLeg = CGAffineTransform(translationX: -35, y: 0)
        let comboTransformLeftLeg = rotateTransformLeftLeg.concatenating(translateTransformLeftLeg)
        
        //Right leg transform
        let rotateTransformRightLeg = CGAffineTransform(rotationAngle: -.pi / 8)
        let translateTransformRightLeg = CGAffineTransform(translationX: 35, y: 0)
        let comboTransformRightLeg = rotateTransformRightLeg.concatenating(translateTransformRightLeg)
        
        
        UIView.animate(withDuration: 0.7, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.leftLegImageView.transform = comboTransformLeftLeg
            self.rightLegImageView.transform = comboTransformRightLeg
        }) { _ in
            UIView.animate(withDuration: 0.7, delay: 0.3, options: .curveEaseInOut, animations: {
                self.leftLegImageView.transform = CGAffineTransform.identity
                self.rightLegImageView.transform = CGAffineTransform.identity
            }, completion: { _ in
                print("Done")
                self.startButton.isEnabled = true
                    self.startButton.setImage(#imageLiteral(resourceName: "playSolid"), for: [])
            })
        }
    }
}

