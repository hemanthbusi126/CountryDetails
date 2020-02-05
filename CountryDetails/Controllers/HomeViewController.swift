//
//  HomeViewController.swift
//  CountryDetails
//
//  Created by Hemanth on 27/01/20.
//  Copyright © 2020 Hemanth. All rights reserved.
//

import Foundation
import UIKit



class HomeViewController: UIViewController {
    
    let tableView = UITableView()
    let titleName = "TableView Demo"
    var countryDetails = [CountryDetails]()
    let session = URLSession.shared
    let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!
    var refreshControl = UIRefreshControl()
    
    struct Cells {
        static let countryDetailsTableViewCell = "CountryDetailsTableViewCell"
    }
   
    fileprivate func setUpTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    fileprivate func configureTableView() {
      getTabelViewData(URl: url) { (title, detailsArray) in
        DispatchQueue.main.async {
            self.setUpTableViewDelegates()
            self.refreshControl.endRefreshing()
            self.title = title
            self.countryDetails = detailsArray
            self.tableView.reloadData()
        }
      }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.pin(to: self.view)
        configureTableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        tableView.register(CountryDetailsTableViewCell.self, forCellReuseIdentifier: Cells.countryDetailsTableViewCell)
        configurePulltoRefresh()
    }
    
    fileprivate func configurePulltoRefresh(){
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh() {
        self.countryDetails = [CountryDetails]()
        self.tableView.reloadData()
        configureTableView()
    }
    
    fileprivate func  getTabelViewData(URl: URL, completion: @escaping (_ title: String, _ details: [CountryDetails]) -> Void) {
        let urlRequest = URLRequest(url: url)
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if error != nil || data == nil {
                return
            }
            let str  = String(decoding: data!, as: UTF8.self).replacingOccurrences(of: "É", with: "A")
            let newData = str.data(using: .utf8)
            do {
                let decoder = JSONDecoder()
                let parsedData = try decoder.decode(CountryDetailsRows.self , from: newData!)
                completion(parsedData.title, parsedData.rows)
            }catch{
                print("JSON error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.countryDetailsTableViewCell) as? CountryDetailsTableViewCell
        let details = countryDetails[indexPath.item]
        cell?.descriptionLabel.text = details.description
        cell?.titleLabel.text = details.title
        cell?.countryImageView.downloaded(from: details.imageHref ?? "", contentMode: .scaleAspectFit)
        return cell!
    }
}
