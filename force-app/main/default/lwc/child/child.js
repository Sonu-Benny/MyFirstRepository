import { api, LightningElement, track } from 'lwc';

export default class Child extends LightningElement {
    @track weight;
    @track height;
    @api result;
    handleweightchange(event)
    {
        this.weight=parseFloat(event.target.value);
    }
    handleheightchange(event)
    {
        this.height=parseFloat(event.target.value);
    }

    @api bmi()
    {
        this.result=parseFloat(this.weight)/Math.pow(parseFloat(this.height),2);
        const selectedevent = new CustomEvent("returnresult",{detail:this.result});
        this.dispatchEvent(selectedevent);
    }
}