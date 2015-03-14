import UIKit

class Garden: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    var trees = ["Pine Tree", "Tree","Git Tree", "Apple Tree", "Money Tree", "Christmas Tree"]
    var treeimagename = ["pineTree.png","tree.png","gitTree.png","appleTree.png","monyTree.png","christmasTree.png"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        self.table.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trees.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:CustomCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as CustomCell
        cell.setUp(trees[indexPath.row],imageName: treeimagename[indexPath.row])
        return cell
    }
}
