//
//  CityWeather.swift
//  HiWeather
//
//  Created by edward chow on 26/11/19.
//  Copyright © 2019 edward chow. All rights reserved.
//

import UIKit

class CityWeather: UIViewController {
    var curCon:[currentCondition]?
    var con: currentCondition?
    var city = [weatherCity]()
    var strPassInCityname: String?
    var strH: String = String()
    var strT: String = String()
    var strIconUrl: String = String()
    var arrWeather = [Weather]()
    
    @IBOutlet weak var txtV: UITextView!
    @IBOutlet weak var lbCityname: UILabel!
    @IBOutlet weak var ImgWeather: UIImageView!
    @IBOutlet weak var lbHumility: UILabel!
    @IBOutlet weak var lbTemperature: UILabel!
    @IBOutlet weak var lbCountry: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         guard let cityName = strPassInCityname else { return}
         let strArr = cityName.components(separatedBy: "(")
         let CityName = strArr[0]
         let str2 = strArr[1]
         let strArr2 = str2.components(separatedBy: ")")
         let Country = strArr2[0]
          
         lbCityname.text = CityName
         lbCountry.text = Country
         ImgWeather.image = UIImage(named:"Sunny")
         lbHumility.text = WeatherDesc.Humility  +  ": " +  "0"
         lbTemperature.text = WeatherDesc.Temperature + ": " + "0"
         getWeatherByCity(cityName: CityName)
        
    }

    @IBAction func btnGoBack(_ sender: Any) {
           performSegue(withIdentifier: "unwindSegueToMain", sender: self)
    }
    
    func getWeatherByCity(cityName:String){
               
               //-1- test: HardCoded URL
               //let url:String = "https://api.worldweatheronline.com/premium/v1/weather.ashx?key=c3edac7ed1b04d0893e35955192611&q=London&format=json&num_of_days=1"
              
               let url:String = URLRequestConstants.AuthBase + cityName + "&format=json&num_of_days=1"
                
                //-2-- test jsonPlaceHolder
                //let url: String = "http://jsonplaceholder.typicode.com/todos/1"
               
                 guard let serviceUrl = URL(string: url) else { return }
        
                //-- test hardcoded url
                //guard let serviceUrl = URL(string: "http://jsonplaceholder.typicode.com/todos/1") else { return }
                
                let task = URLSession.shared.dataTask(with: serviceUrl) { data,response,error in
                    
                    guard error == nil else {
                       print ("error: \(error!)")
                        return
                    }
                    
                    guard let data = data else {
                         print ("error: \(error!)")
                        return
                    }
                    
                    //let Rdata = String(bytes:data,encoding:String.Encoding.utf8)
                    //print("data: \(Rdata)")
                    
                    //----- testing for (2) : JsonPlaceHolder: ok
        //            guard let posts = try? JSONDecoder().decode(Post.self, from: data) else {
        //               print ("error: \(error!)")
        //                return
        //            }
        //            let id = posts.id
        //            print ("post: \(id)")
                    //---- end jsonplaceHolder
                    
        
                    guard let cityWeather = try? JSONDecoder().decode(weatherCity.self, from: data) else {
                       print ("error: \(error!)")
                        return
                    }
               
                    
                    //--- try separate struct :
                    
    //                guard let cityWeather = try? JSONDecoder().decode(CurrentCondition.self, from: data) else {
    //                             print ("error: \(error!)")
    //                              return
    //                          }
    //                var t = cityWeather.tempC
    //                print("Tempc: \(t)")
                    
                    //---- end
                    
                   let con = cityWeather.data?.currentCondition                 
                    
                   let temp = con!
                    
                    for t in temp {
                        self.strH = t.humidity!
                        self.strT = t.tempC!
                        self.arrWeather =  t.weatherIconURL!
                    }
                    
                    for icon in self.arrWeather {

                        self.strIconUrl = icon.value!
                    }
                    
                    let imageUrl = URL(string:self.strIconUrl)
                    //print("temp: \(temp)")
                    print ("value: \(imageUrl!)")
                    
                    DispatchQueue.main.async {
                        self.lbHumility.text = WeatherDesc.Humility  +  ": " + self.strH
                        self.lbTemperature.text = WeatherDesc.Temperature + ": " + self.strT
                        let data = try? Data(contentsOf: imageUrl!)
                        if let data = data {
                            let image = UIImage(data: data)
                            self.ImgWeather.image = image
                        }
                        
                    }
                   
                }
                task.resume()
    }
  
}



