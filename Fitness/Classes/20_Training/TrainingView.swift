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
class TrainingView: UIViewController {

	@IBOutlet var buttonMaster: UIButton!
	@IBOutlet var buttonSkilled: UIButton!
	@IBOutlet var buttonBeginner: UIButton!

	@IBOutlet var viewMaster: UIView!
	@IBOutlet var viewSkilled: UIView!
	@IBOutlet var viewBeginner: UIView!

	@IBOutlet var collectionView1: UICollectionView!
	@IBOutlet var collectionView2: UICollectionView!
	@IBOutlet var collectionView3: UICollectionView!

	private var data1: [[String: String]] = []
	private var data2: [[String: String]] = []
	private var data3: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Training"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(actionShare(_:)))

		collectionView1.register(UINib(nibName: "TrainingCell1", bundle: Bundle.main), forCellWithReuseIdentifier: "TrainingCell1")
		collectionView2.register(UINib(nibName: "TrainingCell2", bundle: Bundle.main), forCellWithReuseIdentifier: "TrainingCell2")
		collectionView3.register(UINib(nibName: "TrainingCell3", bundle: Bundle.main), forCellWithReuseIdentifier: "TrainingCell3")

		buttonMaster.isSelected = true
		updateUI()
		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		data1.removeAll()
		data2.removeAll()
		data3.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Push-up"
		dict1["time"] = "73 hours"
		dict1["rate"] = "3.1"
		data1.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Bent Knee Push-up"
		dict2["time"] = "70 hours"
		dict2["rate"] = "4.5"
		data1.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Downward-facing Dog"
		dict3["time"] = "74 hours"
		dict3["rate"] = "5.0"
		data1.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Push-up with Single-leg Raise"
		dict4["time"] = "61 hours"
		dict4["rate"] = "4.7"
		data1.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Supermans"
		dict5["time"] = "83 hours"
		dict5["rate"] = "3.9"
		data1.append(dict5)

		var dict6: [String: String] = [:]
		dict6["title"] = "Dumbbell rows"
		dict6["time"] = "64 hours"
		data2.append(dict6)

		var dict7: [String: String] = [:]
		dict7["title"] = "Single-leg deadlifts"
		dict7["time"] = "55 hours"
		data2.append(dict7)

		var dict8: [String: String] = [:]
		dict8["title"] = "Side planks"
		dict8["time"] = "85 hours"
		data2.append(dict8)

		var dict9: [String: String] = [:]
		dict9["title"] = "Glute bridge"
		dict9["time"] = "68 hours"
		data2.append(dict9)

		var dict10: [String: String] = [:]
		dict10["title"] = "Chair squat"
		dict10["time"] = "69 hours"
		data2.append(dict10)

		var dict11: [String: String] = [:]
		dict11["title"] = "Glute Bridge"
		dict11["time"] = "54 hours"
		data3.append(dict11)

		var dict12: [String: String] = [:]
		dict12["title"] = "Hip Rotations"
		dict12["time"] = "76 hours"
		data3.append(dict12)

		var dict13: [String: String] = [:]
		dict13["title"] = "Cobra"
		dict13["time"] = "79 hours"
		data3.append(dict13)

		var dict14: [String: String] = [:]
		dict14["title"] = "Supine Reverse Crunches"
		dict14["time"] = "84 hours"
		data3.append(dict14)

		var dict15: [String: String] = [:]
		dict15["title"] = "Forward Lunge with Arm Drivers"
		dict15["time"] = "95 hours"
		data3.append(dict15)

		refreshCollectionView1()
		refreshCollectionView2()
		refreshCollectionView3()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView1() {

		collectionView1.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView2() {

		collectionView2.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView3() {

		self.collectionView3.reloadData()
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		buttonMaster.titleLabel?.textColor = buttonMaster.isSelected ? AppColor.Theme : UIColor.label
		buttonSkilled.titleLabel?.textColor = buttonSkilled.isSelected ? AppColor.Theme : UIColor.label
		buttonBeginner.titleLabel?.textColor = buttonBeginner.isSelected ? AppColor.Theme : UIColor.label

		viewMaster.backgroundColor = buttonMaster.isSelected ? AppColor.Theme : UIColor.tertiarySystemFill
		viewSkilled.backgroundColor = buttonSkilled.isSelected ? AppColor.Theme : UIColor.tertiarySystemFill
		viewBeginner.backgroundColor = buttonBeginner.isSelected ? AppColor.Theme : UIColor.tertiarySystemFill
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShare(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMaster(_ sender: UIButton) {

		print(#function)
		buttonMaster.isSelected = true
		buttonSkilled.isSelected = false
		buttonBeginner.isSelected = false
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSkilled(_ sender: UIButton) {

		print(#function)
		buttonMaster.isSelected = false
		buttonSkilled.isSelected = true
		buttonBeginner.isSelected = false
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionBeginner(_ sender: UIButton) {

		print(#function)
		buttonMaster.isSelected = false
		buttonSkilled.isSelected = false
		buttonBeginner.isSelected = true
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAll(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension TrainingView: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionView1) { return data1.count }
		if (collectionView == collectionView2) { return data2.count }
		if (collectionView == collectionView3) { return data3.count }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionView1) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrainingCell1", for: indexPath) as! TrainingCell1
			cell.bindData(index: indexPath, data: data1[indexPath.row])
			return cell
		}

		if (collectionView == collectionView2) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrainingCell2", for: indexPath) as! TrainingCell2
			cell.bindData(index: indexPath, data: data2[indexPath.row])
			return cell
		}

		if (collectionView == collectionView3) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrainingCell3", for: indexPath) as! TrainingCell3
			cell.bindData(index: indexPath, data: data3[indexPath.row])
			return cell
		}
		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension TrainingView: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		if (collectionView == collectionView1) { }
		if (collectionView == collectionView2) { }
		if (collectionView == collectionView3) { }
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension TrainingView: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width - 40)/2.5
		let height = collectionView.frame.size.height - 20
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
