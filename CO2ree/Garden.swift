import UIKit

class Garden: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    var arrayOfTrees: [Tree] = [Tree]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTrees()
        // Do any additional setup after loading the view, typically from a nib.
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
        let cell:CustomCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as CustomCell
        cell.setUp(arrayOfTrees[indexPath.row])
        return cell
    }
    
    func setUpTrees(){
        arrayOfTrees.append(Tree(name: "Pine Tree", imageName: "pineTree.png",status: 0.0))
        arrayOfTrees.append(Tree(name: "Tree", imageName: "tree.png",status: 0.0))
        arrayOfTrees.append(Tree(name: "Git Tree", imageName: "gitTree.png",status: 0.0))
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        /*
        if editingStyle == UITableViewCellEditingStyle.Delete{
            arrayOfTrees.removeAtIndex(indexPath.row)
            self.table.reloadData()
        } */
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let tree = arrayOfTrees[indexPath.row]
        var detailTree: DetailTree = self.storyboard?.instantiateViewControllerWithIdentifier("DetailTree") as DetailTree
        detailTree.treeNameValue = tree.name
        detailTree.treeImageValue = tree.imageName
        detailTree.statusValue = tree.status
        self.presentViewController(detailTree, animated: true, completion: nil)
        self.table.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
