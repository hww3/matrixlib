// paste me into hilfe!
Fins.Model.find.series((["series": Fins.Model.LikeCriteria("B%") ]))->delete(); 
object p = Parser.CSV(Stdio.File("db/import/english_import.csv"));
p->parsehead();                                                   
// skip the header
p->fetchrecord();                                                 

mapping r;
while(r = p->fetchrecord())
{
  object s = matrixlib.Objects.Series();

    r->arrangement = String.trim_all_whites(utf8_to_string(r->arrangement));

  array n = r->name/"\n";
  s["series"] = "B" + r->series;
  s["name"] = n[0];
  s["notes"] = (((sizeof(n) > 1)?(n[1] + "\n"):"") + r->notes + (sizeof(r->arrangement)?("\n\nArrangement: " + r->arrangement):""));
  write(s["name"] + "\n");
  if(catch(s->save()))
    werror("Failed to save %s.\n", s["series"]);
}
