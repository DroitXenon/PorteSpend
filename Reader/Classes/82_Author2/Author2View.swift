//
// Copyright (c) 2021 Related Code - https://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class Author2View: UIViewController {

	@IBOutlet var imageUser: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelBooks: UILabel!
	@IBOutlet var labelSubscribers: UILabel!
	@IBOutlet var labelAbout: UILabel!
	@IBOutlet var layoutConstraintAboutHeight: NSLayoutConstraint!
	@IBOutlet var buttonBooks: UIButton!

	@IBOutlet var collectionView: UICollectionView!

	private var books: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Author"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMore(_:)))

		collectionView.register(UINib(nibName: "Author2Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "Author2Cell")

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)
		if let navController = navigationController as? NavigationController {
			navController.setBackground(color: .clear)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)

		if let navBar = navigationController as? NavigationController {
			navBar.setNavigationBar()
		}
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageUser.sample("Social", "Portraits", 15)
		books.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "The 7 Habits of Highly Effective People"
		dict1["author"] = "William Shakespeare"
		dict1["date"] = "Mar 17, 2020"
		dict1["rating"] = "4.7"
		dict1["review"] = "811"
		books.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Something I Never Told You"
		dict2["author"] = "William Shakespeare"
		dict2["date"] = "Mar 24, 2020"
		dict2["rating"] = "4.0"
		dict2["review"] = "894"
		books.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "This is Not Your Story"
		dict3["author"] = "William Shakespeare"
		dict3["date"] = "Mar 15, 2020"
		dict3["rating"] = "3.5"
		dict3["review"] = "11.2k"
		books.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "How to Win Friends and Influence People"
		dict4["author"] = "William Shakespeare"
		dict4["date"] = "Mar 14, 2020"
		dict4["rating"] = "1.8"
		dict4["review"] = "682"
		books.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Dear Stranger, I Know How You Feel"
		dict5["author"] = "William Shakespeare"
		dict5["date"] = "Mar 14, 2020"
		dict5["rating"] = "2.4"
		dict5["review"] = "258"
		books.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Who Moved My Cheese?"
		dict6["author"] = "William Shakespeare"
		dict6["date"] = "Mar 10, 2020"
		dict6["rating"] = "4.9"
		dict6["review"] = "331"
		books.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "The Magic of Thinking Big"
		dict7["author"] = "William Shakespeare"
		dict7["date"] = "Mar 19, 2020"
		dict7["rating"] = "3.9"
		dict7["review"] = "19.5k"
		books.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Think & Grow Rich"
		dict8["author"] = "William Shakespeare"
		dict8["date"] = "Mar 15, 2020"
		dict8["rating"] = "5.0"
		dict8["review"] = "276"
		books.append(dict8)

		var dict9: [String: String] = [:]
		dict9["name"] = "The Power of Positive Thinking"
		dict9["author"] = "William Shakespeare"
		dict9["date"] = "Mar 11, 2020"
		dict9["rating"] = "2.0"
		dict9["review"] = "214"
		books.append(dict9)

		labelName.text = "William Shakespeare"
		labelBooks.text = "\(books.count) books"
		labelSubscribers.text = "84.9K"
		labelAbout.text = "William Shakespeare was an English poet, playwright, and actor, widely regarded as the greatest writer in the English language and the world's greatest dramatist. He is often called England's national poet and the \"Bard of Avon\" (or simply \"the Bard\")."
		buttonBooks.setTitle("\(books.count) Books", for: [])

		if let aboutHeight = labelAbout.text?.height(withConstrainedWidth: labelAbout.frame.size.width, font: UIFont.systemFont(ofSize: 16)) {
			layoutConstraintAboutHeight.constant = aboutHeight
		}

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIBarButtonItem) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFollow(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionBooks(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAdd(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Author2View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return books.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Author2Cell", for: indexPath) as! Author2Cell
		cell.bindData(index: indexPath.item, data: books[indexPath.row])
		cell.buttonAdd.addTarget(self, action: #selector(actionAdd(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Author2View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Author2View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width)/3
		return CGSize(width: width, height: 240)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 15
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 15
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Author2View: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidScroll(_ scrollView: UIScrollView) {

		if scrollView.tag == 11 {
			if let navController = navigationController as? NavigationController {
				if (scrollView.contentOffset.y > imageUser.frame.size.height/2) {
					navController.setBackground(color: .systemBackground)
				} else {
					navController.setBackground(color: .clear)
				}
			}
		}
	}
}

// MARK: - String
//-----------------------------------------------------------------------------------------------------------------------------------------------
fileprivate extension String {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {

		let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
		return ceil(boundingBox.height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {

		let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
		return ceil(boundingBox.width)
	}
}
