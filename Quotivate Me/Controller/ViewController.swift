//
//  ViewController.swift
//  Quotivate Me
//
//  Created by Siddique on 16/12/17.
//  Copyright © 2017 Siddique. All rights reserved.
//

import UIKit
import ZLSwipeableViewSwift
import Cartography
import UIColor_FlatColors


class ViewController: UIViewController {
    
   
    var swipeableView: ZLSwipeableView!
    var cardView: CardView!

    var colors = ["Turquoise", "Green Sea", "Emerald", "Nephritis", "Peter River", "Belize Hole", "Amethyst", "Wisteria", "Wet Asphalt", "Midnight Blue", "Sun Flower", "Orange", "Carrot", "Pumpkin", "Alizarin", "Pomegranate", "Silver", "Concrete", "Asbestos"]
    var colorIndex = 0
    var leftBarButtonItem: UIBarButtonItem!
    var upBarButtonItem: UIBarButtonItem!
    var rightBarButtonItem: UIBarButtonItem!
    var downBarButtonItem:UIBarButtonItem!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        swipeableView.nextView = {
            return self.nextCardView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setToolbarHidden(false, animated: false)
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        leftBarButtonItem = UIBarButtonItem(title: "←", style: .plain, target: self, action: #selector(leftButtonAction))
        upBarButtonItem = UIBarButtonItem(title: "↑", style: .plain, target: self, action: #selector(upButtonAction))
        rightBarButtonItem = UIBarButtonItem(title: "→", style: .plain, target: self, action: #selector(rightButtonAction))
        downBarButtonItem = UIBarButtonItem(title: "↓", style: .plain, target: self, action: #selector(downButtonAction))
        
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let items = [fixedSpace, leftBarButtonItem!, flexibleSpace, upBarButtonItem!, flexibleSpace, downBarButtonItem!, flexibleSpace, rightBarButtonItem!, fixedSpace]
        toolbarItems = items
        swipeableView = ZLSwipeableView()
        swipeableView.frame = CGRect(x: 45, y: 100, width: 300, height: 500)
        view.addSubview(swipeableView)
        swipeableView.didStart = {view, location in
            print("Did start swiping view at location: \(location)")
        }
        swipeableView.swiping = {view, location, translation in
            print("Swiping at view location: \(location) translation: \(translation)")
        }
        swipeableView.didEnd = {view, location in
            print("Did end swiping view at location: \(location)")
        }
        swipeableView.didSwipe = {view, direction, vector in
            print("Did swipe view in direction: \(direction), vector: \(vector)")
        }
        swipeableView.didCancel = {view in
            print("Did cancel swiping view")
        }
        swipeableView.didTap = {view, location in
            print("Did tap at location \(location)")
        }
        swipeableView.didDisappear = { view in
            print("Did disappear swiping view")
        }
    }
    
    @objc func leftButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Left)
    }
    
    @objc func upButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Up)
    }
    
    @objc func rightButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Right)
    }
    
    @objc func downButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Down)
    }
    func nextCardView() -> UIView? {
        if colorIndex >= colors.count {
            colorIndex = 0
        }
        let cardView = CardView(frame: swipeableView.bounds)
        cardView.backgroundColor = colorForName(colors[colorIndex])
        colorIndex += 1
        let a = Quotes()
    let random = Int(arc4random_uniform(UInt32(a.quotes.count)))
        let quoteLabel: UILabel = {
            let label = UILabel()
            label.font.withSize(20)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.textColor = UIColor.white
            label.preferredMaxLayoutWidth = 700
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.sizeToFit()
            label.textAlignment = .center
            label.text = a.quotes[random]
            return label
            }()
            cardView.addSubview(quoteLabel)
            quoteLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 10).isActive = true
            quoteLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 5).isActive = true
            quoteLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -10).isActive = true
        quoteLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -200).isActive = true
            quoteLabel.widthAnchor.constraint(equalToConstant: 4).isActive = true
            quoteLabel.heightAnchor.constraint(equalToConstant: 1).isActive = true
        let name: UILabel = {
           let name = UILabel()
            name.translatesAutoresizingMaskIntoConstraints = false
            name.textAlignment = .center
            name.textColor = UIColor.white
            name.text = "-" + a.names[random]
            return name
        }()
        cardView.addSubview(name)
        name.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
        name.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: -50).isActive = true
        name.widthAnchor.constraint(equalTo: cardView.widthAnchor).isActive = true
        name.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
        return cardView
    }

//    @IBOutlet weak var quotesLabel: UILabel!

    func colorForName(_ name: String) -> UIColor {
        let sanitizedName = name.replacingOccurrences(of: " ", with: "")
        let selector = "flat\(sanitizedName)Color"
        return UIColor.perform(Selector(selector)).takeUnretainedValue() as! UIColor
    }

}

