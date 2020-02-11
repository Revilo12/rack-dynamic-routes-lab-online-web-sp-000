class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match('/items/'')
      search_item = /(?<=\/items\/).+/.match(req.path).to_s
      item = @@items.find {|item| item.name == search_item} if search_item
      if item
        resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404

    resp.finish
    end
  end
end
