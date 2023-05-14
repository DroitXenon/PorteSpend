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
import Charts

//-----------------------------------------------------------------------------------------------------------------------------------------------
class Home1View: UIViewController {

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var labelAmount: UILabel!
	@IBOutlet var chartView: LineChartView!
	@IBOutlet var labelMonth: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!

	private var cards: [[String: String]] = []
	private var transactions: [[String: String]] = []
	private var selectedCardIndex = 0

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(actionNotification(_:)))

		let userImage = UIImage(systemName: "person.circle.fill")?.withTintColor(UIColor.systemGray, renderingMode: .alwaysOriginal)
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: userImage, style: .plain, target: self, action: #selector(actionProfile(_:)))

		collectionView.register(UINib(nibName: "Home1Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Home1Cell1")
		tableView.register(UINib(nibName: "Home1Cell2", bundle: Bundle.main), forCellReuseIdentifier: "Home1Cell2")

		loadData()
		setChartUI()
		layoutConstraintTableViewHeight.constant = CGFloat(70 * transactions.count)
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelAmount.text = "$950.40"
		labelMonth.text = "August"

		cards.removeAll()
		transactions.removeAll()

		var dict1: [String: String] = [:]
		dict1["card_number"] = "****7399"
		dict1["card_type"] = "American Express"
		cards.append(dict1)

		var dict2: [String: String] = [:]
		dict2["card_number"] = "****1843"
		dict2["card_type"] = "Visa"
		cards.append(dict2)

		var dict3: [String: String] = [:]
		dict3["card_number"] = "****6092"
		dict3["card_type"] = "Mastercard"
		cards.append(dict3)

		var dict4: [String: String] = [:]
		dict4["card_number"] = "****9194"
		dict4["card_type"] = "Visa"
		cards.append(dict4)

		var dict5: [String: String] = [:]
		dict5["card_number"] = "****9977"
		dict5["card_type"] = "Mastercard"
		cards.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Amy Roberts"
		dict6["status"] = "Received"
		dict6["date"] = "22 May"
		dict6["time"] = "8:21 AM"
		dict6["amount"] = "$281"
		transactions.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "Betty Hansen"
		dict7["status"] = "Sent"
		dict7["date"] = "21 Dec"
		dict7["time"] = "4:53 PM"
		dict7["amount"] = "$131"
		transactions.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Chloe Adams"
		dict8["status"] = "Sent"
		dict8["date"] = "18 Apr"
		dict8["time"] = "10:24 AM"
		dict8["amount"] = "$396"
		transactions.append(dict8)

		var dict9: [String: String] = [:]
		dict9["name"] = "Doris Royston"
		dict9["status"] = "Received"
		dict9["date"] = "30 Jul"
		dict9["time"] = "3:18 AM"
		dict9["amount"] = "$146"
		transactions.append(dict9)

		var dict10: [String: String] = [:]
		dict10["name"] = "Emma Harris"
		dict10["status"] = "Sent"
		dict10["date"] = "01 Jun"
		dict10["time"] = "9:15 AM"
		dict10["amount"] = "$180"
		transactions.append(dict10)

		var dict11: [String: String] = [:]
		dict11["name"] = "Fabia Smith"
		dict11["status"] = "Received"
		dict11["date"] = "20 Sep"
		dict11["time"] = "9:44 A"
		dict11["amount"] = "$307"
		transactions.append(dict11)

		var dict12: [String: String] = [:]
		dict12["name"] = "Alan Nickerson"
		dict12["status"] = "Received"
		dict12["date"] = "30 Oct"
		dict12["time"] = "12:32 AM"
		dict12["amount"] = "$156"
		transactions.append(dict12)

		var dict13: [String: String] = [:]
		dict13["name"] = "Brian Elwood"
		dict13["status"] = "Received"
		dict13["date"] = "12 Mar"
		dict13["time"] = "5:44 AM"
		dict13["amount"] = "$280"
		transactions.append(dict13)

		var dict14: [String: String] = [:]
		dict14["name"] = "Chris Michael"
		dict14["status"] = "Sent"
		dict14["date"] = "13 Jan"
		dict14["time"] = "2:22 PM"
		dict14["amount"] = "$27"
		transactions.append(dict14)

		var dict15: [String: String] = [:]
		dict15["name"] = "Dave Smith"
		dict15["status"] = "Received"
		dict15["date"] = "30 Aug"
		dict15["time"] = "5:03 AM"
		dict15["amount"] = "$363"
		transactions.append(dict15)

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

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setChartUI() {

		chartView.delegate = self
		chartView.chartDescription?.enabled = false
		chartView.setScaleEnabled(false)
		chartView.xAxis.enabled = false
		chartView.leftAxis.enabled = false
		chartView.rightAxis.enabled = false
		chartView.legend.enabled = false
		chartView.setViewPortOffsets(left: 0, top: 0, right: 0, bottom: 0)

		let marker = Home1MarkerView()
		marker.chartView = chartView
		marker.minimumSize = CGSize(width: 80, height: 35)
		chartView.marker = marker

		let arrData = [10,12,18,23,25,19,24,16,30,35,38,32,31,19,24,16,30,35,38,32,31]
		self.setDataCount(arrData)

		chartView.animate(xAxisDuration: 2.5)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setDataCount(_ values: [Int]) {

		chartView.data = nil

		let values = (0..<values.count).map { (i) -> ChartDataEntry in
			return ChartDataEntry(x: Double(i+1), y: Double(values[i]))
		}

		let set1 = LineChartDataSet(entries: values, label: "")
		set1.axisDependency = .left
		set1.drawIconsEnabled = false
		set1.setColor(AppColor.Theme)
		set1.setCircleColor(AppColor.Theme)
		set1.lineWidth = 2
		set1.drawCircleHoleEnabled = false
		set1.valueFont = .systemFont(ofSize: 0)
		set1.formLineWidth = 0
		set1.formSize = 0
		set1.mode = .cubicBezier
		set1.drawCirclesEnabled = false
		set1.drawVerticalHighlightIndicatorEnabled = false
		set1.drawHorizontalHighlightIndicatorEnabled = false

		let gradientColors = [AppColor.Theme.withAlphaComponent(0.01).cgColor, AppColor.Theme.withAlphaComponent(0.25).cgColor]
		let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!

		set1.fillAlpha = 1
		set1.fill = Fill(linearGradient: gradient, angle: 90)
		set1.drawFilledEnabled = true

		let data = LineChartData(dataSet: set1)
		data.setValueTextColor(.clear)
		data.setValueFont(.systemFont(ofSize: 0))
		chartView.data = data
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
	@IBAction func actionCalendar(_ sender: UIButton) {

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
extension Home1View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return transactions.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Home1Cell2", for: indexPath) as! Home1Cell2
		cell.bindData(index: indexPath, data: transactions[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 70
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDataSource {

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

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home1Cell1", for: indexPath) as! Home1Cell1
		cell.bindData(data: cards[indexPath.row])
		cell.setCell(isSelected: (selectedCardIndex == indexPath.row))
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		selectedCardIndex = indexPath.row
		collectionView.reloadData()
		collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width-30)*0.75
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

// MARK: - ChartViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: ChartViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func chartViewDidEndPanning(_ chartView: ChartViewBase) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func chartValueNothingSelected(_ chartView: ChartViewBase) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func chartScaled(_ chartView: ChartViewBase, scaleX: CGFloat, scaleY: CGFloat) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func chartTranslated(_ chartView: ChartViewBase, dX: CGFloat, dY: CGFloat) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func chartView(_ chartView: ChartViewBase, animatorDidStop animator: Animator) {

		print(#function)
	}
}
