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
  erb :'tracks/index'
end 

get '/users/signup' do 
  erb :'users/signup'
end 

post '/users' do 
  @user = User.new(
    name: params[:name],
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
  erb :'users/login'
end 

post '/userlogin' do
  @user = User.find_by(email: params[:email])
  if @user && @user.password == params[:password]
    session[:id] = @user.id
    redirect '/tracks'
  else 
    erb :'users/login'
  end
end 

get '/users/logout' do
  session.clear
  erb :'users/logout'
end 


