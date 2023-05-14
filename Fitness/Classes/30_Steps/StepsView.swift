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
class StepsView: UIViewController {

	@IBOutlet var viewCircularProgress: StepsCircularProgressView!
	@IBOutlet var labelPercentage: UILabel!
	@IBOutlet var labelSteps: UILabel!
	@IBOutlet var labelCalBurned: UILabel!
	@IBOutlet var labelDailyGoal: UILabel!
	@IBOutlet var chartView: BarChartView!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!

	private var statistics: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Steps"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(actionShare(_:)))

		tableView.register(UINib(nibName: "StepsCell", bundle: Bundle.main), forCellReuseIdentifier: "StepsCell")
		loadData()
		layoutConstraintTableViewHeight.constant = CGFloat(45 * statistics.count) + 55
		setChartUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		viewCircularProgress.setProgress(0.72, duration: 2)
		labelPercentage.text = "72%"
		labelSteps.text = "6890"
		labelCalBurned.text = "1300 kcal"
		labelDailyGoal.text = "8000"

		statistics.removeAll()

		var dict1: [String: String] = [:]
		dict1["date"] = "Thu, Apr 23"
		dict1["steps"] = "9861"
		statistics.append(dict1)

		var dict2: [String: String] = [:]
		dict2["date"] = "Wed, Apr 22"
		dict2["steps"] = "10574"
		statistics.append(dict2)

		var dict3: [String: String] = [:]
		dict3["date"] = "Tue, Apr 21"
		dict3["steps"] = "8589"
		statistics.append(dict3)

		var dict4: [String: String] = [:]
		dict4["date"] = "Mon, Apr 20"
		dict4["steps"] = "12733"
		statistics.append(dict4)

		var dict5: [String: String] = [:]
		dict5["date"] = "Sun, Apr 19"
		dict5["steps"] = "7050"
		statistics.append(dict5)

		var dict6: [String: String] = [:]
		dict6["date"] = "Sat, Apr 18"
		dict6["steps"] = "10882"
		statistics.append(dict6)

		var dict7: [String: String] = [:]
		dict7["date"] = "Fri, Apr 17"
		dict7["steps"] = "9256"
		statistics.append(dict7)
		
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
		chartView.pinchZoomEnabled = false
		chartView.doubleTapToZoomEnabled = false
		chartView.chartDescription?.enabled = false
		chartView.drawBarShadowEnabled = false
		chartView.legend.enabled = false
		chartView.leftAxis.enabled = false
		chartView.rightAxis.enabled = false

		let xAxis = chartView.xAxis
		xAxis.labelPosition = .bottom
		xAxis.labelCount = 7
		xAxis.gridLineWidth = 0
		xAxis.axisLineColor = .clear
		xAxis.valueFormatter = StepsDateValueFormatter()
		xAxis.labelTextColor = .lightGray

		let arrData = [5, 5, 50, 80, 20, 110, 54, 67, 78, 24 ,48, 30, 110, 40, 97, 67, 60]
		self.setDataCount(arrData)

		chartView.animate(xAxisDuration: 3, yAxisDuration: 3)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setDataCount(_ values: [Int]) {

		chartView.data = nil
		var xVal = 0
		let yValues = (0..<values.count).map { (i) -> ChartDataEntry in
			if (xVal == 24) { xVal = 0 }
			xVal += 1
			return BarChartDataEntry(x: Double(xVal), y: Double(values[i]))
		}

		let set = BarChartDataSet(entries: yValues, label: "")
		set.valueTextColor = .clear
		set.colors = [AppColor.Theme]
		set.highlightColor = AppColor.Theme
		set.highlightAlpha = 1.0

		let data = BarChartData(dataSet: set)
		data.setValueFont(.systemFont(ofSize: 10 , weight: .light))
		data.barWidth = 0.7

		chartView.data = data
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShare(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionToday(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension StepsView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return statistics.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "StepsCell", for: indexPath) as! StepsCell
		cell.bindData(data: statistics[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension StepsView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 45
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 55
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		return "Week"
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

// MARK: - ChartViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension StepsView: ChartViewDelegate {

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


