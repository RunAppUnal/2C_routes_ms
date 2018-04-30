
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
    Route.find(route).users_in_route.first(-2)
  end

  def self.myRoutes(user)
    Route.where(:user_id => user).all
  end

  def self.otherRoutes(user)
    Route.where(["user_id != ?", user]).all
  end

  def self.searchMyRoutes(keyword, cost, date, spaces, user)
    results = Route.where(["user_id = ?", user]).all
    results = results.where(["(title LIKE ? OR description LIKE ?) AND user_id = ?", '%' + keyword + '%', '%' + keyword + '%', user]) if keyword.present?
    results = results.where(["cost <= ? and user_id = ?", cost, user]) if cost.present?
    results = results.where("spaces_available >= ?", spaces).where(:user_id => user) if spaces.present?
    results = results.where('departure >= ?', DateTime.parse(date)).where(:user_id => user) if date.present?
    return results
  end

  def self.searchOtherRoutes(keyword, cost, date, spaces, user)
    results = Route.where(["user_id != ?", user]).all
    results = results.where(["(title LIKE ? OR description LIKE ?)", '%' + keyword + '%', '%' + keyword + '%']) if keyword.present?
    results = results.where(["cost <= ? and user_id != ?", cost, user]) if cost.present?
    results = results.where("spaces_available >= ?", spaces).where.not(:user_id => user) if spaces.present?
    results = results.where('departure >= ?', DateTime.parse(date)).where.not(:user_id => user) if date.present?
    return results
  end

  def self.findme(route)
    Route.find(route)
  end

end
