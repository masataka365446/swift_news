//
//  TopViewController.swift
//  NewApiApp
//
//  Created by 福原雅隆 on 2021/10/25.
//

import UIKit

class TopViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,DoneCatchContentsProtocol {

    
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    var newsContentsArray = [NewsContentsModel]()
    var newsAnalytics = NewsAnalytics()
    
    //enum
    enum CellType{
        
        case top
        case notTop
        
    }
    
    let cellType:[CellType] = [.top,.notTop]
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        newsAnalytics.doneCatchContentsProtocol = self
        tableView.register(UINib(nibName: "HeaderContentCell", bundle: nil), forCellReuseIdentifier: HeaderContentCell.identifire)
        tableView.register(UINib(nibName: "ContentsCell", bundle: nil), forCellReuseIdentifier: ContentsCell.identifire)
        
        // Do any additional setup after loading the view.
    }
    
    
    //どこのセグメントの番号が押されたか
    func setIndex(){
        if UserDefaults.standard.object(forKey: "indexNumber") != nil{
            let indexNumber = UserDefaults.standard.object(forKey: "indexNumber") as! Int
            check(segmentNumber: indexNumber)
            
            segment.selectedSegmentIndex = indexNumber
            
        }else{
            check(segmentNumber: 0)
            segment.selectedSegmentIndex = 0
        }
    }
    
    
    
    
    
    //ナビゲーションバーを隠す
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        setIndex()
    }
    
    
    
    
    
    
    func check(segmentNumber:Int){
        newsAnalytics.start(segmentNumber: segmentNumber)
    }
    
    
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsContentsArray.count
    }
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellType:CellType
        if indexPath.row < 1{
            cellType = .top
        }else{
            cellType = .notTop
        }
        
        switch cellType{
        case .top:
            let headerContentCell = tableView.dequeueReusableCell(withIdentifier: HeaderContentCell.identifire, for: indexPath) as! HeaderContentCell
            
            headerContentCell.configure(newsContents: newsContentsArray[indexPath.row])
            
            return headerContentCell
        
        case .notTop:
            let contentsCell = tableView.dequeueReusableCell(withIdentifier: ContentsCell.identifire, for: indexPath) as! ContentsCell
            
            contentsCell.configure(newsContents: newsContentsArray[indexPath.row])
            
            return contentsCell
        
        }
        
    }
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 1{
            return 300
        }else{
            return 116
        }
    }
    
    
    
    
    
    
    
    
    
    
    func doneCatchContents(newsContentsArray: [NewsContentsModel]) {
        self.newsContentsArray = []
        self.newsContentsArray = newsContentsArray
        tableView.reloadData()
    }
    
    
    
    
    
    
    
    
    
    
    //セルがタップされた時に呼ばれる場所
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //値を渡しながら画面遷移
        let webVC = self.storyboard?.instantiateViewController(withIdentifier: "webVC") as! WebViewController
        
        UserDefaults.standard.set(segment.selectedSegmentIndex, forKey: "indexNumber")
        
        webVC.newsContentModel = newsContentsArray[indexPath.row]
        
        self.navigationController?.pushViewController(webVC, animated: true)
        
    }
    
    
    
    
    
    
    
    
    @IBAction func selectSegment(_ sender: UISegmentedControl) {
        
        UserDefaults.standard.set(segment.selectedSegmentIndex, forKey: "indexNumber")
        setIndex()
        check(segmentNumber: sender.selectedSegmentIndex)
        
        //強制的にクスロールしてトップに行く
        tableView.setContentOffset(.zero, animated: true)
        
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
