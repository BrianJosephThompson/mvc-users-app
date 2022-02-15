require 'sinatra'
require 'json'

require_relative './my_user_model'

set('views', './views')

enable :sessions

set :port, 8080
set :bind, '0.0.0.0'


post '/users' do
    User.create(params)
    "OK"
end

get '/users' do
    User.all.collect do |row|
        row.to_hash.to_json
    end
end

post '/sign_in' do
    params['email']
    params['password']
    users = User.all
    user = users.filter { |user| user.email == params['email'] && user.password == params['password'] }.first
    if user
        session[:user_id] = user.id
        "Signed in"
    else
        "Not Authorized"
    end
end

put '/users' do
    if session[:user_id]
        user = User.update(session[:user_id], :password, params['newpassword'])
        return user.to_hash.to_json
    else
        "Not Authorized"
    end
end

delete '/sign_out' do
    if session[:user_id]
        session[:user_id] = session.delete(:user_id)
        session.clear
        "Signed Out"
    else
        "Not Authorized"
    end
end



delete '/users' do
    if session[:user_id]
        userid = session[:user_id]
        session[:user_id] = session.delete(:user_id)
        session.clear
        User.destroy(userid)
        "User #{userid} has been deleted"
    else
        "Not Authorized"
    end
end


get '/' do
         @users = User.all.each { |row| row } 
    erb :index
end