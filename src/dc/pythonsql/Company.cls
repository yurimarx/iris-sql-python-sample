Class dc.pythonsql.Company Extends (%Persistent, %Populate)
{

Property Name As %String;

Property Street As %String(MAXLEN = 200);

Property City As %String(MAXLEN = 80);

Property State As %String(MAXLEN = 2);

Property Zip As %String(MAXLEN = 10);

ClassMethod GetFullAddress(Street As %String, City As %String, State As %String) As %String [ Language = python, SqlName = GetFullAddress, SqlProc ]
{
    import geopy.geocoders
    from geopy.geocoders import Nominatim
    geopy.geocoders.options.default_timeout = 7
    geolocator = Nominatim(user_agent="intersystems_iris")
    location = geolocator.geocode(Street + ", " + City + ", " + State, country_codes="US")
    return location.address
}

ClassMethod GetHumanDate(Sentence As %String) As %String [ Language = python, SqlName = GetHumanDate, SqlProc ]
{
    from chronyk import Chronyk
    t = Chronyk(Sentence)
    return t.ctime()
}

ClassMethod CreateFiveCompanies() As %Status
{
    Do ..CreateCompany("InterSystems", "One Memorial Drive", "Cambridge", "MA", "")
    Do ..CreateCompany("Google", "1600 Amphitheatre Parkway", "Mountain View", "CA", "")
    Do ..CreateCompany("Microsoft", "1065 La Avenida", "Mountain View", "CA", "")
    Do ..CreateCompany("IBM", "1 Orchard Rd", "Armonk", "NY", "")
    Do ..CreateCompany("Amazon", "410 Terry Ave. N", "Seattle", "WA", "")
}

ClassMethod CreateCompany(Name As %String, Street As %String, City As %String, State As %String, Zip As %String) As %Status
{
 
    Set company = ##class(dc.pythonsql.Company).%New()
    Set company.Name = Name
    Set company.Street = Street
    Set company.City = City
    Set company.State = State
    Set company.Zip = Zip

    Set sc = company.%Save()

    Return sc
}

Storage Default
{
<Data name="CompanyDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Street</Value>
</Value>
<Value name="4">
<Value>City</Value>
</Value>
<Value name="5">
<Value>State</Value>
</Value>
<Value name="6">
<Value>Zip</Value>
</Value>
</Data>
<DataLocation>^dc.pythonsql.CompanyD</DataLocation>
<DefaultData>CompanyDefaultData</DefaultData>
<IdLocation>^dc.pythonsql.CompanyD</IdLocation>
<IndexLocation>^dc.pythonsql.CompanyI</IndexLocation>
<StreamLocation>^dc.pythonsql.CompanyS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
