import { LightningElement , track, wire} from 'lwc';
import getLwcAccounts from '@salesforce/apex/DFSMLwcController.getLwcAccounts';
export default class ParentCmp extends LightningElement {
    myAccounts;
    @wire(getLwcAccounts)
        wiredAccounts({error,data}){
            if(data){
                this.myAccounts = data;
            }
        }
    myclick(event){
        alert(event.target.getAttribute('data-id'));
    }

    p1func(event){
        alert('row ->'+event.detail);
        console.log("row no->" + event.detail);
    }
   
}