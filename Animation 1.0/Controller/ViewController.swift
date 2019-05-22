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
    @IBOutlet weak var countLabel: UILabel!
    
    
    var numberOfexercise = 0
//    var square: UIView!
//    let initialFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 20
        startButton.clipsToBounds = true
        
//        square = UIView(frame: initialFrame)
//        square.backgroundColor = .purple
//        view.addSubview(square)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        let width = view.frame.width
//        let height = view.frame.height
//
//        numberOfTouches += 1
//
//        switch numberOfTouches {
//        case 1:
//            let scaleTransform = CGAffineTransform(scaleX: 2, y: 2)
//            let rotateTransform = CGAffineTransform(rotationAngle: .pi)
//            let translateTransform = CGAffineTransform(translationX: 200, y: 200)
//
//            let comboTransform = scaleTransform.concatenating(
//                rotateTransform.concatenating(translateTransform)
//            )
//
//            UIView.animate(withDuration: 2) {
//                self.leftLegImageView.transform = comboTransform
//            }
//
//
//        case 2:
//            UIView.animate(withDuration: 1, animations: {
//                self.square.backgroundColor = .green
//                self.square.frame = CGRect(x: 150, y: 150, width: 200, height: 200)
//            }) { _ in
//                UIView.animate(withDuration: 0.5) {
//                    self.square.backgroundColor = .purple
//                    self.square.frame = self.initialFrame
//                }
//            }
//
//        case 3:
//            UIView.animate(withDuration: 3, delay: 1, options: [.autoreverse ,.repeat], animations: {
//                self.square.frame = CGRect(x: width / 2, y: height / 2, width: 20, height: 300)
//                self.square.backgroundColor = .green
//            }) { bool in
//                self.view.backgroundColor = .gray
//            }
//        default:
//            numberOfTouches = 0
//        }
//    }
    
    
    @IBAction func startButtonTapped(_ sender: Any) {
        
        startButton.isEnabled = false
        
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
                self.numberOfexercise += 1
                self.countLabel.text = "count: \(self.numberOfexercise)"
                
            })
        }
    }
}

