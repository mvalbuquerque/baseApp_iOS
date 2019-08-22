//
//  PhonesViewController.swift
//  baseApp
//
//  Created by Fagron Technologies on 06/03/18.
//  Copyright © 2018 Fagron Technologies. All rights reserved.
//

import UIKit

class PhonesViewController: UITableViewController {
    
    private let headers: [String] = ["phones.header.callcenter", "phones.header.others"]
    weak var activityIndicator: UIActivityIndicatorView!
    var phones: [[PhoneModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.backBarButtonItem?.title = ""
        
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        self.activityIndicator = activityIndicatorView
        tableView.backgroundView = activityIndicatorView
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.activityIndicator.startAnimating()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewModel = PhonesVMFactory.create(appDelegate: appDelegate)
        viewModel.getList()
            .subscribe(onNext: { result in
                self.phones = result
                self.activityIndicator.stopAnimating()
                self.tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
                self.tableView.reloadData()
            })
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return phones.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        let label = UILabel()
        let text = self.headers[section]
        label.text = NSLocalizedString(text, comment: "")
        label.textColor = UIColor.white
        label.frame = CGRect(x: 16, y: 8, width: 300, height: 40)
        view.addSubview(label)
        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "phone", for: indexPath) as! PhoneCell
        
        let phone = self.phones[indexPath.section][indexPath.row]
        
        cell.phone.text = phone.toString()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.phones[section].count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let phone = self.phones[indexPath.section][indexPath.row]
        
        let telphone = phone.phone.replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "-", with: "")
        if let url = URL(string: "tel://\(telphone)") {
            UIApplication.shared.open(url)
        }
    }
    
    //Tamanho do Header da Section
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
}
