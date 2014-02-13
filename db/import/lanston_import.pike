int main(int argc, array argv){ 
if(argc != 2)
 exit(1, "usage: lanston_import LANSTONFILE.CSV");

foreach(Stdio.read_file(argv[1])/"\n";;string l)
 {                                                                                                                     
   array ld = l/"\t";                                                                                                  
   string h = "";
   string series = String.trim_all_whites(ld[0]);                                                                      
   string name = String.trim_all_whites(ld[1]);                                                                        
   if(has_prefix(name, "GO TO"))                                                                                      
     sscanf(name, "%*s (%s)", name);
    object s = matrixlib.Objects.Series();
  if(has_suffix(name, " Characters)"))
  {
    sscanf(name, "%*s (%s %*s", h);
    werror("got " + h + "\n");
    }
s["series"] = series + (sizeof(h)?("-" + h):"");
s["name"] = name;
if(catch(s->save()))
{
   write("error saving series %s\n", series);
}
//   write(series + " " + name + "\n");
   }

}
