/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lsmsdgroup.eletronicsystemtest;

/**
 *
 * @author FraRonk
 */
public final class ShiftRegister {
    private final int[] reg;
    
    ShiftRegister(int n){
        reg = new int[n];
        
        resetRegister();
    }
    
    int getFromIndex(int i){
        return reg[i];
    }
    
    void putInt(int n){
        for (int i = reg.length-1; i > 0;--i){
            reg[i] = reg[i-1];
        }
        reg[0] = n;
    }
    
    void resetRegister(){
        for (int i = 0; i< reg.length; ++i){
            reg[i] = 0;
        }
    }
}
