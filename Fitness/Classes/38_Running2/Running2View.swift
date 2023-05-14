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
class Running2View: UIViewController {

	@IBOutlet var labelDistance: UILabel!
	@IBOutlet var labelCalBurned: UILabel!
	@IBOutlet var labelTime: UILabel!

	@IBOutlet var chartView: LineChartView!

	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!

	private var history: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Running"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(actionShare(_:)))

		tableView.register(UINib(nibName: "Running2Cell", bundle: Bundle.main), forCellReuseIdentifier: "Running2Cell")
		loadData()
		layoutConstraintTableViewHeight.constant = CGFloat(45 * history.count)
		setChartUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelDistance.text = "16.5 km"
		labelCalBurned.text = "1678 kcal"
		labelTime.text = "42:11"

		history.removeAll()

		var dict1: [String: String] = [:]
		dict1["date"] = "Today"
		dict1["varient"] = "500"
		dict1["km"] = "16.5"
		dict1["isPlus"] = "Plus"
		history.append(dict1)

		var dict2: [String: String] = [:]
		dict2["date"] = "Yesterday"
		dict2["varient"] = "800"
		dict2["km"] = "16"
		dict2["isPlus"] = "Plus"
		history.append(dict2)

		var dict3: [String: String] = [:]
		dict3["date"] = "Tue, Apr 21"
		dict3["varient"] = "600"
		dict3["km"] = "15.2"
		dict3["isPlus"] = "Minus"
		history.append(dict3)

		var dict4: [String: String] = [:]
		dict4["date"] = "Mon, Apr 20"
		dict4["varient"] = "300"
		dict4["km"] = "15.8"
		dict4["isPlus"] = "Minus"
		history.append(dict4)

		var dict5: [String: String] = [:]
		dict5["date"] = "Sun, Apr 19"
		dict5["varient"] = "700"
		dict5["km"] = "16.1"
		dict5["isPlus"] = "Plus"
		history.append(dict5)

		var dict6: [String: String] = [:]
		dict6["date"] = "Sat, Apr 18"
		dict6["varient"] = "500"
		dict6["km"] = "15.4"
		dict6["isPlus"] = "Minus"
		history.append(dict6)

		var dict7: [String: String] = [:]
		dict7["date"] = "Fri, Apr 17"
		dict7["varient"] = "300"
		dict7["km"] = "15.9"
		dict7["isPlus"] = "Minus"
		history.append(dict7)

		var dict8: [String: String] = [:]
		dict8["date"] = "Thu, Apr 16"
		dict8["varient"] = "600"
		dict8["km"] = "16.2"
		dict8["isPlus"] = "Plus"
		history.append(dict8)

		var dict9: [String: String] = [:]
		dict9["date"] = "Wed, Apr 15"
		dict9["varient"] = "400"
		dict9["km"] = "15.6"
		dict9["isPlus"] = "Minus"
		history.append(dict9)

		var dict10: [String: String] = [:]
		dict10["date"] = "Tue, Apr 14"
		dict10["varient"] = "300"
		dict10["km"] = "16"
		dict10["isPlus"] = "Plus"
		history.append(dict10)
		
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
		chartView.rightAxis.enabled = false
		chartView.legend.enabled = false
		chartView.isUserInteractionEnabled = false
		chartView.setViewPortOffsets(left: 0, top: 0, right: 0, bottom: 25)

		let xAxis = chartView.xAxis
		xAxis.labelPosition = .bottom
		xAxis.gridColor = .lightGray
		xAxis.drawAxisLineEnabled = false
		xAxis.valueFormatter = Running2DateValueFormatter()
		xAxis.labelTextColor = .lightGray

		let arrData1 = [500,520,510,430,480,450,600,400,430,200,320,280,350,250,380,460,300]
		let arrData2 = [180,185,175,150,180,170,210,300,250,480,450,320,500,470,550,530,510]
		self.setDataCount(arrData1, arrData2)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setDataCount(_ values1: [Int], _ values2: [Int]) {

		chartView.data = nil

		let yValues1 = (0..<values1.count).map { (i) -> ChartDataEntry in
			return ChartDataEntry(x: Double(i+1), y: Double(values1[i]))
		}

		let yValues2 = (0..<values2.count).map { (i) -> ChartDataEntry in
			return BarChartDataEntry(x: Double(i+1), y: Double(values2[i]))
		}

		let set1 = LineChartDataSet(entries: yValues1, label: "")
		set1.axisDependency = .left
		set1.drawIconsEnabled = false
		set1.setColor(AppColor.Theme)
		set1.setCircleColor(AppColor.Theme)
		set1.lineWidth = 2
		set1.drawCircleHoleEnabled = false
		set1.valueFont = .systemFont(ofSize: 0)
		set1.mode = .cubicBezier
		set1.drawCirclesEnabled = false
		set1.drawVerticalHighlightIndicatorEnabled = false
		set1.drawHorizontalHighlightIndicatorEnabled = false

		let set1GradientColors = [AppColor.Theme.withAlphaComponent(0.01).cgColor,
							  AppColor.Theme.withAlphaComponent(0.25).cgColor]
		let set1Gradient = CGGradient(colorsSpace: nil, colors: set1GradientColors as CFArray, locations: nil)!
		set1.fillAlpha = 1
		set1.fill = Fill(linearGradient: set1Gradient, angle: 90)
		set1.drawFilledEnabled = true

		let set2 = LineChartDataSet(entries: yValues2, label: "")
		set2.axisDependency = .left
		set2.drawIconsEnabled = false
		set2.setColor(UIColor.systemGray)
		set2.setCircleColor(UIColor.systemGray)
		set2.lineWidth = 2
		set2.drawCircleHoleEnabled = false
		set2.valueFont = .systemFont(ofSize: 0)
		set2.mode = .cubicBezier
		set2.drawCirclesEnabled = false
		set2.drawVerticalHighlightIndicatorEnabled = false
		set2.drawHorizontalHighlightIndicatorEnabled = false

		let set2GradientColors = [UIColor.systemGray.withAlphaComponent(0.01).cgColor, UIColor.systemGray.withAlphaComponent(0.25).cgColor]
		let set2Gradient = CGGradient(colorsSpace: nil, colors: set2GradientColors as CFArray, locations: nil)!
		set2.fillAlpha = 1
		set2.fill = Fill(linearGradient: set2Gradient, angle: 90)
		set2.drawFilledEnabled = true

		let data = LineChartData(dataSets: [set1, set2])
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
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Running2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return history.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Running2Cell", for: indexPath) as! Running2Cell
		cell.bindData(data: history[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Running2View: UITableViewDelegate {

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
extension Running2View: ChartViewDelegate {

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
