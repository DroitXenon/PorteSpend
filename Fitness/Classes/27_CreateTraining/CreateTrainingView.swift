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
class CreateTrainingView: UIViewController {

	@IBOutlet var textFieldTitle: UITextField!
	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var labelDateFrom: UILabel!
	@IBOutlet var labelDateTo: UILabel!

	private var dates: [Date] = []
	private var startDate: Date?
	private var endDate: Date?
	private var isMonthAddInTop = false
	private var isMonthAddInBottom = false

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Create Training"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(actionCancel(_:)))

		let attribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
		textFieldTitle.attributedPlaceholder = NSAttributedString(string: "Title", attributes: attribute)

		collectionView.scrollsToTop = false
		collectionView.register(UINib(nibName: "CreateTrainingCell1", bundle: Bundle.main), forCellWithReuseIdentifier: "CreateTrainingCell1")
		collectionView.register(UINib(nibName: "CreateTrainingCell2", bundle: Bundle.main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CreateTrainingCell2")
		setInitialMonthData()
	}

	// MARK: - Helper Methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setInitialMonthData() {

		dates.removeAll()
		let currentMonthDate = Date.getCurrentMonthFirstDate()
		dates.append(currentMonthDate)
		var contentOffsetY = 0
		for i in (1...6) {
			let date1 = currentMonthDate.add(month: -i)
			contentOffsetY += ((date1.getNumberOfWeekForMonth()+1)*40)
			dates.insert(date1, at: 0)
			dates.append(currentMonthDate.add(month: i))
		}
		DispatchQueue.main.async {
			self.collectionView.reloadData()
			self.collectionView.contentOffset.y = CGFloat(contentOffsetY)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func addMonthInTop() {

		if let firstMonthDate = dates.first {
			var contentOffsetY = 0
			for i in (1...12) {
				let date1 = firstMonthDate.add(month: -i)
				contentOffsetY += ((date1.getNumberOfWeekForMonth()+1)*40)
				dates.insert(date1, at: 0)
			}
			DispatchQueue.main.async {
				self.collectionView.reloadData()
				self.collectionView.contentOffset.y += CGFloat(contentOffsetY)
				self.isMonthAddInTop = false
			}
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func addMonthInBottom() {

		if let lastMonthDate = dates.last {
			for i in (1...12) {
				dates.append(lastMonthDate.add(month: i))
			}
			DispatchQueue.main.async {
				self.collectionView.reloadData()
				self.isMonthAddInBottom = false
			}
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func getDate(for indexPath: IndexPath) -> Date {

		let firstDate = dates[indexPath.section]
		let weekDay = firstDate.getDayOfWeek(firstWeekDay: 2)
		let date = firstDate.add(day: (indexPath.row+1)-weekDay)
		return date
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionCancel(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionNext(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CreateTrainingView: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return dates.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

		if (kind == UICollectionView.elementKindSectionHeader) {
			let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CreateTrainingCell2", for: indexPath) as! CreateTrainingCell2
			let title = dates[indexPath.section].toString(withFormate: "MMM yyyy")
			reusableView.bindData(title: title)
			return reusableView
		}
		return UICollectionReusableView()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return dates[section].getNumberOfWeekForMonth()*7
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateTrainingCell1", for: indexPath) as! CreateTrainingCell1
		let date = getDate(for: indexPath)
		cell.bindData(date: date, firstDate:dates[indexPath.section], startDate: startDate, endDate: endDate)
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CreateTrainingView: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		let date = getDate(for: indexPath)
		guard date.isMonth(in: dates[indexPath.section]) else { return }

		if (startDate == date) {
			startDate = endDate
			endDate = nil
			collectionView.reloadData()
			return
		}
		if (endDate == date) {
			endDate = nil
			collectionView.reloadData()
			return
		}

		if (startDate == nil) {
			startDate = date
		} else if (endDate == nil) {
			if startDate! > date {
				endDate = startDate
				startDate = date
			} else {
				endDate = date
			}
		} else {
			startDate = date
			endDate = nil
		}
		if let stDate = startDate {
			labelDateFrom.text = stDate.toString(withFormate: "E, MMM d")
		}
		if let enDate = endDate {
			labelDateTo.text = enDate.toString(withFormate: "E, MMM d")
		}
		collectionView.reloadData()
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CreateTrainingView: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

		let width = collectionView.frame.size.width
		return CGSize(width: width, height: 40)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width - 30) / 7
		return CGSize(width: width, height: 40)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CreateTrainingView: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidScroll(_ scrollView: UIScrollView) {

		if (scrollView == collectionView) {
			let offsetY = scrollView.contentOffset.y
			let contentHeight = scrollView.contentSize.height

			if offsetY > contentHeight - scrollView.frame.size.height && !isMonthAddInBottom {
				isMonthAddInBottom = true
				addMonthInBottom()
			}

			if offsetY < scrollView.frame.size.height && !isMonthAddInTop {
				isMonthAddInTop = true
				addMonthInTop()
			}
		}
	}
}

// MARK: - UITextFieldDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CreateTrainingView: UITextFieldDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {

		textField.resignFirstResponder()
		return true
	}
}
