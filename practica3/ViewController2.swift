//
//  ViewController2.swift
//  practica3
//
//  Created by DISMOV on 08/04/22.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var ingredients: UITextField!
    @IBOutlet weak var directions: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view..
    }
    

    @IBAction func Guardar(_ sender: Any) {
        
        let alert = UIAlertController(title: "Titulo", message: "Msg", preferredStyle: .alert )
        let bandera = DataManager.instance.guarda(Name.text ?? "", ingredients.text ?? "", directions.text ?? "")
        
        if (Name.text?.isEmpty ?? true) || (ingredients.text?.isEmpty ?? true) || (directions.text?.isEmpty ?? true)  {
            alert.title = "Aviso"
            alert.message = "Los campos requeridos no pueden ser vacios."
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if(!bandera){
            alert.title = "Error"
            alert.message = "No se puede agregar el registro."
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = sb.instantiateViewController(withIdentifier: "Home")
        homeViewController.modalPresentationStyle = .fullScreen
        self.present(homeViewController, animated: true, completion: nil)
    }
    
    @IBAction func Cancelar(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = sb.instantiateViewController(withIdentifier: "Home")
        homeViewController.modalPresentationStyle = .fullScreen
        self.present(homeViewController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
