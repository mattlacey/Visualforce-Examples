public with sharing class RelatedListExtension
{
	// Private reference to the record loaded by the standard controller... (the account
	// being viewed)
	private Account a;
	
	// We use a standard controller so the system takes care of the parent record's details
	// and allows us to use the page in the layout for that object.
	public RelatedListExtension(ApexPages.StandardController sc)
	{
		a = (Account)sc.GetRecord();
	}
	
	// An example of getting specific related records... in this case just showing up to 5
	// related contacts which have an email address
	public List<Contact> GetRelatedContacts()
	{
		return [select Id, FirstName, LastName, Email from Contact where AccountId = : a.Id and Email != '' limit 5];
	}
}