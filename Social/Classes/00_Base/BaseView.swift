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
		names.append("Feed1View")
		names.append("Feed2View")
		names.append("Feed3View")
		names.append("Feed4View")
		names.append("Feed5View")
		names.append("ActivityView")
		names.append("NotificationsView")
		names.append("FindFriends1View")
		names.append("FindFriends2View")
		names.append("InviteFriendsView")
		names.append("SearchView")
		names.append("Story1View")
		names.append("Story2View")
		names.append("AddStoryView")
		names.append("EditStoryView")
		names.append("StickersView")
		names.append("TypeView")
		names.append("SketchView")
		names.append("LiveVideo1View")
		names.append("LiveVideo2View")
		names.append("LiveVideo3View")
		names.append("CameraRollView")
		names.append("Post1View")
		names.append("Post2View")
		names.append("AddCommentView")
		names.append("Comments1View")
		names.append("Comments2View")
		names.append("AddPostView")
		names.append("FriendsList1View")
		names.append("FriendsList2View")
		names.append("FriendsList3View")
		names.append("Post3DTouchView")
		names.append("PostOptionsView")
		names.append("Profile1View")
		names.append("Profile2View")
		names.append("Profile3View")
		names.append("Profile4View")
		names.append("Profile5View")
		names.append("Account1View")
		names.append("Account2View")
		names.append("Account3View")
		names.append("EditProfile1View")
		names.append("EditProfile2View")
		names.append("AddContactView")
		names.append("EditContactView")
		names.append("ContactInfoView")
		names.append("GroupInfoView")
		names.append("VideoCall1View")
		names.append("VideoCall2View")
		names.append("VideoCall3View")
		names.append("VideoCall4View")
		names.append("VoiceCall1View")
		names.append("VoiceCall2View")
		names.append("ChatsView")
		names.append("CreateGroupView")
		names.append("CallsView")
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

			case "Feed1View":
				let feed1View = Feed1View()
				let navController = NavigationController(rootViewController: feed1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Feed2View":
				let feed2View = Feed2View()
				let navController = NavigationController(rootViewController: feed2View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Feed3View":
				let feed3View = Feed3View()
				let navController = NavigationController(rootViewController: feed3View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Feed4View":
				let feed4View = Feed4View()
				let navController = NavigationController(rootViewController: feed4View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Feed5View":
				let feed5View = Feed5View()
				let navController = NavigationController(rootViewController: feed5View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "ActivityView":
				let activityView = ActivityView()
				let navController = NavigationController(rootViewController: activityView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "NotificationsView":
				let notificationsView = NotificationsView()
				let navController = NavigationController(rootViewController: notificationsView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "FindFriends1View":
				let findFriends1View = FindFriends1View()
				navigationController?.pushViewController(findFriends1View, animated: true)

			case "FindFriends2View":
				let findFriends2View = FindFriends2View()
				navigationController?.pushViewController(findFriends2View, animated: true)

			case "InviteFriendsView":
				let inviteFriendsView = InviteFriendsView()
				navigationController?.pushViewController(inviteFriendsView, animated: true)

			case "SearchView":
				let searchView = SearchView()
				searchView.modalPresentationStyle = .fullScreen
				present(searchView, animated: true)

			case "Story1View":
				let story1View = Story1View()
				story1View.modalPresentationStyle = .fullScreen
				present(story1View, animated: true)

			case "Story2View":
				let story2View = Story2View()
				story2View.modalPresentationStyle = .fullScreen
				present(story2View, animated: true)

			case "AddStoryView":
				let addStoryView = AddStoryView()
				let navController = NavigationController(rootViewController: addStoryView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "EditStoryView":
				let editStoryView = EditStoryView()
				let navController = NavigationController(rootViewController: editStoryView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "StickersView":
				let stickersView = StickersView()
				present(stickersView, animated: true)

			case "TypeView":
				let typeView = TypeView()
				let navController = NavigationController(rootViewController: typeView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "SketchView":
				let sketchView = SketchView()
				let navController = NavigationController(rootViewController: sketchView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "LiveVideo1View":
				let liveVideo1View = LiveVideo1View()
				let navController = NavigationController(rootViewController: liveVideo1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "LiveVideo2View":
				let liveVideo2View = LiveVideo2View()
				let navController = NavigationController(rootViewController: liveVideo2View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "LiveVideo3View":
				let liveVideo3View = LiveVideo3View()
				let navController = NavigationController(rootViewController: liveVideo3View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "CameraRollView":
				let cameraRollView = CameraRollView()
				let navController = NavigationController(rootViewController: cameraRollView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Post1View":
				let post1View = Post1View()
				navigationController?.pushViewController(post1View, animated: true)

			case "Post2View":
				let post2View = Post2View()
				let navController = NavigationController(rootViewController: post2View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "AddCommentView":
				let addCommentView = AddCommentView()
				present(addCommentView, animated: true)

			case "Comments1View":
				let comments1View = Comments1View()
				navigationController?.pushViewController(comments1View, animated: true)

			case "Comments2View":
				let comments2View = Comments2View()
				navigationController?.pushViewController(comments2View, animated: true)

			case "AddPostView":
				let addPostView = AddPostView()
				let navController = NavigationController(rootViewController: addPostView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "FriendsList1View":
				let friendsList1View = FriendsList1View()
				navigationController?.pushViewController(friendsList1View, animated: true)

			case "FriendsList2View":
				let friendsList1View = FriendsList2View()
				navigationController?.pushViewController(friendsList1View, animated: true)

			case "FriendsList3View":
				let friendsList3View = FriendsList3View()
				navigationController?.pushViewController(friendsList3View, animated: true)

			case "Post3DTouchView":
				let post3DTouchView = Post3DTouchView()
				present(post3DTouchView, animated: true)

			case "PostOptionsView":
				let postOptionsView = PostOptionsView()
				present(postOptionsView, animated: true)

			case "Profile1View":
				let profile1View = Profile1View()
				let navController = NavigationController(rootViewController: profile1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Profile2View":
				let profile2View = Profile2View()
				navigationController?.pushViewController(profile2View, animated: true)

			case "Profile3View":
				let profile3View = Profile3View()
				navigationController?.pushViewController(profile3View, animated: true)

			case "Profile4View":
				let profile4View = Profile4View()
				navigationController?.pushViewController(profile4View, animated: true)

			case "Profile5View":
				let profile5View = Profile5View()
				navigationController?.pushViewController(profile5View, animated: true)

			case "Account1View":
				let account1View = Account1View()
				navigationController?.pushViewController(account1View, animated: true)

			case "Account2View":
				let account2View = Account2View()
				navigationController?.pushViewController(account2View, animated: true)

			case "Account3View":
				let account3View = Account3View()
				navigationController?.pushViewController(account3View, animated: true)

			case "EditProfile1View":
				let editProfile1View = EditProfile1View()
				navigationController?.pushViewController(editProfile1View, animated: true)

			case "EditProfile2View":
				let editProfile2View = EditProfile2View()
				navigationController?.pushViewController(editProfile2View, animated: true)

			case "AddContactView":
				let addContactView = AddContactView()
				navigationController?.pushViewController(addContactView, animated: true)

			case "EditContactView":
				let editContactView = EditContactView()
				navigationController?.pushViewController(editContactView, animated: true)

			case "ContactInfoView":
				let contactInfoView = ContactInfoView()
				navigationController?.pushViewController(contactInfoView, animated: true)

			case "GroupInfoView":
				let groupInfoView = GroupInfoView()
				navigationController?.pushViewController(groupInfoView, animated: true)

			case "VideoCall1View":
				let videoCall1View = VideoCall1View()
				videoCall1View.modalPresentationStyle = .fullScreen
				present(videoCall1View, animated: true)

			case "VideoCall2View":
				let videoCall2View = VideoCall2View()
				videoCall2View.modalPresentationStyle = .fullScreen
				present(videoCall2View, animated: true)

			case "VideoCall3View":
				let videoCall3View = VideoCall3View()
				videoCall3View.modalPresentationStyle = .fullScreen
				present(videoCall3View, animated: true)

			case "VideoCall4View":
				let videoCall4View = VideoCall4View()
				let navController = NavigationController(rootViewController: videoCall4View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "VoiceCall1View":
				let voiceCall1View = VoiceCall1View()
				voiceCall1View.modalPresentationStyle = .fullScreen
				present(voiceCall1View, animated: true)

			case "VoiceCall2View":
				let voiceCall2View = VoiceCall2View()
				voiceCall2View.modalPresentationStyle = .fullScreen
				present(voiceCall2View, animated: true)

			case "ChatsView":
				let chatsView = ChatsView()
				let navController = NavigationController(rootViewController: chatsView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "CreateGroupView":
				let createGroupView = CreateGroupView()
				let navController = NavigationController(rootViewController: createGroupView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "CallsView":
				let callsView = CallsView()
				let navController = NavigationController(rootViewController: callsView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			default:
				break
		}
	}
}
