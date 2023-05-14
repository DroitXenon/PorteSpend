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
class Home2View: UIViewController {

	@IBOutlet var viewTitle: UIView!
	@IBOutlet var imageViewHeader: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelBalance: UILabel!
	@IBOutlet var buttonReceiveMoney: UIButton!
	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var imageViewSpentThisMonth: UIImageView!
	@IBOutlet var labelSpentThisMonthAmount: UILabel!

	private var recentTransfer: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: viewTitle)
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(actionProfile))

		buttonReceiveMoney.layer.borderWidth = 1
		buttonReceiveMoney.layer.borderColor = AppColor.Border.cgColor

		collectionView.register(UINib(nibName: "Home2Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Home2Cell1")
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

		imageViewHeader.sample("Finance", "BusinessWomen", 15)
		labelBalance.text = "$2500.00"
		imageViewSpentThisMonth.sample("Finance", "Stocks", 2)
		labelSpentThisMonthAmount.text = "$5670"

		recentTransfer.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Amy"
		recentTransfer.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Betty"
		recentTransfer.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Chloe"
		recentTransfer.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Doris"
		recentTransfer.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Emma"
		recentTransfer.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Fabia"
		recentTransfer.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "Alan"
		recentTransfer.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Brian"
		recentTransfer.append(dict8)

		var dict9: [String: String] = [:]
		dict9["name"] = "Chris"
		recentTransfer.append(dict9)

		var dict10: [String: String] = [:]
		dict10["name"] = "Dave"
		recentTransfer.append(dict10)

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
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionViewStatement(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionReceiveMoney(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddRecentTransfer(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllQuickServices(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCreditCards(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionInvestments(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLoans(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSpentThisMonth(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home2View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return recentTransfer.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home2Cell1", for: indexPath) as! Home2Cell1
		cell.bindData(index: indexPath, data: recentTransfer[indexPath.row])
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home2View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home2View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let height = (collectionView.frame.size.height-20)
		return CGSize(width: 70, height: height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 5
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 5
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home2View: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidScroll(_ scrollView: UIScrollView) {

		if scrollView.tag == 11 {
			if let navController = navigationController as? NavigationController {
				if (scrollView.contentOffset.y > buttonReceiveMoney.frame.origin.y) {
					navController.setBackground(color: .systemBackground)
				} else {
					navController.setBackground(color: .clear)
				}
			}
		}
	}
}
