//
//  FundTableViewController.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import UIKit
import SafariServices

class FundTableViewController: UITableViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblFundName: UILabel!
    @IBOutlet weak var lblWhatIs: UILabel!
    @IBOutlet weak var lblDefinition: UILabel!
    @IBOutlet weak var lblRiskTitle: UILabel!
    // View Risk
    @IBOutlet weak var lblInfoTitle: UILabel!
    @IBOutlet weak var lblMonthFundo: UILabel!
    @IBOutlet weak var lblMonthCDI: UILabel!
    @IBOutlet weak var lblYearFundo: UILabel!
    @IBOutlet weak var lblYearCDI: UILabel!
    @IBOutlet weak var lbl12MonthFundo: UILabel!
    @IBOutlet weak var lbl12MonthCDI: UILabel!
    @IBOutlet weak var lblNameInfo0: UILabel!
    @IBOutlet weak var lblDataInfo0: UILabel!
    @IBOutlet weak var lblNameInfo1: UILabel!
    @IBOutlet weak var lblDataInfo1: UILabel!
    @IBOutlet weak var lblNameInfo2: UILabel!
    @IBOutlet weak var lblDataInfo2: UILabel!
    @IBOutlet weak var lblNameInfo3: UILabel!
    @IBOutlet weak var lblDataInfo3: UILabel!
    @IBOutlet weak var lblNameInfo4: UILabel!
    @IBOutlet weak var lblDataInfo4: UILabel!
    @IBOutlet weak var lblNameInfo5: UILabel!
    @IBOutlet weak var lblDataInfo5: UILabel!
    @IBOutlet weak var lblNameInfo6: UILabel!
    @IBOutlet weak var lblDataInfo6: UILabel!
    @IBOutlet weak var lblNameDownInfo0: UILabel!
    @IBOutlet weak var lblNameDownInfo1: UILabel!
    @IBOutlet weak var lblNameDownInfo2: UILabel!
    @IBOutlet weak var lblNameDownInfo3: UILabel!
    @IBOutlet weak var lblNameDownInfo4: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Investimento"
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "share"), style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.tabBarController?.setSelectionIndicatorColor(color: UIColor.unselectedRed)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.fetch()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetch () {
        let url = URL(string: "https://floating-mountain-50292.herokuapp.com/fund.json")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            let jsonString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(jsonString ?? "Erro")
            
            do {
                let decoder = JSONDecoder()
                let screenContainer = try decoder.decode(ScreenContainer.self, from: data!)
                
                DispatchQueue.main.sync{
                    //                    self..text = screenContainer.screen.
                    self.lblTitle.text = screenContainer.screen.title
                    self.lblFundName.text = screenContainer.screen.fundName
                    self.lblWhatIs.text = screenContainer.screen.whatIs
                    self.lblDefinition.text = screenContainer.screen.definition
                    self.lblRiskTitle.text = screenContainer.screen.riskTitle
                    // View Risk
                    self.lblInfoTitle.text = screenContainer.screen.infoTitle
                    self.lblMonthFundo.text = "\(screenContainer.screen.moreInfo.month.fund)%"
                    self.lblMonthCDI.text = "\(screenContainer.screen.moreInfo.month.cdi)%"
                    self.lblYearFundo.text = "\(screenContainer.screen.moreInfo.year.fund)%"
                    self.lblYearCDI.text = "\(screenContainer.screen.moreInfo.year.cdi)%"
                    self.lbl12MonthFundo.text = "\(screenContainer.screen.moreInfo.twelveMonths.fund)%"
                    self.lbl12MonthCDI.text = "\(screenContainer.screen.moreInfo.twelveMonths.cdi)%"
                    self.lblNameInfo0.text = screenContainer.screen.info[0].name
                    self.lblDataInfo0.text = screenContainer.screen.info[0].data
                    self.lblNameInfo1.text = screenContainer.screen.info[1].name
                    self.lblDataInfo1.text = screenContainer.screen.info[1].data
                    self.lblNameInfo2.text = screenContainer.screen.info[2].name
                    self.lblDataInfo2.text = screenContainer.screen.info[2].data
                    self.lblNameInfo3.text = screenContainer.screen.info[3].name
                    self.lblDataInfo3.text = screenContainer.screen.info[3].data
                    self.lblNameInfo4.text = screenContainer.screen.info[4].name
                    self.lblDataInfo4.text = screenContainer.screen.info[4].data
                    self.lblNameInfo5.text = screenContainer.screen.info[5].name
                    self.lblDataInfo5.text = screenContainer.screen.info[5].data
                    self.lblNameInfo6.text = screenContainer.screen.info[6].name
                    self.lblDataInfo6.text = screenContainer.screen.info[6].data
                    self.lblNameDownInfo0.text = screenContainer.screen.info[0].name
                    self.lblNameDownInfo1.text = screenContainer.screen.info[1].name
                    self.lblNameDownInfo2.text = screenContainer.screen.info[2].name
                    self.lblNameDownInfo3.text = screenContainer.screen.info[3].name
                    self.lblNameDownInfo4.text = screenContainer.screen.info[4].name
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    @IBAction func buttonDownloadClicked(_ sender: UIButton) {
        let urlString = "https://www.google.com"
        if let url = URL(string: urlString) {
            let safariViewController = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            self.present(safariViewController, animated: true)
        }
    }

//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
