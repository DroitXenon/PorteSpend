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
class CoinsView: UIViewController {

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!

	private var coins: [[String: String]] = []
	private var accounts: [[String: String]] = []
	private var currentCoinIndex = 0

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(actionNotification(_:)))

		let userImage = UIImage(systemName: "person.circle.fill")?.withTintColor(UIColor.systemGray, renderingMode: .alwaysOriginal)
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: userImage, style: .plain, target: self, action: #selector(actionProfile(_:)))

		collectionView.register(UINib(nibName: "CoinsCell1", bundle: Bundle.main), forCellWithReuseIdentifier: "CoinsCell1")
		tableView.register(UINib(nibName: "CoinsCell2", bundle: Bundle.main), forCellReuseIdentifier: "CoinsCell2")

		loadData()
		layoutConstraintTableViewHeight.constant = CGFloat(80 * accounts.count) + 40
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		coins.removeAll()
		accounts.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Bitcoin"
		dict1["amount"] = "$6,891.43"
		dict1["percentage"] = "0.14%"
		dict1["isPlus"] = "Minus"
		coins.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Ethereum"
		dict2["amount"] = "$172.63"
		dict2["percentage"] = "0.60%"
		dict2["isPlus"] = "Minus"
		coins.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "XRP"
		dict3["amount"] = "$0.184484"
		dict3["percentage"] = "0.04%"
		dict3["isPlus"] = "Plus"
		coins.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Tether"
		dict4["amount"] = "$1.01"
		dict4["percentage"] = "0.01%"
		dict4["isPlus"] = "Plus"
		coins.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Litecoin"
		dict5["amount"] = "$40.85"
		dict5["percentage"] = "0.47%"
		dict5["isPlus"] = "Plus"
		coins.append(dict5)

		var dict6: [String: String] = [:]
		dict6["amount"] = "9.7250"
		dict6["name"] = "Bitcoin"
		dict6["percentage"] = "1.29%"
		dict6["isPlus"] = "Plus"
		accounts.append(dict6)

		var dict7: [String: String] = [:]
		dict7["amount"] = "4.0129"
		dict7["name"] = "Tether"
		dict7["percentage"] = "0.04%"
		dict7["isPlus"] = "Minus"
		accounts.append(dict7)

		var dict8: [String: String] = [:]
		dict8["amount"] = "4.3828"
		dict8["name"] = "Bitcoin"
		dict8["percentage"] = "0.56%"
		dict8["isPlus"] = "Minus"
		accounts.append(dict8)

		var dict9: [String: String] = [:]
		dict9["amount"] = "2.6311"
		dict9["name"] = "Litecoin"
		dict9["percentage"] = "0.08%"
		dict9["isPlus"] = "Plus"
		accounts.append(dict9)

		var dict10: [String: String] = [:]
		dict10["amount"] = "1.2149"
		dict10["name"] = "XRP"
		dict10["percentage"] = "1.35%"
		dict10["isPlus"] = "Plus"
		accounts.append(dict10)

		var dict11: [String: String] = [:]
		dict11["amount"] = "2.3600"
		dict11["name"] = "Tether"
		dict11["percentage"] = "2.28%"
		dict11["isPlus"] = "Minus"
		accounts.append(dict11)

		var dict12: [String: String] = [:]
		dict12["amount"] = "1.9139"
		dict12["name"] = "Ethereum"
		dict12["percentage"] = "4.63%"
		dict12["isPlus"] = "Plus"
		accounts.append(dict12)

		var dict13: [String: String] = [:]
		dict13["amount"] = "4.5232"
		dict13["name"] = "Bitcoin"
		dict13["percentage"] = "0.65%"
		dict13["isPlus"] = "Plus"
		accounts.append(dict13)

		var dict14: [String: String] = [:]
		dict14["amount"] = "2.1365"
		dict14["name"] = "Bitcoin"
		dict14["percentage"] = "2.07%"
		dict14["isPlus"] = "Minus"
		accounts.append(dict14)

		var dict15: [String: String] = [:]
		dict15["amount"] = "4.9120"
		dict15["name"] = "Ethereum"
		dict15["percentage"] = "0.69%"
		dict15["isPlus"] = "Minus"
		accounts.append(dict15)

		refreshCollectionView()
		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionNotification(_ sender: UIBarButtonItem) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionProfile(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAdd(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CoinsView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return accounts.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "CoinsCell2", for: indexPath) as! CoinsCell2
		cell.bindData(index: indexPath, data: accounts[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CoinsView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 80
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 40
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		return "Accounts"
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			let viewY = header.frame.size.height - 0.5
			let view = UIView(frame: CGRect(x: 15, y: viewY, width: header.frame.size.width-30, height: 1))
			view.backgroundColor = .tertiarySystemFill
			view.tag = 1001
			header.contentView.subviews.forEach { (view) in
				if (view.tag == 1001) {
					view.removeFromSuperview()
				}
			}
			header.contentView.addSubview(view)
			header.textLabel?.font = UIFont.systemFont(ofSize: 12)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CoinsView: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return coins.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoinsCell1", for: indexPath) as! CoinsCell1
		cell.setCell(isSelected: (currentCoinIndex == indexPath.row))
		cell.bindData(data: coins[indexPath.row])
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CoinsView: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		currentCoinIndex = indexPath.row
		collectionView.reloadData()
		collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CoinsView: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width-50)
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

		return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CoinsView: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

		if (scrollView == collectionView) {
			let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
			let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

			if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
				currentCoinIndex = visibleIndexPath.row
				collectionView.reloadData()
			}
		}
	}
}
