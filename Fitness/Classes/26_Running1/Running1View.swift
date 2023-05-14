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
class Running1View: UIViewController {

	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var buttonMon: UIButton!
	@IBOutlet var buttonTue: UIButton!
	@IBOutlet var buttonWed: UIButton!
	@IBOutlet var buttonThu: UIButton!
	@IBOutlet var buttonFri: UIButton!
	@IBOutlet var buttonSat: UIButton!
	@IBOutlet var buttonSun: UIButton!
	@IBOutlet var chartView: BarChartView!
	@IBOutlet var labelDistance: UILabel!
	@IBOutlet var labelCalBurned: UILabel!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!

	private var activities: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Running"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(actionShare(_:)))

		tableView.register(UINib(nibName: "Running1Cell", bundle: Bundle.main), forCellReuseIdentifier: "Running1Cell")
		loadData()
		layoutConstraintTableViewHeight.constant = CGFloat(110 * activities.count)
		updateDay(buttonMon)
		setChartUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelSubTitle.text = "4 / 15 reps"
		labelDistance.text = "16 km"
		labelCalBurned.text = "786 kcal"
		labelTime.text = "00:42:11"

		activities.removeAll()

		var dict1: [String: String] = [:]
		dict1["activity"] = "Running"
		dict1["distance"] = "8.6"
		dict1["activeTime"] = "3:07:07"
		dict1["calories"] = "1784"
		activities.append(dict1)

		var dict2: [String: String] = [:]
		dict2["activity"] = "Cycling"
		dict2["distance"] = "5.2"
		dict2["activeTime"] = "5:25:22"
		dict2["calories"] = "2357"
		activities.append(dict2)

		var dict3: [String: String] = [:]
		dict3["activity"] = "Swimming"
		dict3["distance"] = "7.9"
		dict3["activeTime"] = "4:00:16"
		dict3["calories"] = "1744"
		activities.append(dict3)

		var dict4: [String: String] = [:]
		dict4["activity"] = "Brisk walking"
		dict4["distance"] = "5.5"
		dict4["activeTime"] = "1:27:46"
		dict4["calories"] = "2456"
		activities.append(dict4)

		var dict5: [String: String] = [:]
		dict5["activity"] = "Rollerblading"
		dict5["distance"] = "9.9"
		dict5["activeTime"] = "4:04:21"
		dict5["calories"] = "1585"
		activities.append(dict5)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateDay(_ button: UIButton) {

		buttonMon.isSelected = false
		buttonTue.isSelected = false
		buttonWed.isSelected = false
		buttonThu.isSelected = false
		buttonFri.isSelected = false
		buttonSat.isSelected = false
		buttonSun.isSelected = false

		buttonMon.backgroundColor = UIColor.clear
		buttonTue.backgroundColor = UIColor.clear
		buttonWed.backgroundColor = UIColor.clear
		buttonThu.backgroundColor = UIColor.clear
		buttonFri.backgroundColor = UIColor.clear
		buttonSat.backgroundColor = UIColor.clear
		buttonSun.backgroundColor = UIColor.clear

		button.isSelected = true
		button.backgroundColor = AppColor.Theme
	}

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
		xAxis.valueFormatter = Running1DateValueFormatter()
		xAxis.labelTextColor = .lightGray

		let arrData = [500,650,480,320,1100,540,967,678,240,480,320,1100,540,967,678,460]
		self.setDataCount(arrData)

		chartView.animate(xAxisDuration: 3, yAxisDuration: 3)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setDataCount(_ values: [Int]) {

		chartView.data = nil
		let yValues = (0..<values.count).map { (i) -> ChartDataEntry in
			return BarChartDataEntry(x: Double(i+1), y: Double(values[i]))
		}

		let set = BarChartDataSet(entries: yValues, label: "")
		set.valueTextColor = .clear
		set.colors = [UIColor.lightGray, UIColor.lightGray, UIColor.lightGray, AppColor.Theme.withAlphaComponent(0.6), AppColor.Theme.withAlphaComponent(0.6), AppColor.Theme.withAlphaComponent(0.6)]
		set.highlightColor = AppColor.Theme
		set.highlightAlpha = 1.0

		let data = BarChartData(dataSet: set)
		data.setValueFont(.systemFont(ofSize: 10, weight: .light))
		data.barWidth = 0.7

		chartView.data = data
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShare(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionDays(_ sender: UIButton) {

		print(#function)
		updateDay(sender)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllStatistics(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllActivities(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Running1View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return activities.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Running1Cell", for: indexPath) as! Running1Cell
		cell.bindData(data: activities[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Running1View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 110
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

// MARK: - ChartViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Running1View: ChartViewDelegate {

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
