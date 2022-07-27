import { LightningElement } from 'lwc';

export default class ChildCmp extends LightningElement {
    
    innerfunc(event){
        console.log('Row ==>'+(event.target.getAttribute('data-id')));
        this.dispatchEvent(new CustomEvent('passtoparent',{detail: event.target.getAttribute('data-id')}));
        
    }

}