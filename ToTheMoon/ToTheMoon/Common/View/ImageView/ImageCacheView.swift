//
//  ImageCacheView.swift
//  ToTheMoon
//
//  Created by Marlon Ansale on 11/27/22.
//

import SwiftUI
import Combine

struct ImageCacheView: View {
    let url:URL?
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()

        init(withURL url:URL?) {
            self.url = url
            self.imageLoader = ImageLoader(url:url)
        }

        var body: some View {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onReceive(imageLoader.didChange)
            { image in
                self.image = image
            }.onAppear {
                imageLoader.loadImage(withURL: self.url)
            }.onDisappear {
                imageLoader.cancelTask()
            }
    }
}



class ImageLoader: ObservableObject {
    private let cache = NSCache<NSURL, UIImage>()
    var didChange = PassthroughSubject<UIImage, Never>()
    var task:URLSessionDataTask?
   
    
    var image = UIImage() {
        didSet {
            didChange.send(image)
        }
    }

    init(url:URL?) {
        self.loadImage(withURL: url)
    }
    
    func loadImage(withURL url:URL?){
        guard let url = url else {
            return
        }
        
        if let image = cache.object(forKey: url as NSURL) {
            self.image = image
            return
        }
        
        
        self.task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.cache.setObject(image, forKey: url as NSURL)
                self?.image = image
            }
        }
        
        self.task?.resume()
    }
    
    func cancelTask(){
        self.task?.cancel()
        self.task = nil
    }
}
