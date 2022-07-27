import { LightningElement,wire,track } from 'lwc';
import displayOpportunity from '@salesforce/apex/opportunityController.displayOpportunity';
import updateStage from '@salesforce/apex/opportunityController.updateStage';
export default class LwcOpportunity extends LightningElement {
    @track display;
    accouName;
    @wire(displayOpportunity)
    wireAccounts({data,error}){
        if(data){
            this.display = data;
        }
    }
    
    updateStageOpp(event){
        let opportunityId = event.target.getAttribute('data-id');
        alert(opportunityId);
        console.log(opportunityId);
        updateStage({oppId : opportunityId})
        //imperative call
            .then (()=> {
                alert('Opportunity ' + opportunityId +  ' is closed won');
        })
            .catch (error => {
            });
    }
}