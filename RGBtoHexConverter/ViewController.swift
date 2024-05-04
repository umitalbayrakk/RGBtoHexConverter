import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtRed: UITextField!
    @IBOutlet weak var txtGreen: UITextField!
    @IBOutlet weak var txtBlue: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblSelectedColor: UILabel!
    var secilenIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        secilenIndex = sender.selectedSegmentIndex
        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtGreen.text?.removeAll()
        txtBlue.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white
        
        
        
        if secilenIndex == 0 {
            btnConvert.setTitle("RGB - HEX Çevir", for: UIControl.State.normal)
        }else{
            btnConvert.setTitle("HEX - RGB Çevir", for: UIControl.State.normal)
        }
        
        
    }
    @IBAction func btnConvertClicked(_ sender: UIButton) {
        
        
        if secilenIndex == 0 {
            // RGB'den HEX'e çevirme işlemi yapılacaktır.
            convertRGBtoHex()
            
        }else{
            // HEX'den RGB'ye çevirme işlemi yapılacaktır.
            convertHextoRGB()
        }
    }
    
    
    func convertRGBtoHex(){
        
        guard let redValue = UInt8(txtRed.text!) else {return}
        guard let greenValue = UInt8(txtGreen.text!) else {return}
        guard let blueValue = UInt8(txtBlue.text!) else {return}
                    
                    // Buraya kadar gelinmişsse kullanıcı değerleri düzgün bir şekilde girmiştir.
                    let redHex = String(format:"%2X", redValue)
                    let greenHex = String(format:"%2X",greenValue)
                    let blueHex = String(format:"%2X",blueValue)
                    
                    
                    lblResult.text = "HEX COLOR : #\(redHex)\(greenHex)\(blueHex)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
         
    }
    func convertHextoRGB(){
       
        guard let redValue = UInt8(txtRed.text!) else {return}
        guard let greenValue = UInt8(txtGreen.text!) else {return}
        guard let blueValue = UInt8(txtBlue.text!) else {return}
        
                    lblResult.text = "RED : \(redValue) \n GREEN : \(greenValue) \n BLUE : \(blueValue)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
          
        
        
        
        
    }
    
}

