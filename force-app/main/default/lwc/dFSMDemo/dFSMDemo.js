import { LightningElement,track,api,wire } from 'lwc';

export default class Child extends LightningElement {
    @api myVariable1;
    myVariable2 = 'Benny';

    @api changeName2(){
        this.myVariable1 = 'Shreya';
        console.log(this.myVariable1);
    }

    changeName(){
        this.myVariable2 = 'Meenu';
        const selectedEvent = new CustomEvent('child', { detail: 'Juno'});
        this.dispatchEvent(selectedEvent);
    }
}