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
public class MainTest {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        MyCCG dut = new MyCCG();
        
        //2048 = 2^11
        //this for explore all combination of the inputs
        System.out.print("{ ");
        for (int i=0; i < 2048 ; ++i ){
            dut.resetRegister();
            int sequence = i;
            String outputsequence = "";
            for (int j = 0 ; j < 11; ++j){
                int ak = sequence % 2;
                sequence =  sequence / 2;
                int ck = dut.putAk(ak);
                outputsequence = outputsequence + Integer.toBinaryString(ck);
            }
            System.out.print(outputsequence);
            if(i != 2047){
                System.out.print(", ");
                if(i % 10 == 9){
                    System.out.println();
                }
            }else{
                System.out.print(" }");
            }
            //System.out.println("For sequence "+Integer.toBinaryString(i)+" output is: "+outputsequence);
        }
    }
    
}
