// auto-generated by Fins.AdminTools.ModelBuilder for table series.
inherit Fins.Model.DataObject;

string table_name = "series";
string instance_name = "Series";
string instance_name_plural = "Series";

void post_define(Fins.Model.DataModelContext context)
{
  // Add any post configuration logic here
  // set_alternate_key("myalternatekey");
  set_alternate_key("name");
}