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
class MonthlyReportView: UIViewController {

	@IBOutlet var labelMonth: UILabel!
	@IBOutlet var chartView: PieChartView!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!

	private var categories: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Monthly Report"
		navigationController?.navigationItem.largeTitleDisplayMode = .always
		navigationController?.navigationBar.prefersLargeTitles = true

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(actionSearch(_:)))

		tableView.register(UINib(nibName: "MonthlyReportCell", bundle: Bundle.main), forCellReuseIdentifier: "MonthlyReportCell")

		loadData()
		setChartUI()
		layoutConstraintTableViewHeight.constant = CGFloat((70 * categories.count) + 35)
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelMonth.text = "March 2020"

		categories.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Mobile Services"
		dict1["description"] = "T-Mobile, Telia"
		dict1["amount"] = "$124"
		categories.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Transport"
		dict2["description"] = "Uber, Gett, Lyft"
		dict2["amount"] = "$655"
		categories.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Ecommerce"
		dict3["description"] = "Ebay, Amazon, Aliexpress"
		dict3["amount"] = "$1240"
		categories.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Food"
		dict4["description"] = "McDonald's, Starbucks, Subway"
		dict4["amount"] = "$1172"
		categories.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Recreation & Entertainment"
		dict5["description"] = "Hulu, Netflix, Amazon Prime"
		dict5["amount"] = "$522"
		categories.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Utilities"
		dict6["description"] = "Electricity, Water, Garbage"
		dict6["amount"] = "$990"
		categories.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "Medical/Healthcare"
		dict7["description"] = "Primary care, Dental care"
		dict7["amount"] = "$695"
		categories.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Insurance"
		dict8["description"] = "Health, Life, Auto"
		dict8["amount"] = "$1497"
		categories.append(dict8)

		var dict9: [String: String] = [:]
		dict9["name"] = "Education"
		dict9["description"] = "Children’s college"
		dict9["amount"] = "$643"
		categories.append(dict9)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setChartUI() {

		chartView.delegate = self
		chartView.chartDescription?.enabled = false
		chartView.drawEntryLabelsEnabled = false
		chartView.usePercentValuesEnabled = false
		chartView.drawCenterTextEnabled = false
		chartView.legend.enabled = false
		chartView.transparentCircleColor = .clear
		chartView.holeColor = UIColor.systemBackground

		let marker = MonthlyReportMarkerView()
		marker.chartView = chartView
		marker.minimumSize = CGSize(width: 80, height: 35)
		chartView.marker = marker

		let arrData = [60,34,40]
		self.setDataCount(arrData)

		chartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setDataCount(_ values: [Int]) {

		chartView.data = nil
		let values = (0..<values.count).map { (i) -> ChartDataEntry in
			return PieChartDataEntry(value: Double(values[i]), label: "")
		}

		let set = PieChartDataSet(entries: values, label: "")
		set.drawIconsEnabled = false
		set.sliceSpace = 0

		set.colors = [AppColor.Theme.withAlphaComponent(1.0), AppColor.Theme.withAlphaComponent(0.6), AppColor.Theme.withAlphaComponent(0.3)]

		let data = PieChartData(dataSet: set)
		data.setValueTextColor(UIColor.clear)
		chartView.data = data
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSearch(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCalendar(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension MonthlyReportView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return categories.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "MonthlyReportCell", for: indexPath) as! MonthlyReportCell
		cell.bindData(index: indexPath, data: categories[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension MonthlyReportView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 70
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 35
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		return "Categories"
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

// MARK: - ChartViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension MonthlyReportView: ChartViewDelegate {

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
