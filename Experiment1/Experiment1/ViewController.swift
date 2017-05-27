import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Philosopher's Table"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath! // Navigates to a certain directory
        let items = try! fm.contentsOfDirectory(atPath: path) // Array of directory items
        
        for item in items {
            if item.hasPrefix("ph-") {
                pictures.append(item)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        let cellTextRaw = pictures[indexPath.row]
        cell.textLabel?.text = sliceCellText(cellTextRaw)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedImageName = sliceCellText(pictures[indexPath.row])
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Helper
    func sliceCellText(_ cellTextRaw: String) -> String {
        let start = cellTextRaw.index(cellTextRaw.startIndex, offsetBy: 3)
        let end = cellTextRaw.index(cellTextRaw.endIndex, offsetBy: -4)
        let range = start..<end
        
        let cellText = cellTextRaw.substring(with: range).uppercased()
        
        if cellText.characters.last == "." {
            let endIndex = cellText.index(cellText.endIndex, offsetBy: -1)
            let newCellText = cellText.substring(to: endIndex)
            return newCellText
        } else {
            return cellText
        }
        
    }


}

