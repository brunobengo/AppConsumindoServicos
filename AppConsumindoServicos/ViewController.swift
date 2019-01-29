//
//  ViewController.swift
//  AppConsumindoServicos
//
//  Created by Bruno Bengochea on 28/01/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        if let url = URL(string: "https://blockchain.info/ticker"){
            let tarefa = URLSession.shared.dataTask(with: url) { (dados, requisicao,
                erro) in
                
                if erro == nil {
                    if let dadosRetorno = dados {
                        
                        do{
                            if let objetoJson = try JSONSerialization.jsonObject(with: dadosRetorno, options: [])
                                as? [String: Any] {
//                              print(objetoJson)
                                if let brl = objetoJson["BRL"] as? [String: Any] {
//                                    print(brl)
                                    if let preco = brl["buy"] as? Double {
                                        print(preco)
                                        
                                    }else{
                                        print("nops work")
                                    }
                                }
                            }
                        }catch{
                            print("Erro ao formatar o retorno")
                        }
                    }
                }else{
                    print("não funcionou")
                }
            }
            tarefa.resume()
        }
    }
    
}

