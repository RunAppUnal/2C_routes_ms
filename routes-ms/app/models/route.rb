class Route < ApplicationRecord

  def self.addUSer(route,user)#already routed and tested
    #route.update_attribute(:users_in_route, route.users_in_route + user.to_s + ', ')
    Route.find(route).update_attribute(:users_in_route, Route.find(route).users_in_route + user.to_s + ', ')
    Route.find(route).update_attribute(:spaces_available, Route.find(route).spaces_available - 1)
  end

  def self.removeUser(route,user)
    a = Route.find(route).users_in_route
    b = a.split(", ")
    b.delete_at(b.index(user.to_s))
    c = ""
    b.each do |u|
      c = c + u + ", "
    end
    Route.find(route).update_attribute(:users_in_route, c)
    Route.find(route).update_attribute(:spaces_available, Route.find(route).spaces_available + 1)
  end

  def self.checkUserInRoute(route, user)
    a = Route.find(route).users_in_route
    b = a.split(", ")
    b.include? (user.to_s)
  end

  def self.usersInRoute(route)
    Route.find(route).users_in_route.split(", ")
  end

  def self.myRoutes(user)
    Route.where(:user_id => user)
  end

  def self.otherRoutes(user)
    Route.where(["user_id != ?", user]).all
  end

end
