//
//  ViewController.swift
//  rpg-double
//
//  Created by Francisco Claret on 25/01/16.
//  Copyright © 2016 Francisco Claret. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var topTxtLbl: UILabel!
    @IBOutlet weak var playerButtonLbl: UIButton!
    @IBOutlet weak var enemyButtonLbl: UIButton!
    @IBOutlet weak var enemyTurnLabl: UILabel!
    @IBOutlet weak var playerTurnLbl: UILabel!
    
    var player: Character!
    var enemy: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = createPlayer("player")
        enemy = createPlayer("enemy")
        
        playerHpLbl.text = "HP \(player.hp)"
        enemyHpLbl.text = "HP \(enemy.hp)"
        
        player.myTurn = true
        playerTurnLbl.hidden = false
        playerButtonLbl.enabled = true
        enemyButtonLbl.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func playerAttackPressed(sender: UIButton) {
        if player.myTurn {
            if enemy.beingAttacked(player.attackPwr) {
                topTxtLbl.text = "Player attacked Enemy with \(player.attackPwr)"
                enemyHpLbl.text = "HP \(enemy.hp)"
                switchTurn()
            } else {
                print("Attack failed")
            }
            
            if !enemy.isAlive {
                topTxtLbl.text = "Player attacked with \(player.attackPwr) and killed Enemy, new Enemy is up!"
                resetAfterKill()
            }
        }
        
    }

    @IBAction func enemyAttackPressed(sender: UIButton) {
        if enemy.myTurn {
            if player.beingAttacked(enemy.attackPwr) {
                topTxtLbl.text = "Enemy attacked Player with \(enemy.attackPwr)"
                playerHpLbl.text = "HP \(player.hp)"
                switchTurn()
            } else {
                print("Attack failed")
            }
            
            if !player.isAlive {
                topTxtLbl.text = "Enemy attacked with \(enemy.attackPwr) and Killed Player, new Player is up!"
                resetAfterKill()
            }
        }
    }
    
    func resetAfterKill() {
        player = createPlayer("player")
        playerHpLbl.text = "HP \(player.hp)"
        enemy = createPlayer("enemy")
        enemyHpLbl.text = "HP \(enemy.hp)"
        enemy.myTurn = false
        player.myTurn = true
        enemyTurnLabl.hidden = true
        playerTurnLbl.hidden = false
        playerButtonLbl.enabled = true
        enemyButtonLbl.enabled = false
    }
    
    func switchTurn() {
        player.myTurn = !player.myTurn
        playerTurnLbl.hidden = !playerTurnLbl.hidden
        playerButtonLbl.enabled = !playerButtonLbl.enabled
        enemy.myTurn = !enemy.myTurn
        enemyTurnLabl.hidden = !enemyTurnLabl.hidden
        enemyButtonLbl.enabled = !enemyButtonLbl.enabled
    }
    
    func createPlayer(type: String) -> Character {
          return Character(name: type, hp: (Int(arc4random_uniform(50)) + 50), attackPwr: (Int(arc4random_uniform(5))) + 5)
    }
}

