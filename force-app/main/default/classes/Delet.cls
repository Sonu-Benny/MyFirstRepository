public  class Delet {
    String[] checks = new String[]{};
 	id surveyId='a0A5g000001ps2sEAA';
 	public PageReference test() {
 	 	return null;
 	}
 
 	public List<SelectOption> getItems() {
 	 	List<SelectOption> options = new List<SelectOption>();
 	 	options.add(new SelectOption('US','US'));
 	 	options.add(new SelectOption('CANADA','Canada'));
 	 	options.add(new SelectOption('MEXICO','Mexico'));
 	 	return options;
  	}
 
 	public String[] getCountries() {
  	 	return checks;
 	}
 
 	public void setCountries(String[] checks) {
 	 	this.checks = checks;
 	}

}