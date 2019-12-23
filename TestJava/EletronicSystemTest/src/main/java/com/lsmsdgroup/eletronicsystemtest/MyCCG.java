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
public class MyCCG {
    
    private ShiftRegister aa;
    private ShiftRegister cc;
    
    MyCCG(){
        aa= new ShiftRegister(4);
        cc= new ShiftRegister(10);
    }
    //int returns the ck calculated
    int putAk(int ak){
        //calculate ck
        //cc index are -1 because ck it's still not insert
        int ck = ak + aa.getFromIndex(3) + aa.getFromIndex(2) + cc.getFromIndex(7) + cc.getFromIndex(9);
        ck = ck%2;
        aa.putInt(ak);
        cc.putInt(ck);
        return ck;
    }
    
    void resetRegister(){
        aa.resetRegister();
        cc.resetRegister();
    }
    
    
}
