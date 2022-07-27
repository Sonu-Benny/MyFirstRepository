import { LightningElement,wire } from 'lwc';

export default class Test extends LightningElement {
    name ='Josy';
    changeName(event){
        let name = event.detail;
        this.name=name;
    }
    demo(){
        this.template.querySelector(c-d-f-s-m-demo).changeName2();
    }
}