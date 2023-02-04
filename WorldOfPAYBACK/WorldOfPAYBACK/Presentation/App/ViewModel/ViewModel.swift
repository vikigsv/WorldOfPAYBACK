//
//  ViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

class ViewModel: ObservableObject {
    
    enum ViewState {
        case normal
        case showProgress(Bool)
        case showBanner(title: String, details: String, type: BannerView.BannerType)
        case showErrorView(title: String, details: String)
        case hideErrorView
    }
    
    let disposeBag = DisposeBag()
    
    @Published var showProgress = false
    @Published var showBanner = false
    @Published var bannerData: BannerView.BannerData = .init()
    @Published var showErrorView = false
    @Published var errorViewData: ErrorView.ErrorViewData = .init()
    
    func updateViewWith(state: ViewState) {
        DispatchQueue.main.async { [weak self] in
            switch state {
            case .normal:
                self?.showProgress = false
                self?.hideErrorView()
            case .showProgress(let show):
                self?.showProgress = show
            case .showBanner(let title, let details, let type):
                self?.showBanner(title: title, details: details, type: type)
            case .showErrorView(let title, let details):
                self?.showErrorView(title: title, details: details)
            case .hideErrorView:
                self?.hideErrorView()
            }
        }
    }
}

fileprivate extension ViewModel {
    
    func showBanner(title: String, details: String, type: BannerView.BannerType) {
        bannerData = .init(title:title, detail: details, type: type)
        showBanner = true
    }
    
    func showErrorView(title: String, details: String) {
        errorViewData = .init(title: title, description: details)
        showErrorView = true
    }
    
    func hideErrorView() {
        showErrorView = false
    }
    
}
