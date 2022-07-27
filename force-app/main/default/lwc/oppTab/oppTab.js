import { LightningElement,api,wire,track } from 'lwc';
import displayOpportunity from '@salesforce/apex/OppController.displayOpportunity';
export default class OppTab extends LightningElement {
    @track display;
    @api recordId;
    accouName;
    @wire(displayOpportunity , {PassedId : '$recordId'})
    wireAccounts({data,error}){
        if(data){
            this.display = data;
        }
    }
}