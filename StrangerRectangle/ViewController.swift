//
//  ViewController.swift
//  StrangerRectangle
//
//  Created by Эллина Коржова on 18.05.23.
//

import UIKit

class ViewController: UIViewController {
let squareView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(squareView)
        squareView.backgroundColor = .systemBlue
        squareView.layer.cornerCurve = .continuous
        squareView.layer.cornerRadius = 8
        squareView.frame = .init(x: 0, y: 0, width: 100, height: 100)
        squareView.center = .init(x: view.frame.width / 2, y: view.frame.height / 2)
        
        animator = UIDynamicAnimator(referenceView: view)
        let tapGester = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        view.addGestureRecognizer(tapGester)
        
    }

    private var animator: UIDynamicAnimator?
    private var snapBehaviour: UISnapBehavior?
    
    
    @objc func handleTap(sender: UITapGestureRecognizer){
        let tapPoint = sender.location(in: view)
        
        if let snapBehaviour = self.snapBehaviour {
            animator?.removeBehavior(snapBehaviour)
        }
        let snapBehaviour = UISnapBehavior(item: squareView, snapTo: tapPoint)
        snapBehaviour.damping = 0.9
        animator?.addBehavior(snapBehaviour)
        
        self.snapBehaviour = snapBehaviour
    }

}

