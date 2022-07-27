import { LightningElement,track,api } from 'lwc';

export default class DFSMKickoff extends LightningElement {
    myVar = 'there';
    trainingName = 'LWC training';
    @track myAccount;
    changeName() {
        this.myVar ='Team';
       
    }
    changeVar(){
        this.trainingName = 'Salesforce Training';
    }
    callChild(){
        this.template.querySelector('c-inner-component').changeTraining();
    }
    myFun(){
        this.myAccount = {name: 'Sonu' , company: 'TCS'}
    }
    inner1func(event){
        alert('Row 1');
        console.log('Row 1==>'+(event.target.getAttribute('data-id')));
        console.log('Row 1==>'+(event.currentTarget.getAttribute('data-id')));
    }
    inner2func(event){
        alert('Row 2');
        console.log('Row 2==>'+(event.target.getAttribute('data-id')));
        console.log('Row 2==>'+(event.currentTarget.getAttribute('data-id')));
    }
    inner3func(event){
        alert('Row 3');
        console.log('Row 3==>'+(event.target.getAttribute('data-id')));
        console.log('Row 3==>'+(event.currentTarget.getAttribute('data-id')));
    }
    outerfunc(event){
        //alert('second');
        console.log('second==>'+(event.target.getAttribute('data-id')));
        console.log('second==>'+(event.currentTarget.getAttribute('data-id')));
    }
}