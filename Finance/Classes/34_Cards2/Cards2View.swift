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
class Cards2View: UIViewController {

	@IBOutlet var viewAdd: UIView!
	@IBOutlet var labelSubTitle: UILabel!

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var pageControl: UIPageControl!

	@IBOutlet var labelCreditUtilized: UILabel!
	@IBOutlet var labelAvailableCreditLimit: UILabel!
	@IBOutlet var progressView: UIProgressView!
	@IBOutlet var labelLastBillAmount: UILabel!
	@IBOutlet var labelPaymentDueDate: UILabel!
	@IBOutlet var labelMinAmountDue: UILabel!
	@IBOutlet var buttonAnalyseSpend: UIButton!

	private var cards: [[String: String]] = []
	private var currentCardIndex = 0

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "My Cards"
		navigationController?.navigationItem.largeTitleDisplayMode = .always
		navigationController?.navigationBar.prefersLargeTitles = true

		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: viewAdd)

		buttonAnalyseSpend.layer.borderWidth = 1
		buttonAnalyseSpend.layer.borderColor = AppColor.Border.cgColor

		collectionView.register(UINib(nibName: "Cards2Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "Cards2Cell")

		let cellWidth = UIScreen.main.bounds.width - 60
		let sectionSpacing = CGFloat(30)
		let cellSpacing = CGFloat(10)

		if let layout = collectionView.collectionViewLayout as? Cards2Layout {
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

		cards.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Amy Roberts"
		dict1["expiry_date"] = "10/2023"
		dict1["card_number"] = "3582 0629 5501 7280"
		cards.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Betty Hansen"
		dict2["expiry_date"] = "07/2022"
		dict2["card_number"] = "3559 1156 5411 4912"
		cards.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Chloe Adams"
		dict3["expiry_date"] = "11/2024"
		dict3["card_number"] = "3572 7735 3334 5165"
		cards.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Doris Royston"
		dict4["expiry_date"] = "10/2022"
		dict4["card_number"] = "2014 8821 6388 3421"
		cards.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Emma Harris"
		dict5["expiry_date"] = "02/2021"
		dict5["card_number"] = "3742 8892 2573 3800"
		cards.append(dict5)

		labelCreditUtilized.text = "$28604.33"
		labelAvailableCreditLimit.text = "$91395.67"
		progressView.progress = 28604.33/(28604.33+91395.67)
		labelLastBillAmount.text = "$43200"
		labelPaymentDueDate.text = "May 05, 2020"
		labelMinAmountDue.text = "$1440"

		labelSubTitle.text = "\(cards.count) cards"

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAdd(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLastBillAmount(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAnalyseSpend(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPayLastBill(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Cards2View: UICollectionViewDataSource {

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

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cards2Cell", for: indexPath) as! Cards2Cell
		cell.bindData(index: indexPath, data: cards[indexPath.row])
		cell.setCell(isSelected: (currentCardIndex == indexPath.row))
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Cards2View: UICollectionViewDelegate {

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
extension Cards2View: UICollectionViewDelegateFlowLayout {

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
extension Cards2View: UIScrollViewDelegate {

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
