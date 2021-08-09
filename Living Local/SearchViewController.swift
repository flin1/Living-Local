//
//  SearchViewController.swift
//  Living Local
//
//  Created by Fay Lin  on 8/4/21.
//

import UIKit
import CoreLocation
import MapKit

class SearchViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell")
        //dragons current row - dragons per cell
        let restaurant = restaurants[indexPath.row]
        cell!.textLabel?.text = restaurant.name;   cell!.detailTextLabel?.text = restaurant.address
        return cell!
    }
    
/*    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    func tableView(_ tableView:UITableView, heightForRowAt index: IndexPath) -> CGFloat{
        return 300
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        
        cell.nameLabel.text = places[indexPath.row].name
        cell.priceLabel.text = places[indexPath.row].price ?? "-"
        cell.isClosed = places[indexPath.row].is_closed ?? false
        cell.addressLabel.text = places[indexPath.row].address
        
        return cell
    }*/
    

    @IBOutlet weak var placesTableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation = CLLocation(latitude: 41.8364,longitude:  -87.6487)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesTableView.delegate = self
        placesTableView.dataSource = self
        placesTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "customCell")
        placesTableView.separatorStyle = .none
        // Do any additional setup after loading the view.
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        textField.text = "restaurants"
        
        let restaurant1 = Restaurant(name: "Taqueria San Jose", address: "3253 S Halsted St")
        let restaurant2 = Restaurant(name: "Taipei Cafe", address: "2609 S Halsted St")
        let restaurant3 = Restaurant(name: "Ajo", address: "752 W 33rd St")
        let restaurant4 = Restaurant(name: "Zaytune", address: "3129 S Morgan St")
        let restaurant5 = Restaurant(name: "8A5E", address: "1200 W 35th St")
        let restaurant6 = Restaurant(name: "Bridgeport Coffee", address: "3101 S Morgan St")
        restaurants = [restaurant1,restaurant2,restaurant3,restaurant4,restaurant5,restaurant6]
    }

        var currentLat: Double = 41.8364
        var currentLong: Double = -87.6487
        var places : [Place] = []

    
    
    var restaurants : [Restaurant] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func searchPlaces(){
        
        
        
        
                
      /*  retrievePlaces(latitude: currentLat, longitude: currentLong, category: "gyms", limit: 20, sortBy: "distance", locale: "en_US") { (response, error) in
            if let response = response{
                self.places = response
                DispatchQueue.main.async {
                    self.placesTableView.reloadData()
                }
            }
            
        }*/
        
        //for loop compare values to search input
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        searchPlaces()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
