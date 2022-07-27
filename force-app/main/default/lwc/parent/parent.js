import { LightningElement,api } from 'lwc';

export default class Parent extends LightningElement {
    @api result;
    onbuttonclick()
    {
        this.template.querySelector("c-child").bmi();
    }
    handlereturnresult(event)
    {
        this.result=event.detail;
    }

}