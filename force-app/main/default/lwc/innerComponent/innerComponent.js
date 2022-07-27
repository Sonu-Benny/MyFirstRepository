import { LightningElement,api } from 'lwc';

export default class InnerComponent extends LightningElement {
    @api trainingName;
    thankyou = 'Thank you for joining';
    @api changeTraining() {
        this.thankyou = 'Thank you again';
    }
}