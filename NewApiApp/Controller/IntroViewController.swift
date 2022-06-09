//
//  ViewController.swift
//  NewApiApp
//
//  Created by 福原雅隆 on 2021/10/24.
//

import UIKit
import Lottie

class IntroViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    //配列、ラベルの名前
    var onbordStringArray = ["世の中には","様々な発見があります","アイウエオ","かきくけこ"]
    //ファイル名
    var animationArray = ["0","1","2","3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUPAnimation()
        
        // Do any additional setup after loading the view.
    }
    
    //ナビゲーションバーを消す
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    
    

    
    func setUPAnimation(){
        
        scrollView.contentSize = CGSize(width: view.frame.size.width * 4, height: view.frame.size.height - (self.navigationController?.navigationBar.frame.size.height)!)
        
        //ページングがされる
        scrollView.isPagingEnabled = true
        
        for i in 0...3{
            let onbordLabel = UILabel(frame: CGRect(x: CGFloat(i) * self.view.frame.size.width, y: self.view.frame.size.height - self.view.frame.size.height/3, width: scrollView.frame.size.width, height: self.view.frame.size.height/4))
            
            onbordLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            onbordLabel.textAlignment = .center
            onbordLabel.text = onbordStringArray[i]
            scrollView.addSubview(onbordLabel)
            
            let animationView = AnimationView()
            animationView.contentMode = .scaleAspectFit
            let animation = Animation.named(animationArray[i])
            animationView.frame = CGRect(x: CGFloat(i) * self.view.frame.size.width, y: 0, width:  self.view.frame.size.width, height:  self.view.frame.size.height)
            
            animationView.animation = animation
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)
        }
        
        
    }
    

}

