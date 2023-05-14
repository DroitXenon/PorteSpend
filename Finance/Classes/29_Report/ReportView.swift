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
class ReportView: UIViewController {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var buttonProfile: UIButton!
	@IBOutlet var segmentedControl: UISegmentedControl!
	@IBOutlet var chartView: BarChartView!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!

	private var categories: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.isHidden = true
		navigationController?.navigationItem.largeTitleDisplayMode = .never
		navigationController?.navigationBar.prefersLargeTitles = false

		tableView.register(UINib(nibName: "ReportCell", bundle: Bundle.main), forCellReuseIdentifier: "ReportCell")

		loadData()
		setChartUI()
		updateUI()
		layoutConstraintTableViewHeight.constant = CGFloat((70 * categories.count) + 35)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)
		updateUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelSubTitle.text = "Long Sample Text"

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
	func updateUI() {

		let background = UIColor.systemBackground.image(segmentedControl.frame.size)
		let selected = AppColor.Theme.image(segmentedControl.frame.size)

		segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
		segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], for: .normal)
		segmentedControl.setBackgroundImage(background, for: .normal, barMetrics: .default)
		segmentedControl.setBackgroundImage(selected, for: .selected, barMetrics: .default)
		segmentedControl.setDividerImage(UIColor.clear.image(), forLeftSegmentState: .normal, rightSegmentState: [.normal, .highlighted, .selected], barMetrics: .default)
		segmentedControl.layer.borderWidth = 1
		segmentedControl.layer.borderColor = AppColor.Theme.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setChartUI() {

		chartView.delegate = self
		chartView.chartDescription?.enabled = false
		chartView.drawBarShadowEnabled = false
		chartView.legend.enabled = false
		chartView.leftAxis.enabled = false
		chartView.rightAxis.drawAxisLineEnabled = false
		chartView.xAxis.enabled = false
		chartView.setViewPortOffsets(left: 0, top: 0, right: 25, bottom: 0)

		let marker = ReportMarkerView()
		marker.chartView = chartView
		marker.minimumSize = CGSize(width: 80, height: 35)
		chartView.marker = marker

		let arrData1 = [5000, 480, 6800, 10000, 2300]
		let arrData2 = [2500, 4500, 960, 9000, 4600]
		self.setDataCount(arrData1, arrData2)

		chartView.animate(xAxisDuration: 3, yAxisDuration: 3)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setDataCount(_ values1: [Int], _ values2: [Int]) {

		let groupSpace = 1.0
		let barSpace = 0.05
		let barWidth = 0.5

		chartView.data = nil
		let yValues1 = (0..<values1.count).map { (i) -> ChartDataEntry in
			return BarChartDataEntry(x: Double(i+1), y: Double(values1[i]))
		}

		let yValues2 = (0..<values2.count).map { (i) -> ChartDataEntry in
			return BarChartDataEntry(x: Double(i+1), y: Double(values2[i]))
		}

		let set1 = BarChartDataSet(entries: yValues1, label: "")
		set1.valueTextColor = .clear
		set1.setColor(AppColor.Theme.withAlphaComponent(1.0))
		set1.highlightColor = .black
		set1.highlightAlpha = 0.5

		let set2 = BarChartDataSet(entries: yValues2, label: "")
		set2.valueTextColor = .clear
		set2.setColor(AppColor.Theme.withAlphaComponent(0.5))
		set2.highlightColor = .black
		set2.highlightAlpha = 0.5

		let data = BarChartData(dataSets: [set1, set2])
		data.setValueFont(.systemFont(ofSize: 10, weight: .light))
		data.setValueFormatter(LargeValueFormatter())
		data.barWidth = barWidth
		chartView.xAxis.axisMinimum = Double(1)
		chartView.xAxis.axisMaximum = Double(1) + data.groupWidth(groupSpace: groupSpace, barSpace: barSpace) * Double(values1.count)
		data.groupBars(fromX: Double(1), groupSpace: groupSpace, barSpace: barSpace)

		chartView.data = data
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionProfile(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSegmentChange(_ sender: UISegmentedControl) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ReportView: UITableViewDataSource {

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

		let cell = tableView.dequeueReusableCell(withIdentifier: "ReportCell", for: indexPath) as! ReportCell
		cell.bindData(index: indexPath, data: categories[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ReportView: UITableViewDelegate {

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
		dismiss(animated: true)
	}
}

// MARK: - ChartViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ReportView: ChartViewDelegate {

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

// MARK: - UIColor
//-----------------------------------------------------------------------------------------------------------------------------------------------
fileprivate extension UIColor {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {

		return UIGraphicsImageRenderer(size: size).image { rendererContext in
			setFill()
			rendererContext.fill(CGRect(origin: .zero, size: size))
		}
	}
}
