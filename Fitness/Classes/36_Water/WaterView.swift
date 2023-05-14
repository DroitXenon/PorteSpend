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
class WaterView: UIViewController {

	@IBOutlet var labelDrank: UILabel!
	@IBOutlet var labelGlasses: UILabel!

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var layoutConstraintCollectionViewHeight: NSLayoutConstraint!
	@IBOutlet var labelReminder: UILabel!

	@IBOutlet var labelMon: UILabel!
	@IBOutlet var labelTue: UILabel!
	@IBOutlet var labelWed: UILabel!
	@IBOutlet var labelThu: UILabel!
	@IBOutlet var labelFri: UILabel!
	@IBOutlet var labelSat: UILabel!
	@IBOutlet var labelSun: UILabel!

	@IBOutlet var viewMon: WaterProgressView!
	@IBOutlet var viewTue: WaterProgressView!
	@IBOutlet var viewWed: WaterProgressView!
	@IBOutlet var viewThu: WaterProgressView!
	@IBOutlet var viewFri: WaterProgressView!
	@IBOutlet var viewSat: WaterProgressView!
	@IBOutlet var viewSun: WaterProgressView!

	@IBOutlet var labelTodayML: UILabel!
	@IBOutlet var labelTodayGlasses: UILabel!
	@IBOutlet var labelYesterdayML: UILabel!
	@IBOutlet var labelYesterdayGlasses: UILabel!

	private var glasses: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Water"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(actionShare(_:)))

		collectionView.register(UINib(nibName: "WaterCell", bundle: Bundle.main), forCellWithReuseIdentifier: "WaterCell")
		[viewMon, viewTue, viewWed, viewThu, viewFri, viewSat, viewSun].forEach { (view) in
			view!.trackColor = AppColor.Theme.withAlphaComponent(0.2)
			view!.progressColor = AppColor.Theme
		}
		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelDrank.text = "610 ml"
		labelGlasses.text = "8 glasses"

		labelReminder.text = "Every 2 hours"

		labelMon.text = "2"
		labelTue.text = "3"
		labelWed.text = "4"
		labelThu.text = "5"
		labelFri.text = "6"
		labelSat.text = "7"
		labelSun.text = "8"

		viewMon.setProgress(0.2)
		viewTue.setProgress(0.3)
		viewWed.setProgress(0.4)
		viewThu.setProgress(0.5)
		viewFri.setProgress(0.6)
		viewSat.setProgress(0.7)
		viewSun.setProgress(0.8)

		labelTodayML.text = "610 ml"
		labelTodayGlasses.text = "2 glasses"
		labelYesterdayML.text = "1480 ml"
		labelYesterdayGlasses.text = "6 glasses"

		glasses.removeAll()

		var dict1: [String: String] = [:]
		dict1["ml"] = "250"
		dict1["totalML"] = "250"
		glasses.append(dict1)

		var dict2: [String: String] = [:]
		dict2["ml"] = "250"
		dict2["totalML"] = "250"
		glasses.append(dict2)

		var dict3: [String: String] = [:]
		dict3["ml"] = "110"
		dict3["totalML"] = "250"
		glasses.append(dict3)

		var dict4: [String: String] = [:]
		dict4["ml"] = "0"
		dict4["totalML"] = "250"
		glasses.append(dict4)

		var dict5: [String: String] = [:]
		dict5["ml"] = "0"
		dict5["totalML"] = "250"
		glasses.append(dict5)

		var dict6: [String: String] = [:]
		dict6["ml"] = "0"
		dict6["totalML"] = "250"
		glasses.append(dict6)

		var dict7: [String: String] = [:]
		dict7["ml"] = "0"
		dict7["totalML"] = "250"
		glasses.append(dict7)

		var dict8: [String: String] = [:]
		dict8["ml"] = "0"
		dict8["totalML"] = "250"
		glasses.append(dict8)

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		DispatchQueue.main.async {
			self.collectionView.reloadData()
			self.layoutConstraintCollectionViewHeight.constant = self.collectionView.contentSize.height
		}
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShare(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionReminder(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMore(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension WaterView: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return glasses.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WaterCell", for: indexPath) as! WaterCell
		cell.bindData(data: glasses[indexPath.row])
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension WaterView: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension WaterView: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width - 75)/4
		return CGSize(width: width, height: 75)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 15
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 15
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
	}
}
