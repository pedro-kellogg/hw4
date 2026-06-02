Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })

  get("/login", { :controller => "sessions", :action => "new" })
  post("/login", { :controller => "sessions", :action => "create" })
  get("/logout", { :controller => "sessions", :action => "destroy" })

  get("/signup", { :controller => "users", :action => "new" })
  post("/signup", { :controller => "users", :action => "create" })

  resources "places" do
    resources "entries"
  end
end
