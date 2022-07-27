import ContactMobile from '@salesforce/schema/Case.ContactMobile';
import { LightningElement, track, api} from 'lwc';

export default class DisplayMultiSelectLookup extends LightningElement {

    @api selectedItemsToDisplay = ''; //to display items in comma-delimited way
    @api values = []; //stores the labels in this array
    @api srList = [];
    @track isItemExists = false; //flag to check if message can be displayed

    //captures the retrieve event propagated from lookup component
    selectItemEventHandler(event){
        let args = JSON.parse(JSON.stringify(event.detail.arrItems));
        this.displayItem(args);        
    }

    //captures the remove event propagated from lookup component
    deleteItemEventHandler(event){
        let args = JSON.parse(JSON.stringify(event.detail.arrItems));
        this.displayItem(args);
    }

    //displays the items in comma-delimited way
    displayItem(args){
        this.srList = [];
        this.values = []; //initialize first
        args.map(element=>{
            this.values.push(element.label);
            this.srList.push(element.value);
        });

        this.isItemExists = (args.length>0);
        this.selectedItemsToDisplay = this.values.join('; ');
    }
    

    @api get ItemsToDisplay(){
        return this._selectedItemsToDisplay;
    }
}
/*const attributeChangeEvent = new FlowAttributeChangeEvent('selectedItemsToDisplay','TESTSTRING');
    this.dispatchEvent(attributeChangeEvent);*/