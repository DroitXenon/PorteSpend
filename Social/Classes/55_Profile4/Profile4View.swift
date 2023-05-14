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
class Profile4View: UIViewController {

	@IBOutlet var imageProfile: UIImageView!
	@IBOutlet var imageVerified: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelType: UILabel!
	@IBOutlet var buttonMessage: UIButton!
	@IBOutlet var buttonAdd: UIButton!
	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var layoutConstraintDescriptionHeight: NSLayoutConstraint!
	@IBOutlet var buttonWebsite: UIButton!
	@IBOutlet var labelPosts: UILabel!
	@IBOutlet var labelFollowers: UILabel!
	@IBOutlet var labelFollowing: UILabel!

	@IBOutlet var labelSharedPostCurrentUser: UILabel!
	@IBOutlet var imageSharedPostProfile: UIImageView!
	@IBOutlet var labelSharedPostUser: UILabel!
	@IBOutlet var imageSharedPostVerified: UIImageView!
	@IBOutlet var labelSharedPostTime: UILabel!
	@IBOutlet var labelSharedPostDescription: UILabel!
	@IBOutlet var layoutConstraintSharedPostDescriptionHeight: NSLayoutConstraint!
	@IBOutlet var labelLike: UILabel!
	@IBOutlet var labelComment: UILabel!
	@IBOutlet var labelShare: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "@appdesignkit"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMore(_:)))

		buttonMessage.layer.borderWidth = 1
		buttonMessage.layer.borderColor = AppColor.Border.cgColor

		buttonAdd.layer.borderWidth = 1
		buttonAdd.layer.borderColor = AppColor.Border.cgColor

		collectionView.register(UINib(nibName: "Profile4Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "Profile4Cell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageProfile.sample("Social", "Couples", 14)
		imageSharedPostProfile.sample("Social", "Couples", 21)
		labelName.text = "App Design Kit"
		labelType.text = "Design Team"
		labelDescription.text = "AppDesignKit is a professional designer team based in New York, USA"
		buttonWebsite.setTitle("related.blog", for: .normal)
		labelPosts.text = "11K"
		labelFollowers.text = "59M"
		labelFollowing.text = "43"

		labelSharedPostCurrentUser.text = "John Smith"
		labelSharedPostUser.text = "Brian Elwood"
		labelSharedPostTime.text = "Yesterday at 18:04"
		labelSharedPostDescription.text = "Without music, life would be\na mistake."
		labelLike.text = "61"
		labelComment.text = "417"
		labelShare.text = "1"
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMessage(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAdd(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionWebsite(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAll(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSharedPostMore(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile4View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return 4
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Profile4Cell", for: indexPath) as! Profile4Cell
		cell.bindData(index: indexPath.item)
		cell.viewMoreImages.isHidden = (indexPath.row != 3)
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile4View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile4View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width-30)
		let height = collectionView.frame.size.height
		return CGSize(width: (width/4), height: height)
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

		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
}
