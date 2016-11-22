//
//  ViewController.swift
//  FoodSPb
//
//  Created by Юрий Бондарчук on 22.11.16.
//  Copyright © 2016 Yury Bandarchuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var marketPlaceButton: UIButton!
    @IBOutlet weak var marcellisButton: UIButton!
    @IBOutlet weak var ginzaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController : DataViewController = segue.destination as! DataViewController
        let button : UIButton = sender as! UIButton
        if button == marcellisButton {
            nextViewController.restaurantId = 2
        } else if button == ginzaButton {
            nextViewController.restaurantId = 1
        } else {
            nextViewController.restaurantId = 3
        }
        
    }


}

