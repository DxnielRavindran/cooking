//
//  RecipeTableViewController.swift
//  cooker
//
//  Created by MAD2_P03 on 9/12/19.
//  Copyright © 2019 MAD2_P03. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class RecipeTableViewController: UITableViewController {
    
    var recipeList:[Recipe] = []
    var ingredientList:[Ingredient] = []
    let recipeController:RecipeController = RecipeController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeList = recipeController.RetrieveRecipe()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
             
        ingredientList = recipeController.RetrieveIngredientFromRecipe(recipe: recipeList[indexPath.row])
        
        var s:String = ""
        
        for ing in ingredientList
        {
            s += ing.name! + ","
        }
        
        
        cell.textLabel!.text = recipeList[indexPath.row].name!
        cell.detailTextLabel?.text = s
        
        return cell
        
        
    }
    
    
    
    
}


    
    



