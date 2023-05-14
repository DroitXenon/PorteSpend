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
class Profile1View: UIViewController {

	@IBOutlet var imageViewUser: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var buttonProfile: UIButton!
	@IBOutlet var labelSteps: UILabel!
	@IBOutlet var labelWeight: UILabel!
	@IBOutlet var chartView: LineChartView!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var labelNutrition: UILabel!
	@IBOutlet var labelWater: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!

	private var badges: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.isHidden = true
		navigationController?.navigationItem.largeTitleDisplayMode = .never
		navigationController?.navigationBar.prefersLargeTitles = false

		tableView.register(UINib(nibName: "Profile1Cell", bundle: Bundle.main), forCellReuseIdentifier: "Profile1Cell")
		loadData()
		layoutConstraintTableViewHeight.constant = CGFloat(70 * badges.count)
		setChartUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageViewUser.sample("Social", "Profiles", 14)
		labelTitle.text = "John Smith"
		labelSubTitle.text = "Beginner • Queens, NY"
		labelSteps.text = "8000 steps"
		labelWeight.text = "65 kg"
		labelDescription.text = "Being able to foresee an unfortunate fact of life like death, disasters, illnesses, etc."
		labelNutrition.text = "1800 kcal"
		labelWater.text = "8 glasses"

		badges.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Aqua Master"
		dict1["description"] = "Long Text"
		badges.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Jump Start"
		dict2["description"] = "Long Text"
		badges.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Newbie"
		dict3["description"] = "Long Text"
		badges.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Superstar"
		dict4["description"] = "Long Text"
		badges.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Cruncked"
		dict5["description"] = "Long Text"
		badges.append(dict5)
		
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
		chartView.xAxis.enabled = false
		chartView.leftAxis.enabled = false
		chartView.rightAxis.enabled = false
		chartView.legend.enabled = false
		chartView.isUserInteractionEnabled = false
		chartView.setViewPortOffsets(left: 0, top: 0, right: 0, bottom: 0)

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
	@IBAction func actionProfile(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAll(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile1View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return badges.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Profile1Cell", for: indexPath) as! Profile1Cell
		cell.bindData(data: badges[indexPath.row])
		cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile1View: UITableViewDelegate {

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

// MARK: - ChartViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile1View: ChartViewDelegate {

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
