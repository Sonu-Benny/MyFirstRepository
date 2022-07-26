public class JSONDeserialize {
    public InvoiceWrapper wrapper {get;set;}

    public void deserialize() {
        Http h = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://long-running.herokuapp.com/products');
        request.setHeader('Content-type', 'application/json');
        request.setMethod('GET');

        HttpResponse response = h.send(request);

        wrapper = (InvoiceWrapper) JSON.deserializeStrict(response.getBody(), InvoiceWrapper.class);
    }
}