object @movie
attributes :id, :title, :release_date, :overview, :available_inventory


# m is the object being rendered, also supports :unless
# attributes :foo, :bar, :if => lambda { |m| m.condition? }
