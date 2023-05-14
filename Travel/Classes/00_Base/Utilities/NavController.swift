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
class NavigationController: UINavigationController {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationBar.barTintColor = UIColor.systemBackground
		navigationBar.tintColor = AppColor.Theme
		navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label,
											 NSAttributedString.Key.font: UIFont(name: "AvenirNext-DemiBold", size: 16.0)!]
		navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label,
												  NSAttributedString.Key.font: UIFont(name: "AvenirNext-DemiBold", size: 32.0)!]
		navigationBar.shadowImage = UIImage()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override var preferredStatusBarStyle: UIStatusBarStyle {

		return .default
	}
}
