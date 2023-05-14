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
class BaseView: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var names: [String] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "List of Views"

		navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

		tableView.tableFooterView = UIView()

		names.append("Login1View")
		names.append("Login2View")
		names.append("Login3View")
		names.append("Login4View")
		names.append("SignUp1View")
		names.append("SignUp2View")
		names.append("PhoneView")
		names.append("SecureCodeView")
		names.append("Location1View")
		names.append("Location2View")
		names.append("NotificationView")
		names.append("PasscodeView")
		names.append("PlanView")
		names.append("Walkthrough1View")
		names.append("Walkthrough2View")
		names.append("Walkthrough3View")
		names.append("Walkthrough4View")
		names.append("Walkthrough5View")
		names.append("Home1View")
		names.append("Home2View")
		names.append("Videos1View")
		names.append("Videos2View")
		names.append("Videos3View")
		names.append("Videos4View")
		names.append("Filters1View")
		names.append("Filters2View")
		names.append("Filters3View")
		names.append("FilterCategoryView")
		names.append("SortByView")
		names.append("Video1View")
		names.append("Video2View")
		names.append("Video3View")
		names.append("EditPhotoView")
		names.append("SubscribeView")
		names.append("Channels1View")
		names.append("Channels2View")
		names.append("ChannelView")
		names.append("AccountView")
		names.append("SettingsView")
		names.append("EditProfileView")
		names.append("ChooseGenresView")
		names.append("ChooseArtistsView")
		names.append("Library1View")
		names.append("Library2View")
		names.append("PlaylistsView")
		names.append("ArtistsView")
		names.append("SongsView")
		names.append("AlbumsView")
		names.append("PlaylistView")
		names.append("AlbumView")
		names.append("ChartsSongsView")
		names.append("ChartsAlbumsView")
		names.append("Artist1View")
		names.append("Artist2View")
		names.append("Trending1View")
		names.append("Trending2View")
		names.append("Player1View")
		names.append("Player2View")
		names.append("SongScanView")
		names.append("VoiceRecorderView")
		names.append("CameraView")
		names.append("Video4View")
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension BaseView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return names.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
		if (cell == nil) { cell = UITableViewCell(style: .default, reuseIdentifier: "cell") }

		cell.textLabel?.text = "\(indexPath.row+1). " + names[indexPath.row]

		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension BaseView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)

		switch names[indexPath.row] {

			case "Login1View":
				let login1View = Login1View()
				login1View.isModalInPresentation = true
				login1View.modalPresentationStyle = .fullScreen
				present(login1View, animated: true)

			case "Login2View":
				let login2View = Login2View()
				login2View.isModalInPresentation = true
				login2View.modalPresentationStyle = .fullScreen
				present(login2View, animated: true)

			case "Login3View":
				let login3View = Login3View()
				login3View.isModalInPresentation = true
				login3View.modalPresentationStyle = .fullScreen
				present(login3View, animated: true)

			case "Login4View":
				let login4View = Login4View()
				login4View.isModalInPresentation = true
				login4View.modalPresentationStyle = .fullScreen
				present(login4View, animated: true)

			case "SignUp1View":
				let signUp1View = SignUp1View()
				let navigation = NavigationController(rootViewController: signUp1View)
				navigation.isModalInPresentation = true
				navigation.navigationBar.isTranslucent = false
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "SignUp2View":
				let signUp2View = SignUp2View()
				let navigation = NavigationController(rootViewController: signUp2View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "PhoneView":
				let phoneView = PhoneView()
				navigationController?.pushViewController(phoneView, animated: true)

			case "SecureCodeView":
				let secureCodeView = SecureCodeView()
				navigationController?.pushViewController(secureCodeView, animated: true)

			case "Location1View":
				let location1View = Location1View()
				navigationController?.pushViewController(location1View, animated: true)

			case "Location2View":
				let location2View = Location2View()
				navigationController?.pushViewController(location2View, animated: true)

			case "NotificationView":
				let notificationView = NotificationView()
				let navigation = NavigationController(rootViewController: notificationView)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "PasscodeView":
				let passcodeView = PasscodeView()
				let navigation = NavigationController(rootViewController: passcodeView)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "PlanView":
				let planView = PlanView()
				navigationController?.pushViewController(planView, animated: true)

			case "Walkthrough1View":
				let walkthrough1View = Walkthrough1View()
				let navigation = NavigationController(rootViewController: walkthrough1View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Walkthrough2View":
				let walkthrough2View = Walkthrough2View()
				let navigation = NavigationController(rootViewController: walkthrough2View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Walkthrough3View":
				let walkthrough3View = Walkthrough3View()
				let navigation = NavigationController(rootViewController: walkthrough3View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Walkthrough4View":
				let walkthrough4View = Walkthrough4View()
				walkthrough4View.isModalInPresentation = true
				walkthrough4View.modalPresentationStyle = .fullScreen
				present(walkthrough4View, animated: true)

			case "Walkthrough5View":
				let walkthrough5View = Walkthrough5View()
				walkthrough5View.isModalInPresentation = true
				walkthrough5View.modalPresentationStyle = .fullScreen
				present(walkthrough5View, animated: true)

			case "Home1View":
				let home1View = Home1View()
				let navigation = NavigationController(rootViewController: home1View)
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Home2View":
				let home2View = Home2View()
				navigationController?.pushViewController(home2View, animated: true)

			case "Videos1View":
				let videos1View = Videos1View()
				navigationController?.pushViewController(videos1View, animated: true)

			case "Videos2View":
				let videos2View = Videos2View()
				navigationController?.pushViewController(videos2View, animated: true)

			case "Videos3View":
				let videos3View = Videos3View()
				navigationController?.pushViewController(videos3View, animated: true)

			case "Videos4View":
				let videos4View = Videos4View()
				navigationController?.pushViewController(videos4View, animated: true)

			case "Filters1View":
				let filters1View = Filters1View()
				let navigation = NavigationController(rootViewController: filters1View)
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Filters2View":
				let filters2View = Filters2View()
				navigationController?.pushViewController(filters2View, animated: true)

			case "Filters3View":
				let filters3View = Filters3View()
				navigationController?.pushViewController(filters3View, animated: true)

			case "FilterCategoryView":
				let filterCategoryView = FilterCategoryView()
				navigationController?.pushViewController(filterCategoryView, animated: true)

			case "SortByView":
				let sortByView = SortByView()
				let navigation = NavigationController(rootViewController: sortByView)
				present(navigation, animated: true, completion: nil)

			case "Video1View":
				let video1View = Video1View()
				let navigation = NavigationController(rootViewController: video1View)
				navigation.modalPresentationStyle = .overCurrentContext
				present(navigation, animated: true, completion: nil)

			case "Video2View":
				let video2View = Video2View()
				let navigation = NavigationController(rootViewController: video2View)
				navigation.modalPresentationStyle = .overCurrentContext
				present(navigation, animated: true, completion: nil)

			case "Video3View":
				let video3View = Video3View()
				let navigation = NavigationController(rootViewController: video3View)
				navigation.modalPresentationStyle = .overCurrentContext
				present(navigation, animated: true, completion: nil)

			case "EditPhotoView":
				let editPhotoView = EditPhotoView()
				let navigation = NavigationController(rootViewController: editPhotoView)
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "SubscribeView":
				let subscribeView = SubscribeView()
				navigationController?.pushViewController(subscribeView, animated: true)

			case "Channels1View":
				let channels1View = Channels1View()
				navigationController?.pushViewController(channels1View, animated: true)

			case "Channels2View":
				let channels2View = Channels2View()
				navigationController?.pushViewController(channels2View, animated: true)

			case "ChannelView":
				let channelView = ChannelView()
				navigationController?.pushViewController(channelView, animated: true)

			case "AccountView":
				let accountView = AccountView()
				navigationController?.pushViewController(accountView, animated: true)

			case "SettingsView":
				let settingsView = SettingsView()
				navigationController?.pushViewController(settingsView, animated: true)

			case "EditProfileView":
				let editProfileView = EditProfileView()
				navigationController?.pushViewController(editProfileView, animated: true)

			case "ChooseGenresView":
				let chooseGenresView = ChooseGenresView()
				navigationController?.pushViewController(chooseGenresView, animated: true)

			case "ChooseArtistsView":
				let chooseArtistsView = ChooseArtistsView()
				navigationController?.pushViewController(chooseArtistsView, animated: true)

			case "Library1View":
				let library1View = Library1View()
				navigationController?.pushViewController(library1View, animated: true)

			case "Library2View":
				let library2View = Library2View()
				navigationController?.pushViewController(library2View, animated: true)

			case "PlaylistsView":
				let playlistsView = PlaylistsView()
				navigationController?.pushViewController(playlistsView, animated: true)

			case "ArtistsView":
				let artistsView = ArtistsView()
				navigationController?.pushViewController(artistsView, animated: true)

			case "SongsView":
				let songsView = SongsView()
				navigationController?.pushViewController(songsView, animated: true)

			case "AlbumsView":
				let albumsView = AlbumsView()
				navigationController?.pushViewController(albumsView, animated: true)

			case "PlaylistView":
				let playlistView = PlaylistView()
				navigationController?.pushViewController(playlistView, animated: true)

			case "AlbumView":
				let albumView = AlbumView()
				navigationController?.pushViewController(albumView, animated: true)

			case "ChartsSongsView":
				let chartsSongsView = ChartsSongsView()
				navigationController?.pushViewController(chartsSongsView, animated: true)

			case "ChartsAlbumsView":
				let chartsAlbumsView = ChartsAlbumsView()
				navigationController?.pushViewController(chartsAlbumsView, animated: true)

			case "Artist1View":
				let artist1View = Artist1View()
				navigationController?.pushViewController(artist1View, animated: true)

			case "Artist2View":
				let artist2View = Artist2View()
				navigationController?.pushViewController(artist2View, animated: true)

			case "Trending1View":
				let trending1View = Trending1View()
				navigationController?.pushViewController(trending1View, animated: true)

			case "Trending2View":
				let trending2View = Trending2View()
				navigationController?.pushViewController(trending2View, animated: true)

			case "Player1View":
				let player1View = Player1View()
				let navigation = NavigationController(rootViewController: player1View)
				navigation.modalPresentationStyle = .overCurrentContext
				present(navigation, animated: true, completion: nil)

			case "Player2View":
				let player2View = Player2View()
				let navigation = NavigationController(rootViewController: player2View)
				navigation.modalPresentationStyle = .overCurrentContext
				present(navigation, animated: true, completion: nil)

			case "SongScanView":
				let songScanView = SongScanView()
				navigationController?.pushViewController(songScanView, animated: true)

			case "VoiceRecorderView":
				let voiceRecorderView = VoiceRecorderView()
				navigationController?.pushViewController(voiceRecorderView, animated: true)

			case "CameraView":
				let cameraView = CameraView()
				let navigation = NavigationController(rootViewController: cameraView)
				navigation.modalPresentationStyle = .overCurrentContext
				present(navigation, animated: true, completion: nil)

			case "Video4View":
				let video4View = Video4View()
				let navigation = NavigationController(rootViewController: video4View)
				navigation.modalPresentationStyle = .overCurrentContext
				present(navigation, animated: true, completion: nil)

			default:
				break
		}
	}
}
