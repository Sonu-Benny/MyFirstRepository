trigger AccountRate on Account (after insert, after update) {
    for (Account ac:trigger.new)
    {
        if (ac.Rating!= 'hot')
        {
            ac.Rating.addError('rate be hot');
        }
    }
	
}