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
class WeightView: UIViewController {

	@IBOutlet var labelStart: UILabel!
	@IBOutlet var labelTarget: UILabel!
	@IBOutlet var labelLoss: UILabel!
	@IBOutlet var chartView: LineChartView!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!

	private var dailyInfo: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Weight"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(actionShare(_:)))

		tableView.register(UINib(nibName: "WeightCell", bundle: Bundle.main), forCellReuseIdentifier: "WeightCell")
		loadData()
		layoutConstraintTableViewHeight.constant = CGFloat(45 * dailyInfo.count)
		setChartUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelStart.text = "75 kg"
		labelTarget.text = "65 km"
		labelLoss.text = "9.5 kg"
		labelDescription.text = "Being able to foresee an unfortunate fact of life like death, disasters, illnesses, etc."

		dailyInfo.removeAll()

		var dict1: [String: String] = [:]
		dict1["date"] = "Today"
		dict1["varient"] = "500"
		dict1["weight"] = "69.5"
		dict1["isPlus"] = "Plus"
		dailyInfo.append(dict1)

		var dict2: [String: String] = [:]
		dict2["date"] = "Yesterday"
		dict2["varient"] = "800"
		dict2["weight"] = "69"
		dict2["isPlus"] = "Plus"
		dailyInfo.append(dict2)

		var dict3: [String: String] = [:]
		dict3["date"] = "Tue, Apr 21"
		dict3["varient"] = "600"
		dict3["weight"] = "68.2"
		dict3["isPlus"] = "Minus"
		dailyInfo.append(dict3)

		var dict4: [String: String] = [:]
		dict4["date"] = "Mon, Apr 20"
		dict4["varient"] = "300"
		dict4["weight"] = "68.8"
		dict4["isPlus"] = "Minus"
		dailyInfo.append(dict4)

		var dict5: [String: String] = [:]
		dict5["date"] = "Sun, Apr 19"
		dict5["varient"] = "700"
		dict5["weight"] = "69.1"
		dict5["isPlus"] = "Plus"
		dailyInfo.append(dict5)

		var dict6: [String: String] = [:]
		dict6["date"] = "Sat, Apr 18"
		dict6["varient"] = "500"
		dict6["weight"] = "68.4"
		dict6["isPlus"] = "Minus"
		dailyInfo.append(dict6)

		var dict7: [String: String] = [:]
		dict7["date"] = "Fri, Apr 17"
		dict7["varient"] = "300"
		dict7["weight"] = "68.9"
		dict7["isPlus"] = "Minus"
		dailyInfo.append(dict7)

		var dict8: [String: String] = [:]
		dict8["date"] = "Thu, Apr 16"
		dict8["varient"] = "600"
		dict8["weight"] = "69.2"
		dict8["isPlus"] = "Plus"
		dailyInfo.append(dict8)

		var dict9: [String: String] = [:]
		dict9["date"] = "Wed, Apr 15"
		dict9["varient"] = "400"
		dict9["weight"] = "68.6"
		dict9["isPlus"] = "Minus"
		dailyInfo.append(dict9)

		var dict10: [String: String] = [:]
		dict10["date"] = "Tue, Apr 14"
		dict10["varient"] = "300"
		dict10["weight"] = "69"
		dict10["isPlus"] = "Plus"
		dailyInfo.append(dict10)

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
		chartView.setScaleEnabled(false)
		chartView.leftAxis.enabled = false
		chartView.legend.enabled = false
		chartView.isUserInteractionEnabled = false
		chartView.setViewPortOffsets(left: 0, top: 0, right: 0, bottom: 0)

		let rightAxis = chartView.rightAxis
		rightAxis.gridColor = .lightGray

		let xAxis = chartView.xAxis
		xAxis.drawAxisLineEnabled = false
		xAxis.drawGridLinesEnabled = false

		let arrData = [10,12,18,23,25,19,24,16,30,35,38,32,31,19,24,16,30,35,38,32,31]
		self.setDataCount(arrData)
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
		set1.mode = .linear
		set1.drawCirclesEnabled = false
		set1.drawVerticalHighlightIndicatorEnabled = false
		set1.drawHorizontalHighlightIndicatorEnabled = false

		let gradientColors = [AppColor.Theme.withAlphaComponent(0.01).cgColor,
							  AppColor.Theme.withAlphaComponent(0.25).cgColor]
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
	@objc func actionShare(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAll(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddWeight(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension WeightView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return dailyInfo.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "WeightCell", for: indexPath) as! WeightCell
		cell.bindData(data: dailyInfo[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension WeightView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 45
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

// MARK: - ChartViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension WeightView: ChartViewDelegate {

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
