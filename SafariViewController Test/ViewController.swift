//
//  ViewController.swift
//  SafariViewController Test
//
//  Created by Jodi Warren on 26/06/2017.
//  Copyright © 2017 Jodi Warren. All rights reserved.
//

import UIKit
import SafariServices
import AVFoundation

class ViewController: UIViewController, SFSafariViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func requestAuth(_ sender: UIButton) {
        print("request auth")
        AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo) { response in
            if response {
                print("I have access!")
            } else {
                print("I don't have access :(")
            }
        }
    }

    @IBAction func openWebsite(_ sender: UIButton) {
        print("open website")
        let safariVC = SFSafariViewController(url: URL(string: "https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/file")!)
        self.present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

