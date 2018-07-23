//
//  ViewController.swift
//  BubbleKit
//
//  Created by volive on 7/3/18.
//  Copyright © 2018 volive. All rights reserved.
//

import UIKit
import SpriteKit
import Magnetic

class ViewController: UIViewController {
    
    var magnetic: Magnetic {
        return bubbleView.magnetic
    }
    
    // array of names and  images with colors
    
    let name = UIImage.names
    let color = UIColor.colors
    
    @IBOutlet weak var bubbleView: MagneticView!{
        didSet {
            magnetic.magneticDelegate = self
            #if DEBUG
            bubbleView.showsFPS = true
            bubbleView.showsDrawCount = true
            bubbleView.showsQuadCount = true
            #endif
        }
    }
    
    
    //NUmber of bubbles appear in view
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("count of names:\(UIImage.names.count)")
        for i in 0..<8
        {
            let node = Node(text: name[i], image: UIImage(named: name[i]), color: color[i], radius: 40)
            magnetic.addChild(node)
        }
    }
  
    
}
// MARK: - MagneticDelegate
extension ViewController: MagneticDelegate {
    
    func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
        print("didSelect -> \(String(describing: node.text))")
        let namesArray = name
        print("names array :\(namesArray)")
        if let index = namesArray.index(of: node.text!) {
            print("Found at index \(index)")
        }
        
    }
    
    func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
        print("didDeselect -> \(node.text ?? "nil")")
    }
    
}
