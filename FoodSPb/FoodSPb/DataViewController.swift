//
//  DataViewController.swift
//  FoodSPb
//
//  Created by Юрий Бондарчук on 22.11.16.
//  Copyright © 2016 Yury Bandarchuk. All rights reserved.
//

import Foundation
import UIKit

class DataViewController : UIViewController {
    
    @IBOutlet weak var restaurantInfo: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    
    public var restaurantId : Int = -1
    
    let restaurantNames : [Int : String] = [
        1 : "ginza",
        2 : "marcellis",
        3 : "marketplace"
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func capitalizeFirstLetter(string s: String) -> String {
        if s.characters.count == 0 {
            return ""
        }
        let firstPart = String(s.characters.prefix(1)).capitalized
        let secondPart = String(s.characters.dropFirst())
        return firstPart + secondPart
    }
    
    func updateText(text: String) -> String {
        var result: String = ""
        let words: Array<String> = text.characters.split{$0 == " "}.map(String.init)
        var onCurrentLine: Int = 0
        for word in words {
            if word.characters.count + onCurrentLine > 40 {
                result.append("\n")
                onCurrentLine = 0
            }
            if onCurrentLine > 0 {
                    result += " "
                onCurrentLine += 1
            }
            onCurrentLine += word.characters.count
            result += word
        }
        return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if restaurantId == -1 {
            return
        }
        let restaurantName = restaurantNames[restaurantId]
        var restaurantNameForTitle = restaurantName
        if restaurantId == 3 {
            restaurantNameForTitle = "Market Place"
        }
        self.navigationItem.title = capitalizeFirstLetter(string: restaurantNameForTitle!)
        restaurantImage.image = UIImage(named: restaurantName!)
        restaurantInfo.lineBreakMode = .byWordWrapping
        restaurantInfo.numberOfLines = 0
        var restaurantText : String = ""
        if let filePath = Bundle.main.path(forResource: restaurantName, ofType: "txt", inDirectory: "infoFiles") {
            var text: String = ""
            do {
                 text = try String(contentsOfFile: filePath)
            } catch {
                text = ""
            }
            restaurantText = text
        }
        restaurantInfo.text! = updateText(text: restaurantText)
    }
}
