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
class CoinView: UIViewController {

	@IBOutlet var viewTitle: UIView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var viewSubInfo: UIView!
	@IBOutlet var labelSubInfo: UILabel!
	@IBOutlet var buttonBuy: UIButton!

	@IBOutlet var labelAmount: UILabel!
	@IBOutlet var labelValue: UILabel!
	@IBOutlet var labelPercentage: UILabel!

	@IBOutlet var segmentedControl: UISegmentedControl!
	@IBOutlet var chartView: LineChartView!

	@IBOutlet var labelMarketCap1: UILabel!
	@IBOutlet var labelMarketCap2: UILabel!
	@IBOutlet var labelVolume1: UILabel!
	@IBOutlet var labelVolume2: UILabel!
	@IBOutlet var labelCirculatingSupply1: UILabel!
	@IBOutlet var labelCirculatingSupply2: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationItem.largeTitleDisplayMode = .never
		navigationController?.navigationBar.prefersLargeTitles = false

		navigationItem.titleView = viewTitle
		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonBuy)

		viewSubInfo.layer.borderWidth = 1
		viewSubInfo.layer.borderColor = AppColor.Border.cgColor

		loadData()
		setChartUI()
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)
		updateUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelTitle.text = "Bitcoin"
		labelSubInfo.text = "BTC"

		labelAmount.text = "$4500.50"
		labelValue.text = "0.651995028 BTC"
		labelPercentage.text = "-0.09%"

		labelMarketCap1.text = "$126,588,346,159 USD"
		labelMarketCap2.text = "18,339,075 BTC"
		labelVolume1.text = "$31,692,457,818 USD"
		labelVolume2.text = "4,591,342 BTC"
		labelCirculatingSupply1.text = "18,339,075 BTC"
		labelCirculatingSupply2.text = "21,000,000 BTC"
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
		chartView.setScaleEnabled(false)
		chartView.leftAxis.enabled = false
		chartView.rightAxis.enabled = false
		chartView.legend.enabled = false
		chartView.setViewPortOffsets(left: 0, top: 0, right: 0, bottom: 0)

		let xAxis = chartView.xAxis
		xAxis.axisLineWidth = .zero

		let marker = CoinMarkerView()
		marker.chartView = chartView
		marker.minimumSize = CGSize(width: 80, height: 35)
		chartView.marker = marker

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
	@IBAction func actionBuy(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSegmentChange(_ sender: UISegmentedControl) {

		print(#function)
	}
}

// MARK: - ChartViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CoinView: ChartViewDelegate {

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
