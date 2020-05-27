//
//  ViewController.swift
//  Image
//
//  Created by Rommer Chu on 2020-05-21.
//  Copyright © 2020 Rommer Orquiza Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
//PICTURE DEFAULT
    @IBOutlet weak var pictureView: UIImageView!
    var defaultPic = true
    
  //SLIDER
    @IBOutlet weak var BlurRadius: UISlider!
      var defaultImg: UIImage? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        // Do any additional setup after loading the view.
        
        defaultImg = pictureView.image
        
        
    }

    
    //BLUR
    @IBAction func BlurrBtn(_ sender: UIButton) {
                
        let rawImg = CIImage(image: pictureView.image!)
        let filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputRadiusKey:BlurRadius.value]
        ApplyFilters(filterName: "CIBoxBlur", filterParams: filterParams)
        
    }
    
    //SEPIA
    @IBAction func SepiaBtn(_ sender: UIButton) {
        
        let rawImg = CIImage(image: pictureView.image!)
        let filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputIntensityKey: BlurRadius.value ]
        ApplyFilters(filterName: "CISepiaTone", filterParams: filterParams)
    }
    
    
    //PIXELLATE
    @IBAction func PixelateBtn(_ sender: UIButton) {
        
        let rawImg = CIImage(image: pictureView.image!)
        let filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputScaleKey:10.00]
            ApplyFilters(filterName: "CIPixellate", filterParams: filterParams)
    }
    
    

    //MONOCHROME EFFECT
    @IBAction func MonoChrome(_ sender: UIButton) {
        let rawImg = CIImage(image: pictureView.image!)
        let filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputIntensityKey:5.0]
        ApplyFilters(filterName: "CIColorMonochrome", filterParams: filterParams)
        
    }
    
    
    //COMIC EFFECTS
    @IBAction func Comic(_ sender: UIButton) {
        let rawImg = CIImage(image: pictureView.image!)
        let filterParams:[String:Any] = [kCIInputImageKey:rawImg]
        ApplyFilters(filterName: "CIComicEffect", filterParams: filterParams)
        
    }
    
    
    
    //POSTERIZE
    
    @IBAction func Posterize(_ sender: UIButton) {
        let rawImg = CIImage(image: pictureView.image!)
        let filterParams:[String:Any] = [kCIInputImageKey:rawImg, kCIInputRadiusKey:10.00, kCIInputIntensityKey:0.5]
        ApplyFilters(filterName: "CIBloom", filterParams: filterParams)
        
    }
    
    
    
    
    //IMAGE SWITCHER
   @IBAction func ImageChanger(_ sender: UISegmentedControl) {
        
        if (defaultPic == true){
            pictureView.image = UIImage(named: "cat1.jpg")
            defaultPic = false
        }
        else{
            pictureView.image = UIImage(named: "cat2.jpg")
            defaultPic = true
        }
    }
      
   
    @IBAction func resetBtn(_ sender: UIButton) {
        
        //var rawImg = CIImage(image: defaultImg!)
        //pictureView.image = UIImage(ciImage: rawImg!)
        pictureView.image = defaultImg
    }
    
    
    //MAIN FUNCTION
    func ApplyFilters(filterName:String , filterParams:[String:Any]){
          
          var filter = CIFilter(name: filterName, parameters: filterParams )

          //4. Create a context so that you can show the image back to use
          let context = CIContext(options: nil)
        
          //5. Convert CIImage result to CGI Image
          if let output = filter?.outputImage{
              
              if var cgiResult = context.createCGImage(output, from: output.extent){
                  
                  //6. Convert CGI Image into UIImage as a final result
                  pictureView.image = UIImage(cgImage: cgiResult)
                  
              }
          }
    }
}
