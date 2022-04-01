//
//  InitialViewController.swift
//  iOSDemoApp
//
//  Created by Alejandro Castillo on 10/09/2021.
//

import UIKit

final class InitialViewController: UIViewController {
    
    let colors: [UIColor] = [.red, .green, .blue, .purple, .orange, .black]
    let cellId = "cell id"
    
    let cellWidth = (3 / 4) * UIScreen.main.bounds.width
    let sectionSpacing = (1 / 8) * UIScreen.main.bounds.width
    let cellSpacing = (1 / 16) * UIScreen.main.bounds.width
    
    lazy var collectionView: UICollectionView = {
        let layout = PagingCollectionViewLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        layout.minimumLineSpacing = cellSpacing
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.decelerationRate = .fast
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
        
        collectionView.reloadData()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.reloadData()
    }
    
}

extension InitialViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        let color = colors[indexPath.item]
        cell.backgroundColor = color
        return cell
    }
}

extension InitialViewController: UICollectionViewDelegateFlowLayout {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //        let pageWidth: Float = Float(cellWidth + cellSpacing)
        //        guard let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        //        let pageWidth = layout.itemSize.width + layout.minimumLineSpacing
        //        let currentOffset: Float = Float(scrollView.contentOffset.x)
        //        let targetOffset: Float = Float(targetContentOffset.pointee.x) / 4
        //        var newTargetOffset: Float = 0
        //
        //        if (targetOffset > currentOffset) {
        //            newTargetOffset = floorf(currentOffset / Float(pageWidth)) * Float(pageWidth)
        //        } else if (targetOffset > currentOffset) {
        //            newTargetOffset = ceil(currentOffset / Float(pageWidth)) * Float(pageWidth)
        //        } else {
        //            newTargetOffset = roundf(currentOffset / Float(pageWidth)) * Float(pageWidth)
        //        }
        //
        //        if (newTargetOffset < 0) {
        //            newTargetOffset = 0;
        //        } else if (newTargetOffset > Float(scrollView.contentSize.width)) {
        //            newTargetOffset = Float(scrollView.contentSize.width);
        //        }
        //
        //        targetContentOffset.pointee.x = CGFloat(currentOffset)
        //        scrollView.setContentOffset(CGPoint(x: CGFloat(newTargetOffset), y: scrollView.contentOffset.y), animated: true)
    }
    
}



extension InitialViewController: ViewCodable {
    func buildViewHierarchy() {
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: cellWidth).isActive = true
    }
    
    func configureView() {
        view.backgroundColor = .darkGray
    }
}
