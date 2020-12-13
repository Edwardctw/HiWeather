
//
//  ViewController.swift
//  HiWeather
//
//  Created by edward chow on 25/11/19.
//  Copyright © 2019 edward chow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblCountry: UITableView!
    
    var strCity = ""
    var arrCountrySearch = [String]()
    var isSearching = false
    let arrCountryCity = Cities.arrCountryCity
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-- conform to delegate and protocol
        searchBar.delegate = self as! UISearchBarDelegate
        tblCountry.delegate = self
        tblCountry.dataSource = self
    }
    
    @IBAction func unwindToMain(_ Segue: UIStoryboardSegue ){}
       
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return arrCountrySearch.count
        } else {
            return arrCountryCity.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if isSearching {
            cell?.textLabel?.text = arrCountrySearch[indexPath.row]
        } else {
            cell?.textLabel?.text = arrCountryCity[indexPath.row]
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
       let cell = tblCountry.cellForRow(at: indexPath) as! UITableViewCell
        //- use cell default textLabel property
        strCity = (cell.textLabel?.text)!
        self.performSegue(withIdentifier: "SequeToCityWeather", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {        
        super.prepare(for: segue, sender: sender)
        if(segue.identifier == "SequeToCityWeather"){
        let TargetVC = segue.destination as! CityWeather
            TargetVC.strPassInCityname = strCity
        }
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        arrCountrySearch = arrCountryCity.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        isSearching = true
        tblCountry.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        tblCountry.reloadData()
    }
}

