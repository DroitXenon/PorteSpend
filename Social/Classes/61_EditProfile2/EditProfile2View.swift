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
class EditProfile2View: UIViewController {

	@IBOutlet var imageProfile: UIImageView!
	@IBOutlet var buttonProfile: UIButton!
	@IBOutlet var imageCover: UIImageView!
	@IBOutlet var buttonCover: UIButton!

	@IBOutlet var textFieldName: UITextField!
	@IBOutlet var textFieldUsername: UITextField!
	@IBOutlet var textFieldWebsite: UITextField!
	@IBOutlet var textFieldBio: UITextField!

	@IBOutlet var textFieldEmail: UITextField!
	@IBOutlet var textFieldPhone: UITextField!
	@IBOutlet var textFieldGender: UITextField!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Edit Profile"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		buttonProfile.layer.borderWidth = 1
		buttonProfile.layer.borderColor = AppColor.Border.cgColor

		buttonCover.layer.borderWidth = 1
		buttonCover.layer.borderColor = AppColor.Border.cgColor

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(actionDone(_:)))

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageProfile.sample("Social", "Profiles", 2)
		imageCover.sample("Social", "Party", 13)
		textFieldName.text = "John Smith"
		textFieldUsername.text = "johnsmith"
		textFieldWebsite.text = "related.blog"
		textFieldBio.text = "UI/UX Designer at App Design Kit"
		textFieldEmail.text = "info@related.blog"
		textFieldPhone.text = "+1(513)616-5999"
		textFieldGender.text = "Male"
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionDone(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionChangePhoto1(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionChangePhoto2(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionGender(_ sender: UIButton) {

		print(#function)
	}
}
