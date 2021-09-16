//
//  ViewController.swift
//  UICollectionViewCompositionalLayout
//
//  Created by 蔡忠翊 on 2021/9/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = generateLayout()
        /* 將 collectionViewLayout 設為 UICollectionViewCompositionalLayout，generateLayout 將回傳 UICollectionViewCompositionalLayout */
    }
    
    
    // absolute 可指定固定的大小
    // 設定 item size 時，fractional 指的是相對於 group 的大小， widthDimension 傳入 fractionalWidth(1/3) 代表 item 的寬度是 group 寬度的 1/3，heightDimension 傳入 fractionalHeight(1) 代表 item 的高度等於 group 高度。因此水平排列時一個 group 可以裝 3 個 item。
    //    設定 group size 時，fractional 依據以下兩種情況有不同的意思:
    //    group 被包在 section 裡。
    //    group 被包在另一個 group 裡
    // 當 group 被包在 section 裡，fractional 指的是相對於 collection view 的大小，widthDimension 傳入 .fractionalWidth(1) 代表 group 的寬度等於 collection view 的寬度，heightDimension 傳入 fractionalWidth(1/3) 代表 group 的高度等於 collection view 寬度的 1/3。
    // estimated(100)它將自動計算合適的高度，在此 group 的高度將變成剛好容納 item 的高度
    
    
    //    func generateLayout() -> UICollectionViewLayout {
    //        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1))
    //        let item = NSCollectionLayoutItem(layoutSize: itemSize)
    //        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3))
    //        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    //        let section = NSCollectionLayoutSection(group: group)
    //        return UICollectionViewCompositionalLayout(section: section)
    //    }
    
    /*  */
    // 生成 group 時在參數 count 裡傳入 item 的數量。值得注意的，當我們用 count 指定數量時，item size 的 widthDimension 傳什麼就不重要了，因為它會自己算出一個 item 要多寬。
    func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
    
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewCell.self)", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: "image\(indexPath.item + 1)")
        return cell
    }
    
    
    
    
}
