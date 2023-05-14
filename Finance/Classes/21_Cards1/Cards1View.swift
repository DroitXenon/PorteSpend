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
class Cards1View: UIViewController {

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var pageControl: UIPageControl!
	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellCardName: UITableViewCell!
	@IBOutlet var cellAccountNumber: UITableViewCell!
	@IBOutlet var cellCardholder: UITableViewCell!
	@IBOutlet var cellExpirationDate: UITableViewCell!
	@IBOutlet var cell3DSecurity: UITableViewCell!

	@IBOutlet var labelCardName: UILabel!
	@IBOutlet var labelAccountNumber: UILabel!
	@IBOutlet var labelCardholder: UILabel!
	@IBOutlet var labelExpirationDate: UILabel!
	@IBOutlet var label3DSecurity: UILabel!

	private var cards: [[String: String]] = []
	private var currentCardIndex = 0

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationItem.largeTitleDisplayMode = .never
		navigationController?.navigationBar.prefersLargeTitles = false

		let userImage = UIImage(systemName: "person.circle.fill")?.withTintColor(UIColor.systemGray, renderingMode: .alwaysOriginal)
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: userImage, style: .plain, target: self, action: #selector(actionProfile(_:)))

		collectionView.register(UINib(nibName: "Cards1Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "Cards1Cell")

		let cellWidth = UIScreen.main.bounds.width - 60
		let sectionSpacing = CGFloat(30)
		let cellSpacing = CGFloat(10)

		if let layout = collectionView.collectionViewLayout as? Cards1Layout {
			layout.sectionInset = UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
			layout.itemSize = CGSize(width: cellWidth, height: collectionView.frame.size.height-20)
			layout.minimumLineSpacing = cellSpacing
			collectionView.collectionViewLayout = layout
			collectionView.translatesAutoresizingMaskIntoConstraints = false
			collectionView.decelerationRate = .fast
		}

		loadData()
		pageControl.numberOfPages = cards.count
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelCardName.text = "Visa Platinum"
		labelAccountNumber.text = "091000019"
		labelCardholder.text = "Chloe Adams"
		labelExpirationDate.text = "12/2020"
		label3DSecurity.text = "Enable"

		cards.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Amy Roberts"
		dict1["expiry_date"] = "10/2023"
		dict1["card_number"] = "3582 0629 5501 7280"
		dict1["amount"] = "$27426"
		cards.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Betty Hansen"
		dict2["expiry_date"] = "07/2022"
		dict2["card_number"] = "3559 1156 5411 4912"
		dict2["amount"] = "$43797"
		cards.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Chloe Adams"
		dict3["expiry_date"] = "11/2024"
		dict3["card_number"] = "3572 7735 3334 5165"
		dict3["amount"] = "$31249"
		cards.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Doris Royston"
		dict4["expiry_date"] = "10/2022"
		dict4["card_number"] = "2014 8821 6388 3421"
		dict4["amount"] = "$35365"
		cards.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Emma Harris"
		dict5["expiry_date"] = "02/2021"
		dict5["card_number"] = "3742 8892 2573 3800"
		dict5["amount"] = "$12436"
		cards.append(dict5)

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionProfile(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionReport(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTransactions(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionActions(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Cards1View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return 5
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.row == 0) { return cellCardName		 }
		if (indexPath.row == 1) { return cellAccountNumber	 }
		if (indexPath.row == 2) { return cellCardholder		 }
		if (indexPath.row == 3) { return cellExpirationDate	 }
		if (indexPath.row == 4) { return cell3DSecurity		 }

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Cards1View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 50
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Cards1View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return cards.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cards1Cell", for: indexPath) as! Cards1Cell
		cell.bindData(index: indexPath, data: cards[indexPath.row])
		cell.setCell(isSelected: (currentCardIndex == indexPath.row))
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Cards1View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		currentCardIndex = indexPath.row
		pageControl.currentPage = indexPath.row
		collectionView.reloadData()
		collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Cards1View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = collectionView.frame.size.width-60
		let height = collectionView.frame.size.height-20
		return CGSize(width: width, height: height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 10
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 10
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Cards1View: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

		if (scrollView == collectionView) {
			let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
			let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

			if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
				currentCardIndex = visibleIndexPath.row
				pageControl.currentPage = currentCardIndex
				collectionView.reloadData()
			}
		}
	}
}
