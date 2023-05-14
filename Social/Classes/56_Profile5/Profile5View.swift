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
class Profile5View: UIViewController {

	@IBOutlet var imageProfile: UIImageView!
	@IBOutlet var labelPosts: UILabel!
	@IBOutlet var labelFollowers: UILabel!
	@IBOutlet var labelFollowing: UILabel!
	@IBOutlet var buttonFollow: UIButton!
	@IBOutlet var buttonMessage: UIButton!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var imageVerified: UIImageView!
	@IBOutlet var labelInfo: UILabel!
	@IBOutlet var buttonTab1: UIButton!
	@IBOutlet var buttonTab2: UIButton!
	@IBOutlet var buttonTab3: UIButton!
	@IBOutlet var imageTab1: UIImageView!
	@IBOutlet var imageTab2: UIImageView!
	@IBOutlet var imageTab3: UIImageView!
	@IBOutlet var viewTab1: UIView!
	@IBOutlet var viewTab2: UIView!
	@IBOutlet var viewTab3: UIView!

	@IBOutlet var collectionView1: UICollectionView!
	@IBOutlet var collectionView2: UICollectionView!
	@IBOutlet var layoutConstraintCollectionView2Height: NSLayoutConstraint!

	private var stories: [String] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "@devin.thomas"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMore(_:)))

		buttonMessage.layer.borderWidth = 1
		buttonMessage.layer.borderColor = AppColor.Border.cgColor

		collectionView1.register(UINib(nibName: "Profile5Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Profile5Cell1")
		collectionView2.register(UINib(nibName: "Profile5Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "Profile5Cell2")

		loadData()
		updateUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		stories = ["Dubai", "Thailand", "Berlin", "Asia", "London", "New York", "Tokyo", "Paris", "Amsterdam"]

		imageProfile.sample("Social", "Work", 6)
		labelPosts.text = "11K"
		labelFollowers.text = "59M"
		labelFollowing.text = "43"
		labelName.text = "Devin Thomas"
		labelInfo.text = "Traveller"

		DispatchQueue.main.async {
			self.collectionView2.reloadData()
			self.layoutConstraintCollectionView2Height.constant = self.collectionView2.contentSize.height
		}

		buttonTab1.isSelected = true
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		imageTab1.tintColor = buttonTab1.isSelected ? AppColor.Theme : UIColor.systemGray
		imageTab2.tintColor = buttonTab2.isSelected ? AppColor.Theme : UIColor.systemGray
		imageTab3.tintColor = buttonTab3.isSelected ? AppColor.Theme : UIColor.systemGray

		viewTab1.backgroundColor = buttonTab1.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
		viewTab2.backgroundColor = buttonTab2.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
		viewTab3.backgroundColor = buttonTab3.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFollow(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMessage(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab1(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = true
		buttonTab2.isSelected = false
		buttonTab3.isSelected = false
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab2(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = false
		buttonTab2.isSelected = true
		buttonTab3.isSelected = false
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab3(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = false
		buttonTab2.isSelected = false
		buttonTab3.isSelected = true
		updateUI()
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile5View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionView1) { return stories.count }
		if (collectionView == collectionView2) { return 20 }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionView1) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Profile5Cell1", for: indexPath) as! Profile5Cell1
			cell.bindData(index: indexPath, name: stories[indexPath.row])
			return cell
		}

		if (collectionView == collectionView2) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Profile5Cell2", for: indexPath) as! Profile5Cell2
			cell.bindData(index: indexPath)
			return cell
		}
		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile5View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile5View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		if (collectionView == collectionView1) { return CGSize(width: 60, height: collectionView.frame.size.height) }

		if (collectionView == collectionView2) {
			let width = (collectionView.frame.size.width-3)/4
			return CGSize(width: width, height: width)
		}

		return CGSize.zero
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionView1) { return 10	}
		if (collectionView == collectionView2) { return 1	}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionView1) { return 10	}
		if (collectionView == collectionView2) { return 1	}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if (collectionView == collectionView1) { return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)	}
		if (collectionView == collectionView2) { return UIEdgeInsets.zero	}

		return UIEdgeInsets.zero
	}
}
