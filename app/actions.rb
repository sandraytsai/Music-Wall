# Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end 

get '/tracks/new' do
  erb :'tracks/new'
end

get '/tracks/:id' do
  @track = Track.find params[:id]
  erb :'tracks/show'
end

post '/tracks' do
  @track = Track.new(
    title: params[:title],
    author: params[:author],
    url: params[:url],
    user_id: session[:id]
    )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end 
end 

get '/upvote/:id' do
  @upvote = Upvote.new(
    user_id: session[:id],
    track_id: params[:id]
  ) 
  @upvote.save
  redirect '/tracks'
end 

get '/users/signup' do 
  erb :'users/signup'
end 

post '/users' do 
  @user = User.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    password: params[:password],
    )
  if @user.save
    session[:id] = @user.id
    redirect '/tracks'
  else
    erb :'users/signup'
  end 
end 

get '/users/login' do
  session.delete(:login_error)
  erb :'users/login'
end 

post '/userlogin' do
  @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
  if @user 
    session.delete(:login_error)
    session[:id] = @user.id
    redirect '/tracks'
  else 
    session.delete(:id)
    session[:login_error] = "E-mail or password is invalid! Please try again."
    erb :'users/login'
  end
end 

get '/users/logout' do
  session.clear
  erb :'users/logout'
end 


