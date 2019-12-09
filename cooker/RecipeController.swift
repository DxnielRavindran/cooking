
import Foundation
import UIKit
import CoreData


class RecipeController {
    
    
    func AddRecipe(recipe:Recipe)
       {
           let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
           let context = appDelegate.persistentContainer.viewContext
           let entity = NSEntityDescription.entity(forEntityName: "CDRecipe", in: context)
            
           let cdRecipe = NSManagedObject(entity: entity!, insertInto: context)
           cdRecipe.setValue(recipe.name, forKey: "name")
           cdRecipe.setValue(recipe.preperationTime, forKey: "profileImageName")
        
        appDelegate.saveContext()
       }
    
    
    func AddIngredientToRecipe(recipe: Recipe, ingredient: Ingredient)
    {
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CDIngredient", in: context)
        
        //casting
        let cdIngredient = NSManagedObject(entity: entity!, insertInto: context) as! CDIngredient
        cdIngredient.setValue(recipe.name, forKey: "name")
        
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
        fetchRequest.predicate = NSPredicate(format: "name = %@", recipe.name!)
         
        do {
            let cdRecipe = try context.fetch(fetchRequest)
            
            let temp = cdRecipe[0] as! CDRecipe
            
            cdIngredient.addToRecipes(temp)
            appDelegate.saveContext()
        }
        
        catch{
            print(error)
        }
             
    }
    
    
    func RetrieveRecipe()->[Recipe]
    {
        var recipeList:[Recipe] = []
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
        
        do {
             let cdRecipe = try context.fetch(fetchRequest) as! [CDRecipe]
            
            for r in cdRecipe
            {
                recipeList.append(Recipe(name:r.name!, preperationTime: r.preperationTime))
            }
        }
        
        catch {
            print(error)
        }
        
        return recipeList
    }
    
    
    func RetrieveIngredientFromRecipe(recipe: Recipe)-> [Ingredient]
    {
        var ingredientList:[Ingredient] = []
        
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
         let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
         fetchRequest.predicate = NSPredicate(format: "ANY recipes.name = %@", recipe.name!)
        
        do{
            let cdIngredient =  try context.fetch(fetchRequest) as! [CDIngredient]
            
            for ing in cdIngredient
            {
                ingredientList.append(Ingredient(name: ing.name!))
            }
        }
        catch {print(error)}
        
        return ingredientList
    }
    
    
    
    
    

    
    
       
    

}




