Class Application

  def call(env)
    resp = Rack::Response.new 
    req = Rack::Response.new(env)
    
    if req.path.match(/items/)
      item = req.path.split("/items/").last 
      if item_object = @@items.detect {|i| i.name == item}
        resp.write "#{item_object.name}: $#{item_object.price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      
        