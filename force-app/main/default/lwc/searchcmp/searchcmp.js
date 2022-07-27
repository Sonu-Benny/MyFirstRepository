import { LightningElement,wire,track } from 'lwc';
import searchLwcAccounts from '@salesforce/apex/searchController.searchLwcAccounts';
import deleteMyAccount from '@salesforce/apex/searchController.delectAccount';
export default class Searchcmp extends LightningElement {
    @track searchedAccount;
    accouName;
    @wire(searchLwcAccounts,{accountName: '$accouName' })
    wireAccounts({data,error}){
        if(data){
            this.searchedAccount = data;
        }
    }
    onsearchName(event){
        let acName = event.target.value;
        this.accouName=acName;
    }
    deleteacc(event){
        let accountId = event.target.getAttribute('data-id');
        alert(accountId);
        deleteMyAccount({accId : accountId})
        //imperative call
            .then (()=> {
                alert('Account ' + accountId + ' is deleted');
        })
            .catch (error => {});
    }
}