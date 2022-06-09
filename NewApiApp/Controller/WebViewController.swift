//
//  WebViewController.swift
//  NewApiApp
//
//  Created by 福原雅隆 on 2021/10/25.
//

import UIKit
import WebKit


class WebViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    
    var newsContentModel:NewsContentsModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //ナビゲーションバーを隠さない
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        let request = URLRequest(url: URL(string: (newsContentModel.url)!)!)
        
        webView.load(request)
    }
    
    
    
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    
    
    
    @IBAction func back(_ sender: Any) {
        webView.goBack()
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
