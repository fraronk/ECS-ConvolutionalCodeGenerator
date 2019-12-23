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
        aa= new ShiftRegister(5);
        cc= new ShiftRegister(11);
    }
    //int returns the ck calculated
    int putAk(int ak){
        //calculate ck
        //cc index are -1 because ck it's still not insert
        int ck = ak + aa.getFromIndex(3) + aa.getFromIndex(4) + cc.getFromIndex(8) + cc.getFromIndex(10);
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
