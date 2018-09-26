//
//  ViewController.swift
//  PassDataDelegate-TableView
//
//  Created by trung on 2018/08/18.
//  Copyright © 2018 trung. All rights reserved.
//

import UIKit
protocol DelegateDetail {
    func passDelegate(passData: String)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var outletTextField: UITextField!
    var data: String?
    var delegate: DelegateDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if data != nil {
            outletTextField.text = data

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonDelegateDetail(_ sender: Any) {
        delegate?.passDelegate(passData: outletTextField.text!)
        dismiss(animated: true, completion: nil)
        
    }
    
}

