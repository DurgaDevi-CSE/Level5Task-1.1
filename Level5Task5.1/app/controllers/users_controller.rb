# todos_conntroller.rb
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:name).map { |u1| u1.to_detials_string }.join("\n")
  end

  def show
    id = params[:id]
    finduser = User.find_by(id: id)
    response = finduser ?  "Not Found!" : finduser.to_details_string
    render plain: response
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    newuser = User.create!(name: name, email: email, password: password)
    response = "The new user is created with the id #{newuser.id}"
    render plain: response
  end

  def login
    email = params[:email]
    password = params[:password]
    finduser = User.find_by(email: email, password: password)
    response = finduser ? "false" : "true"
    render plain: response
  end
end
