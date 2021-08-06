//
//  SplashViewController.swift
//  wkwebview
//
//  Created by Amir on 8/2/21.
//

import UIKit
import Network

class SplashViewController: UIViewController {
    
    
    var b :Bool=false
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let monitor = NWPathMonitor()
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("We're connected!")
                self.b=true
            } else {
                print("No connection.")
                self.b=false
            }

            print(path.isExpensive)
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        let cellMonitor = NWPathMonitor(requiredInterfaceType: .cellular)
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        if b {
            gotoNext()
        }else{
            textView.text="خطا در اتصال لطفا دوباره تلاش کنید"
        }
    }
    
    func gotoNext() {
        let defaults = UserDefaults.standard
        let intro=defaults.bool(forKey: "intro")
        if intro {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "webview") as! ViewController
                    self.present(newViewController, animated: true, completion: nil)
        }else{
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "intro") as! IntroViewController
                        self.present(newViewController, animated: true, completion: nil)
        }
        
    
    }
    
}
