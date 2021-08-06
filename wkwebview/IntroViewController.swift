//
//  IntroViewController.swift
//  wkwebview
//
//  Created by Amir on 8/3/21.
//

import UIKit

class IntroViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnBefore: UIButton!
    var pos=0

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImageText()
    }
    

    @IBAction func buttonClicked(_ sender: AnyObject?) {
            if sender === btnNext {
                if pos==5 { 
                    let defaults = UserDefaults.standard
                    defaults.set(true, forKey: "intro")
                    print("save arg")
                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let newViewController = storyBoard.instantiateViewController(withIdentifier: "intro") as! IntroViewController
                                    self.present(newViewController, animated: true, completion: nil)
                    return
                }
                pos=pos+1
            setUpImageText()
          } else if sender === btnBefore {
            if pos==0 {
                return
            }
            pos=pos-1
            setUpImageText()
          }
    }
    
    func setUpImageText() {
        if pos==5 {
            btnNext.setTitle( "اتمام" , for: .normal )
        }else{
            btnNext.setTitle("بعدی", for: .normal )
        }
        if pos==0 {
            btnBefore.isHidden=true
        }else{
            btnBefore.isHidden=false
        }
        
        switch pos {
        case 1:
            textView.text="وارد محیط تست شوید"
           break
        case 2:
            textView.text="اگر علایمی دارید انتخاب کنید"
           break
        case 3:
            textView.text="هفت ثانیه سرفه کنید و با رفتن به مرحله بعد منتظر نتیجه بمانید"
           break
        case 4:
            textView.text="فیلم های آموزشی ببینید و از اخبار روز مطلع شوید"
           break
    
        default:
               textView.text="ورود به سامانه"
        }
    }
}
