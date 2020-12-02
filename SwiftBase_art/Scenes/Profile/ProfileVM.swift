//
//  ProfileVM.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 12/1/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Combine
import UIKit

class ProfileVM: ViewModel, FilestackService {
    typealias VC = ProfileVC
    typealias Navi = ProfileNavi

    var navi: ProfileNavi
    var apiSession: APIService
    weak var vc: ProfileVC?

    private var cancellables = Set<AnyCancellable>()

    required init(coordinator: ProfileNavi) {
        navi = coordinator
        apiSession = APISession()
    }
}

extension ProfileVM {
    // MARK: - handle logout

    func observerLoginState() {
        StoreGroup.authenticationStore.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                guard let self = self else { return }
                self.vc?.handleLoginState(state)
            }
            .store(in: &cancellables)
    }

    func logout() {
        _ = StoreGroup.authenticationStore.dispatch(action: AuthenticationAction.logout)
    }

    // MARK: - handle call API

    func uploadAvatar(imageData: Data) {
        upload(imageData)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                guard let self = self else { return }
                switch result {
                case let .failure(error):
                    self.vc?.handleUploadAvatarSuccess(result: APIResult<FilestackUploadResult>.failure(error))
                default:
                    break
                }
            } receiveValue: { [weak self] result in
                guard let self = self else { return }
                self.vc?.handleUploadAvatarSuccess(result: APIResult<FilestackUploadResult>.success(result))
            }
            .store(in: &cancellables)
    }

    // MARK: - handle navigator

    func presentImagePickerVC() {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.delegate = vc
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.allowsEditing = true
        imagePickerVC.modalPresentationStyle = .fullScreen
        vc?.present(imagePickerVC, animated: true, completion: nil)
    }
}
