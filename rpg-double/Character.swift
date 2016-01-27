//
//  Character.swift
//  rpg-double
//
//  Created by Francisco Claret on 25/01/16.
//  Copyright © 2016 Francisco Claret. All rights reserved.
//

import Foundation

class Character {
    private var _name: String
    private var _hp: Int
    private var _attackPwr: Int
    
    var name: String {
        get {
            return _name
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var isAlive: Bool {
        if _hp <= 0 {
         return false
        }
        return true
    }
    
    var myTurn: Bool = false
    
    init(name: String, hp: Int, attackPwr: Int) {
        self._name = name
        self._hp = hp
        self._attackPwr = attackPwr
        
    }
    
    func beingAttacked(attackingPwr: Int) -> Bool {
        self._hp -= attackingPwr
        return true
    }
}