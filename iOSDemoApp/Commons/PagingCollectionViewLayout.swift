//
//  PagingCollectionViewLayout.swift
//  iOSDemoApp
//
//  Created by Alejandro Castillo on 30/03/2022.
//

import UIKit

final class PagingCollectionViewLayout: UICollectionViewFlowLayout {
    
    var velocityThresholdPerPage: CGFloat = 2
    var numberOfItemsPerPage: CGFloat = 1
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return proposedContentOffset }
        
        let pageLength: CGFloat
        let approxPage: CGFloat
        let currentPage: CGFloat
        let speed: CGFloat
        
        if scrollDirection == .horizontal {
            pageLength = (self.itemSize.width + self.minimumLineSpacing) * numberOfItemsPerPage
            approxPage = collectionView.contentOffset.x / pageLength
            speed = velocity.x
        } else {
            pageLength = (self.itemSize.height + self.minimumLineSpacing) * numberOfItemsPerPage
            approxPage = collectionView.contentOffset.y / pageLength
            speed = velocity.y
        }
        
        if speed < 0 {
            currentPage = ceil(approxPage)
        } else if speed > 0 {
            currentPage = floor(approxPage)
        } else {
            currentPage = round(approxPage)
        }
        
        guard speed != 0 else {
            if scrollDirection == .horizontal {
                return CGPoint(x: currentPage * pageLength, y: 0)
            } else {
                return CGPoint(x: 0, y: currentPage * pageLength)
            }
        }
        print("contentOffset.x: ", collectionView.contentOffset.x)
        print("approxPage: ", approxPage)
        print("currentPage: ", currentPage)
        
        var nextPage: CGFloat = currentPage + (speed > 0 ? 1 : -1)
        
        print("nextPage: ", nextPage, "\n")
        
//        let increment = speed / velocityThresholdPerPage
        
//        print("increment: ", increment)
        
//        nextPage += (speed < 0) ? ceil(increment) : floor(increment)
        
//        print("nextPage with increment: ", nextPage, "\n")
//
        if scrollDirection == .horizontal {
            return CGPoint(x: nextPage * pageLength, y: 0)
        } else {
            return CGPoint(x: 0, y: nextPage * pageLength)
        }
    }
}
