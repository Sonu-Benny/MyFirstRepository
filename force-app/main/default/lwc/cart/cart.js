import { LightningElement,api, wire } from 'lwc';
import callProduct from "@salesforce/apex/productlwc.callProduct";
export default class Cart extends LightningElement {
    @api countvalue;
    @api count=0;
    @wire(callProduct) productresult;
    clickcount(){
        this.count=this.count+1;
        this.countvalue= this.count;
    }

}