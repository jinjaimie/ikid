//
//  ViewControllerJokePt1.swift
//  iKid
//
//  Created by Jaimie Jin on 5/2/21.
//

import UIKit

class ViewControllerJokePt1: UIViewController {
    
    @IBOutlet var label1: UILabel!
    var _data : String? = nil
          open var data : String? {
            get { return self._data }
            set(value) {
                self._data = value
                //label1.text = value
            }
          }
    override func viewDidLoad() {
        super.viewDidLoad()
        changeData()
        // Do any additional setup after loading the view.
    }
    
    func changeData() {
        label1.text = data
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