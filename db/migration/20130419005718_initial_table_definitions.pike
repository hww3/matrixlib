inherit Fins.Util.MigrationTask;
  
constant id = "20130419005718";
constant name="initial_table_definitions";

void up()
{
  object tb = get_table_builder("locations");
  tb->add_field(@tb->ID);
  tb->add_field("name", "string", (["length": 30, "unique": 1]));
  tb->go();
  
  tb = get_table_builder("series");
  tb->add_field(@tb->ID);
  tb->add_field("name", "string", (["length": 32]));
  tb->add_field("series", "string", (["length": 12, "unique": 1]));
  tb->add_field("notes", "string", (["length": 256]));
  tb->go();
  
  tb = get_table_builder("fonts");
  tb->add_field(@tb->ID);
  tb->add_field("type", "string", (["length": 2]));
  tb->add_field("name", "string", (["length": 32]));
  tb->add_field("location_id", "integer", (["not_null": 1]));
  tb->add_field("position", "string", (["length": 16]));
  tb->add_field("condition", "string", (["length": 32]));
  tb->add_field("size", "integer");
  tb->add_field("notes", "string", (["length": 1024]));
  tb->go();

  tb = get_table_builder("fonts_series");
  tb->add_field("font_id", "integer", (["not_null": 1]));
  tb->add_field("series_id", "integer", (["not_null": 1]));
  tb->go();
}

void down()
{
  drop_table("fonts_series"); 
  drop_table("fonts");   
  drop_table("series"); 
  drop_table("locations"); 
}
