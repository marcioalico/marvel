//
//  HomeViewController.swift
//  Marvel
//
//  Created by Marcio Alico on 12/28/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController, MarvelViewController {
    
    var router: MarvelRouter = HomeRouter()
    var viewModel: MarvelViewModel = HomeViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    var characters = [Character]()
    private var filteredCharacters = [Character]()
    private var disposeBag = DisposeBag()
    
    let kCharacterTableViewID = "CharacterTableViewCell"
    let kCharacterTableViewHeight: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        getCharacters()
        setUpTableView()
        setRefreshControl()
        setSearchBarController()
        
        self.title = "Characters"
        self.navigationItem.hidesBackButton = true
    }
    
    func setRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(callPullToRefresh), for: .valueChanged)
    }
    
    @objc func callPullToRefresh(){
        getCharacters()
    }
    
    private func getCharacters() {
        guard let vm = viewModel as? HomeViewModel else { return }
        
        return vm.getCharacters()
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { characters in
                    // filtro characters para mostrar solo los que tengan imagen
                    self.characters = characters.filter({ !($0.thumbnail?.path?.contains("image_not_available") ?? false) })
                    self.reloadTableView()
                    self.tableView.refreshControl!.endRefreshing()
                }, onError: { error in
                    self.errorMessage(message: Constants.defaultError)
                    print(error.localizedDescription)
                }, onCompleted: {
                }).disposed(by: disposeBag)
    }
    
    lazy var searchController: UISearchController = ({
        let controller = UISearchController(searchResultsController: nil)
        controller.view.backgroundColor = .clear
        controller.hidesNavigationBarDuringPresentation = false
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.sizeToFit()
        controller.searchBar.placeholder = "Search..."
        return controller
    })()
    
    private func setSearchBarController() {
        let searchBar = searchController.searchBar
        
        // make search bar transparent
        let image = UIImage()
        searchBar.backgroundColor = .clear
        searchBar.backgroundImage = image
        searchBar.barTintColor = .clear
        
        searchController.delegate = self
        tableView.tableHeaderView = searchBar
        tableView.contentOffset = CGPoint(x: 0, y: searchBar.frame.size.height)
        
        searchBar.rx.text
            .orEmpty
            .distinctUntilChanged()
            .subscribe(onNext: { result in
                self.filteredCharacters = self.characters.filter({ character in
                    self.reloadTableView()
                    return character.name.contains(result)
                })
            }).disposed(by: disposeBag)
    }
    
    func searchBarIsActiveAndTyping() -> Bool {
        return searchController.isActive && searchController.searchBar.text != ""
    }
    
    // table view private funcs
    private func setUpTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: kCharacterTableViewID, bundle: nil), forCellReuseIdentifier: kCharacterTableViewID)
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


// MARK: - TableView Delegates

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchBarIsActiveAndTyping() ? filteredCharacters.count : characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCharacterTableViewID) as! CharacterTableViewCell
        
        if searchBarIsActiveAndTyping() {
            cell.character = filteredCharacters[indexPath.row]
        } else {
            cell.character = characters[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var characterSelected: Character?
        
        if searchBarIsActiveAndTyping() {
            characterSelected = filteredCharacters[indexPath.row]
        } else {
            characterSelected = characters[indexPath.row]
        }
        
        guard let homeRouter = router as? HomeRouter,
              let id = characterSelected?.id else { return }
        
        searchController.isActive = false
        homeRouter.navigateToCharacterComicsDetail("\(id)", character: characterSelected)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kCharacterTableViewHeight
    }
    
    // table view cell animation
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 0.75) {
            cell.alpha = 1.0
        }
    }
}


// MARK: - SearchController delegate

extension HomeViewController: UISearchControllerDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
        reloadTableView()
    }
}
