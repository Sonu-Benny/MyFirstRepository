public class CaseDetail {
    public String getPrintableView() {
        Id id = ApexPages.currentPage().getParameters().get('id');
        String html = new PageReference('/' + id + '/p').getContent().toString();
        return html.substringAfter('</head>').substringBefore('</html>');
    }
}