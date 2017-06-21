// Note: This project is called 'Mobile Awakening'. Get woke af while on your phone.

import UIKit
import SafariServices
import CoreSpotlight
import MobileCoreServices

class ViewController: UITableViewController, SFSafariViewControllerDelegate {
    
    var links = ["http://classics.mit.edu/Plato/apology.html", "http://classics.mit.edu/Plato/republic.html", "http://classics.mit.edu/Plato/ion.html", "http://classics.mit.edu/Plato/crito.html", "http://classics.mit.edu/Plato/meno.html", "http://classics.mit.edu/Antoninus/meditations.html", "http://classics.mit.edu/Epicurus/menoec.html", "http://classics.mit.edu/Epicurus/princdoc.html", "http://classics.mit.edu/Confucius/analects.html", "http://classics.mit.edu/Confucius/doctmean.html", "http://classics.mit.edu/Confucius/learning.html"]
    var books = [[String]]()
    var bookmarked = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Woke Works"
        
        books.append(["Plato - Apology", "This book is about Socrates talking to the Athens court during his trial"])
        books.append(["Plato - The Republic", "This book is full of really awesome dialogue between Socrates and other people. Socrates basically questions the heck out of people on various topics and it's just awesome"])
        books.append(["Plato - Ion", "This book is about Socrates talking to a poet named Ion, questioning whether poetry is a skill itself or if poetry is a result of other skills."])
        books.append(["Plato - Crito", "This book is about Socrates talking his friend Crito while Socrates is in jail. He just talks about how death does not scare him because he's such a cool person."])
        books.append(["Plato - Meno", "This book is about Socrates talking to a foreigner named Meno asking for a definition of virtue. It goes back and forth... "])
        books.append(["Marcus Aurelius - Meditations", "Self-help enthusiasts refer to this book a lot. It's the diary of a roman emperor literally talking to himself. Stoic wisdom. He was a really good emperor btw."])
        books.append(["Epicurus - Letter to Menoeceus ","I haven't read this yet haha"])
        books.append(["Epicurus - Principal Doctrines ", "I haven't read this yet either..."])
        books.append(["Confucius - The Analects", "I haven't read this either so i'm just gonna put some lorem ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lor"])
        books.append(["Confucius - Doctrine of the Mean", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lor"])
        books.append(["Confucius - The Great Learning", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lor"])
        
        let defaults = UserDefaults.standard
        if let bookmarkedItems = defaults.object(forKey: "bookmarked") as? [Int] {
            bookmarked = bookmarkedItems
        }
        
        tableView.isEditing = true // ?
        tableView.allowsSelectionDuringEditing = true // ?
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        let book = books[indexPath.row]
        cell.textLabel?.attributedText = makeAttributedEntry(title: book[0], description: book[1])
        
        if bookmarked.contains(indexPath.row) {
            cell.editingAccessoryType = .checkmark
        } else {
            cell.editingAccessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        displayWork(indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // ?
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if bookmarked.contains(indexPath.row) {
            return .delete
        } else {
            return .insert
        }
    }
    
    // ?
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            bookmarked.append(indexPath.row)
            index(item: indexPath.row)
        } else {
            if let index = bookmarked.index(of: indexPath.row) {
                bookmarked.remove(at: index)
                deindex(item: indexPath.row)
            }
        }
        
        let defaults = UserDefaults.standard
        defaults.set(bookmarked, forKey: "bookmarked")
        
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    // ?
    func index(item: Int) {
        let book = books[item]
        
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
        
        attributeSet.title = book[0]
        attributeSet.contentDescription = book[1]
        
        let item = CSSearchableItem(uniqueIdentifier: "\(item)", domainIdentifier: "internet.classics", attributeSet: attributeSet)
        
        CSSearchableIndex.default().indexSearchableItems([item]) {
            error in
            if let error = error {
                print("Indexing error \(error.localizedDescription)")
            } else {
                print("Indexed")
            }
        }
    }
    
    // ?
    func deindex(item: Int) {
        CSSearchableIndex.default().deleteSearchableItems(withIdentifiers: ["\(item)"]) { error in
            if let error = error {
                print("Deindexing error \(error.localizedDescription)")
            } else {
                print("Search item removed")
            }
        }
    }
    
    // ?
    func makeAttributedEntry(title: String, description: String) -> NSAttributedString {
        let titleAttributes = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: .headline),
                               NSAttributedStringKey.foregroundColor: UIColor.brown]
        let descriptionAttributes = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: .caption1)]
        
        let titleString = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttributes)
        let descriptionString = NSAttributedString(string: description, attributes: descriptionAttributes)
        
        titleString.append(descriptionString)
        
        return titleString
        
    }
    
    func displayWork(_ which: Int) {
        if let url = URL(string: links[which]) {
            let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true) // ?
            present(vc, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

