import UIKit

class Garden: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var height:CGFloat?
    var width:CGFloat?
    
    @IBOutlet weak var findOutLabel: UILabel!
    @IBOutlet weak var table: UITableView!
    var arrayOfTrees: [Tree] = [Tree]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Personal Garden"
        navigationController?.navigationBar.barTintColor =  Color().get(0x9AEC5B)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        height = self.view.frame.size.height
        width = self.view.frame.size.width
        
        findOutLabel.frame.origin = CGPoint(x:self.width!*0.16, y: self.height!*0.20)
        self.setUpTrees()
        // Do any additional setup after sloading the view, typically from a nib.
        //self.table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        self.table.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfTrees.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:CustomCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as CustomCell
        cell.setUp(arrayOfTrees[indexPath.row])
        return cell
    }
    
    func setUpTrees(){
        arrayOfTrees.append(Tree(name: "Plain Tree", imageName: "plain-a.png",status: 0.0))
        arrayOfTrees.append(Tree(name: "Pine Tree", imageName: "pine-a.png",status: 0.0))
        arrayOfTrees.append(Tree(name: "Binary Tree", imageName: "binary-a.png",status: 0.0))
        arrayOfTrees.append(Tree(name: "Git Tree", imageName: "git-a.png",status: 0.0))
        arrayOfTrees.append(Tree(name: "Money Tree", imageName: "money-a.png",status: 0.0))
        arrayOfTrees.append(Tree(name: "Snoopy Tree", imageName: "snoopy-a.png",status: 0.0))
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToDetailTree" {
            println("hihi")
            let detailTree = segue.destinationViewController as DetailTree
            if let indexPath = self.table.indexPathForSelectedRow() {
                let tree = arrayOfTrees[indexPath.row]
                detailTree.treeNameValue = tree.name
                detailTree.treeImageValue = tree.imageName
                detailTree.statusValue = tree.status
            }
        }
    }
}
