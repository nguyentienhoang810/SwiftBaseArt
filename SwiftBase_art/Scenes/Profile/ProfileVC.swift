//
//  ProfileVC.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 12/1/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class ProfileVC: BaseVC {
    @IBOutlet private var avatarImgView: UIImageView!

    var vm: ProfileVM!

    private var imageSelected: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        vm.observerLoginState()
    }

    // MARK: - IBActions

    @IBAction private func avatarButtonTapped(_ sender: UIButton) {
        vm.presentImagePickerVC()
    }

    @IBAction private func signOut(_ sender: UIButton) {
        vm.logout()
    }

    // MARK: - Private methods

    private func setupUI() {
        avatarImgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        avatarImgView.layer.masksToBounds = true
        avatarImgView.layer.cornerRadius = avatarImgView.frame.height / 2
        avatarImgView.layer.borderWidth = 0.5
        avatarImgView.layer.borderColor = UIColor.green.cgColor
    }

    private func uploadAvatar() {
        guard let image = imageSelected else { return }
        startLoading()
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            if let imageData = image.compressData(to: 1024 * 1024) {
                self.imageSelected = image
                self.vm.uploadAvatar(imageData: imageData)
            }
        }
    }

    // MARK: - Public methods

    func handleUploadAvatarSuccess(result: APIResult<FilestackUploadResult>) {
        stopLoading()
        switch result {
        case .success:
            avatarImgView.image = imageSelected
        case let .failure(error):
            Alert.present(message: error.localizedDescription, actions: .ok(handler: nil), from: self)
        }
    }

    func handleLoginState(_ state: LoggedInState) {
        switch state {
        case .loggedOut:
            Helper.shared.isLoggedIn = false
            ScreenTransitionManager.switchScreenFollowLoginState()
        case let .loginFailed(error: error):
            Alert.present(message: error.localizedDescription, actions: .ok(handler: nil), from: self)
        default:
            break
        }
    }
}

extension ProfileVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    // MARK: - UIImagePickerControllerDelegate

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        picker.dismiss(animated: true, completion: nil)
        imageSelected = image
        uploadAvatar()
    }
}
