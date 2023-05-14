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
extension UINavigationItem {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setTitle(_ title: String, subtitle: String, color: UIColor?) {

		let appearance = UINavigationBar.appearance()
		let textColor = color ?? (appearance.titleTextAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor ?? .label)

		let titleLabel = UILabel()
		titleLabel.text = title
		titleLabel.font = .preferredFont(forTextStyle: UIFont.TextStyle.headline)
		titleLabel.textColor = textColor

		let subtitleLabel = UILabel()
		subtitleLabel.text = subtitle
		subtitleLabel.font = .preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
		subtitleLabel.textColor = textColor.withAlphaComponent(0.75)

		let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
		stackView.distribution = .equalCentering
		stackView.alignment = .center
		stackView.axis = .vertical

		titleView = stackView
	}
}
