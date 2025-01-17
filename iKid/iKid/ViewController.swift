//
//  ViewController.swift
//  iKid
//
//  Created by Jaimie Jin on 5/1/21.
//

import UIKit

class ViewController: UIViewController {
    var currentView = 0
    var kkTrack = 0;
    var k: ViewControllerJokePt2? = nil
    var j: ViewControllerJokePt1? = nil
    var knockKnock = ["Knock, knock.", "Who’s there?", "Luke.", "Luke who?", "Luke through the peep hole and find out."]
    var jokeList1 = ["Welcome to iKid the joke app. \n Click on a type of joke to get started!", "Helvetica and Times New Roman walk into a bar.", "Why are elevator jokes so classic and good?", "Why was 6 afraid of 7?", "something went wrong"]
    var jokeList2 = ["You are not suppose to be here...", "“Get out of here!” shouts the bartender. “We don’t serve your type.”", "They work on many levels.", "Because 7 ate(8) 9!", "something went wrong"]
    var idList = ["home", "good", "dad", "pun", "knock"]
    override func viewDidLoad() {
        super.viewDidLoad()
        buildController()
        switchViewController(nil, to: j)
         //Do any additional setup after loading the view.
    }
    
    func buildController() {
        if (idList[currentView] != self.restorationIdentifier!) {
        switch self.restorationIdentifier {
            case "home":
                currentView = 0
            case "good":
                currentView = 1
            case "dad":
                currentView = 2
            case "pun":
                currentView = 3
            case "knock":
                currentView = 4
            default:
                currentView = 5
            }
        }
        if j == nil {
            buildJ(currentView)
        }
        if k == nil {
            buildK(currentView)
        }
    }
    
    @IBAction func switchNext(_ sender: Any) {
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
                
        if j != nil &&
            j!.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            k!.view.frame = view.frame
            switchViewController(j, to: k)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            j!.view.frame = view.frame
            switchViewController(k, to: j)
        }
        UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
            buildController();
            if from != nil {
                from!.willMove(toParent: nil)
                from!.view.removeFromSuperview()
                from!.removeFromParent()
            }
            
            if to != nil {
                self.addChild(to!)
                self.view.insertSubview(to!.view, at: 0)
                to!.didMove(toParent: self)
                if currentView == 4 && to == j {
                    j!.changeData(knockKnock[kkTrack])
                    kkTrack += 1;
                    if (kkTrack == 5) {
                        kkTrack = 0;
                    }
                } else if currentView == 4 && to == k {
                    k!.changeData(knockKnock[kkTrack])
                    kkTrack += 1;
                    if (kkTrack == 5) {
                        kkTrack = 0;
                    }
                }
            }
        }
    
    fileprivate func buildK(_ index: Int) {
        if k == nil {
            k = storyboard?.instantiateViewController(identifier: "secondPt") as? ViewControllerJokePt2
            k!.data = jokeList2[index]
        }
    }
    
    fileprivate func buildJ(_ index: Int) {
        if j == nil {
            j = storyboard?.instantiateViewController(identifier: "firstPt") as? ViewControllerJokePt1
            j!.data = jokeList1[index]
        }
    }

     

}

