//
//  CharacterDetailViewController.swift
//  Marvel
//
//  Created by Marcio Alico on 1/2/22.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class CharacterDetailViewController: UIViewController, MarvelViewController {
    
    internal var router: MarvelRouter = CharacterDetailRouter()
    internal var viewModel: MarvelViewModel = CharacterDetailViewModel()
    private var disposeBag = DisposeBag()
    
    var character: Character?
    var comicsDetails: [ComicDetail]?
    var characterID: String?
    
    let kComicTableViewCellID = "ComicTableViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var comicsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        getCharacterDetail()
        setUpTableView()
        setUpUI()
    }
    
    func getCharacterDetail(){
        guard let vm = viewModel as? CharacterDetailViewModel else { return }
        
        return vm.getCharacterDetail(characterID ?? "")
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe (
                onNext: { details in
                    self.comicsDetails = details.filter({ $0.images?.first?.url != nil })
                    self.reloadTableView()
                }, onError: { error in
                    self.errorMessage(message: Constants.defaultError)
                    print(error.localizedDescription)
                }, onCompleted: {
                }).disposed(by: disposeBag)
    }
    
    private func setUpUI() {
        self.view.backgroundColor = .systemGray5
        
        if let imageUrl = character?.thumbnail?.url {
            setUpImages(imageUrl)
        }
        
        if let name = character?.name {
            setUpNameLabel(name)
        }
        
        if let description = character?.description {
            setUpDescriptionLabel(description)
        }
    }
    
    fileprivate func setUpImages(_ url: URL) {
        imageView.roundCorners(with: 16)
        imageView.downloaded(from: url)
        imageView.contentMode = .scaleAspectFill
        
        // set up blur background image
        backgroundImage.downloaded(from: url)
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backgroundImage.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundImage.addSubview(blurEffectView)
    }
    
    fileprivate func setUpNameLabel(_ name: String) {
        self.nameLabel.text = name
        nameLabel.textAlignment = .center
        nameLabel.textColor = Constants.Colors.gray
        nameLabel.font = UIFont(name: Constants.Fonts.bold, size: 35.0)
        
        nameLabel.addBorder(color: Constants.Colors.gray.cgColor, width: 1)
        nameLabel.backgroundColor = UIColor(white: 1, alpha: 0.95)
        nameLabel.clipsToBounds = true
        nameLabel.roundCorners()
    }
    
    fileprivate func setUpDescriptionLabel(_ description: String) {
        descriptionLabel.text = description
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = UIFont(name: Constants.Fonts.regular, size: 20.0)
        descriptionLabel.textColor = Constants.Colors.gray
    }
    
    fileprivate func setUpTableView() {
        comicsTableView.delegate = self
        comicsTableView.dataSource = self
        comicsTableView.register(UINib(nibName: kComicTableViewCellID, bundle: nil), forCellReuseIdentifier: kComicTableViewCellID)
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.comicsTableView.reloadData()
        }
    }
}

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicsDetails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kComicTableViewCellID) as! ComicTableViewCell
        cell.comic = comicsDetails?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
}

