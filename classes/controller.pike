
inherit Fins.FinsController;
inherit Fins.RootController;

object locations;
object series;
object fonts;

protected void create(object application)
{
  ::create(application);
}

void start()
{
  locations = load_controller("location_controller");
  series = load_controller("series_controller");
  fonts = load_controller("font_controller");
}

void index(object id, object response, mixed ... args)
{
  string req = sprintf("%O", mkmapping(indices(id), values(id)));
  string con = master()->describe_object(this);
  string method = function_name(backtrace()[-1][2]);
  object v = view->get_view("internal:index");

  v->add("appname", "matrixlib");
  v->add("request", req);
  v->add("controller", con);
  v->add("method", method);

  response->set_view(v);
}