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
class Profile1View: UIViewController {

	@IBOutlet var pageControl: UIPageControl!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var iamgeVerified: UIImageView!
	@IBOutlet var labelWork: UILabel!
	@IBOutlet var labelPost: UILabel!
	@IBOutlet var labelFollower: UILabel!
	@IBOutlet var labelFollowing: UILabel!
	@IBOutlet var collectionView1: UICollectionView!
	@IBOutlet var collectionView2: UICollectionView!
	@IBOutlet var layoutConstraintCollectionView2Height: NSLayoutConstraint!

	private var sliders = 0
	private var posts = 0

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: pageControl)
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(actionClose(_:)))

		collectionView1.register(UINib(nibName: "Profile1Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "Profile1Cell")
		collectionView2.register(UINib(nibName: "Profile1Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "Profile1Cell")

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

		sliders = 7
		posts = 12
		labelName.text = "Alan Nickerson"
		labelWork.text = "Web UI Designer"
		labelPost.text = "2.3K"
		labelFollower.text = "845"
		labelFollowing.text = "4"

		DispatchQueue.main.async {
			self.collectionView2.reloadData()
			self.layoutConstraintCollectionView2Height.constant = self.collectionView2.contentSize.height
		}

		pageControl.currentPage = 0
		pageControl.numberOfPages = sliders
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionClose(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFollow(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMessage(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile1View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionView1) { return sliders }
		if (collectionView == collectionView2) { return posts }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionView1) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Profile1Cell", for: indexPath) as! Profile1Cell
			cell.bindData(index: indexPath.item)
			return cell
		}

		if (collectionView == collectionView2) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Profile1Cell", for: indexPath) as! Profile1Cell
			cell.bindData(index: indexPath.item + 10)
			return cell
		}
		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile1View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile1View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		if (collectionView == collectionView1) { return collectionView.frame.size }

		if (collectionView == collectionView2) {
			let width = (collectionView.frame.size.width-3)/3
			return CGSize(width: width, height: width)
		}

		return CGSize.zero
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionView1) { return 0	}
		if (collectionView == collectionView2) { return 1	}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionView1) { return 0	}
		if (collectionView == collectionView2) { return 1	}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets.zero
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Profile1View: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidScroll(_ scrollView: UIScrollView) {

		if scrollView.tag == 11 {
			if let navController = navigationController as? NavigationController {
				if (scrollView.contentOffset.y > collectionView1.frame.size.height/0.8) {
					navController.setBackground(color: .systemBackground)
				} else {
					navController.setBackground(color: .clear)
				}
			}
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

		if scrollView == collectionView1 {
			let visibleRect = CGRect(origin: collectionView1.contentOffset, size: collectionView1.bounds.size)
			let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

			if let visibleIndexPath = collectionView1.indexPathForItem(at: visiblePoint) {
				pageControl.currentPage = visibleIndexPath.row
			}
		}
	}
}
