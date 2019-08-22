//
//  ViewController.swift
//  baseApp
//
//  Created by Fagron Technologies on 06/03/18.
//  Copyright © 2018 Fagron Technologies. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var wellcomeMessage: UILabel!
    @IBOutlet weak var labelTenant: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        wellcomeMessage.text = NSLocalizedString("wellcome.label.wellcome", comment: "")
        
        let viewModel = MainVMFactory.create()
        let tenant = viewModel.getTenant()
        
        labelTenant.text = tenant
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

