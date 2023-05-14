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
class Profile2View: UIViewController {

	@IBOutlet var buttonFollow: UIButton!
	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelCategory: UILabel!
	@IBOutlet var labelFollowers: UILabel!
	@IBOutlet var viewRate: UIView!
	@IBOutlet var labelRate: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var labelWeightLoss: UILabel!
	@IBOutlet var labelAerobics: UILabel!
	@IBOutlet var labelSlimming: UILabel!
	@IBOutlet var labelZumba: UILabel!
	@IBOutlet var collectionView: UICollectionView!

	private var tranings: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never
		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonFollow)

		collectionView.register(UINib(nibName: "Profile2Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "Profile2Cell")
		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)
		if let navController = navigationController as? NavigationController {
			navController.setBackground(color: .clear)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)
		if let navController = navigationController as? NavigationController {
			navController.setNavigationBar()
		}
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageViewProfile.sample("Fitness", "ManPower", 25)
		labelTitle.text = "Josie Weber"
		labelCategory.text = "GYM"
		labelFollowers.text = "23.3K followers"
		labelRate.text = "4.9"
		labelDescription.text = "Your study of the moon, like anything else, can go from the simple to the very complex. To gaze at the moon with the naked eye, making."
		labelWeightLoss.text = "Weight Loss"
		labelAerobics.text = "Aerobics"
		labelSlimming.text = "Slimming"
		labelZumba.text = "Zumba"

		tranings.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Push-up"
		dict1["time"] = "73 hours"
		dict1["rate"] = "3.1"
		tranings.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Bent Knee Push-up"
		dict2["time"] = "70 hours"
		dict2["rate"] = "4.5"
		tranings.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Downward-facing Dog"
		dict3["time"] = "74 hours"
		dict3["rate"] = "5.0"
		tranings.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Push-up with Single-leg Raise"
		dict4["time"] = "61 hours"
		dict4["rate"] = "4.7"
		tranings.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Supermans"
		dict5["time"] = "83 hours"
		dict5["rate"] = "3.9"
		tranings.append(dict5)

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFollow(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAll(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UICollectionViewDataSources
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile2View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return tranings.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Profile2Cell", for: indexPath) as! Profile2Cell
		cell.bindData(index: indexPath, data: tranings[indexPath.row])
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile2View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile2View: UICollectionViewDelegateFlowLayout {

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
