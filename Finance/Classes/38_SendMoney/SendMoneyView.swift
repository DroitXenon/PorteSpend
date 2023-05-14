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
class SendMoneyView: UIViewController {

	@IBOutlet var imageViewUser1: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelCardNumber: UILabel!
	@IBOutlet var imageViewUser2: UIImageView!

	@IBOutlet var collectionView: UICollectionView!

	@IBOutlet var textFieldAmount: UITextField!
	@IBOutlet var labelBankFeeInfo: UILabel!
	@IBOutlet var textViewNote: UITextView!

	private var placeholderLabel = UILabel()
	private var cards: [[String: String]] = []
	private var selectedCardIndex = 0

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Send Money to"
		navigationController?.navigationItem.largeTitleDisplayMode = .always
		navigationController?.navigationBar.prefersLargeTitles = true

		collectionView.register(UINib(nibName: "SendMoneyCell", bundle: Bundle.main), forCellWithReuseIdentifier: "SendMoneyCell")

		placeholderLabel.text = "Note"
		placeholderLabel.font = UIFont.systemFont(ofSize: textViewNote.font!.pointSize)
		placeholderLabel.sizeToFit()
		placeholderLabel.frame.origin = CGPoint(x: 5, y: textViewNote.font!.pointSize / 2)
		placeholderLabel.textColor = UIColor.label
		placeholderLabel.isHidden = !textViewNote.text.isEmpty
		textViewNote.addSubview(placeholderLabel)

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageViewUser1.sample("Finance", "BusinessWomen", 17)
		labelName.text = "Egon Pratt"
		labelCardNumber.text = "**** 9697"
		imageViewUser2.sample("Finance", "BusinessWomen", 18)
		textFieldAmount.text = "150.00"
		labelBankFeeInfo.text = "Bank Fee 2.5%: $1.25 "

		cards.removeAll()

		var dict1: [String: String] = [:]
		dict1["card_number"] = "****7399"
		dict1["card_type"] = "American Express"
		cards.append(dict1)

		var dict2: [String: String] = [:]
		dict2["card_number"] = "****1843"
		dict2["card_type"] = "Visa"
		cards.append(dict2)

		var dict3: [String: String] = [:]
		dict3["card_number"] = "****6092"
		dict3["card_type"] = "Mastercard"
		cards.append(dict3)

		var dict4: [String: String] = [:]
		dict4["card_number"] = "****9194"
		dict4["card_type"] = "Visa"
		cards.append(dict4)

		var dict5: [String: String] = [:]
		dict5["card_number"] = "****9977"
		dict5["card_type"] = "Mastercard"
		cards.append(dict5)

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSend(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SendMoneyView: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return cards.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SendMoneyCell", for: indexPath) as! SendMoneyCell
		cell.bindData(data: cards[indexPath.row])
		cell.setCell(isSelected: (selectedCardIndex == indexPath.row))
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SendMoneyView: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		selectedCardIndex = indexPath.row
		collectionView.reloadData()
		collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SendMoneyView: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width-30)*0.75
		let height = collectionView.frame.size.height-20
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

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SendMoneyView: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

		if (scrollView == collectionView) {
			let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
			let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

			if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
				selectedCardIndex = visibleIndexPath.row
				collectionView.reloadData()
			}
		}
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SendMoneyView: UITextViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func textViewDidChange(_ textView: UITextView) {

		placeholderLabel.isHidden = !textViewNote.text.isEmpty
	}
}
