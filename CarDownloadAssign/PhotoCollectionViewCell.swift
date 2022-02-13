
import SDWebImage
import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotoCollectionViewCell"
    
    
    var spinner =  UIActivityIndicatorView()
    
    public func setCarName(carinfo:Car,indexPath:IndexPath)
    {
        
        spinner.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.fetchImage(urlString: carinfo.carImageUrl)
           // Put any code you want to be delayed here
        }

        
    }
    
    private func fetchImage(urlString:String)
    {
        //1 way to do is using pods
        
        self.imageView.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "waitImage.png"), options: .continueInBackground, completed: nil)
        
        spinner.stopAnimating()
        
        contentView.addSubview(imageView)

        
        // 2nd way to do the same thing
        
//        guard let url = URL(string: urlString) else {
//
//            return
//        }
//
//        let getDataTask = URLSession.shared.dataTask(with: url) { data, _, error in
//
//            guard let data = data, error == nil else{
//
//
//                return
//            }
//
//            DispatchQueue.main.asyncAfter(deadline: .now()+1.0){
//                [self] in let image = UIImage(data: data)
//
//
//
////                self.imageView.image = UIImage(named: "waitImage.png")
//                self.imageView.image = image
//                contentView.addSubview(imageView)
//
//            }
//        }
//
//        getDataTask.resume()
        
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
//        imageView.image = UIImage(named: "waitImage.png")
        
        
        return imageView
    }()
    
    override init(frame : CGRect)
    {
        super.init(frame: frame)
      
            contentView.addSubview(spinner)
            
            
       
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        spinner.frame = contentView.bounds
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
