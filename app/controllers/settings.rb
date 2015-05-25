enable :sessions

get '/settings' do
  @user = User.find_by(email: session[:email])

  erb :'/settings/index'
end

get '/settings/profile' do
  @user = User.find_by(email: session[:email])
  erb :'/settings/profile'
end

put '/settings/profile' do
  @user = User.find_by(email: session[:email])

  begin
    if @user.update(name: params[:name], email: params[:email])
      session[:email] = @user.email
      @user.password = params[:password]
      redirect '/settings'
    end
  rescue
    @error_message = "Update unsuccessful."
    erb :'/settings/profile'
  end
end

get '/settings/objectives' do
  user = User.find_by(email: session[:email])

  @objectives = Objective.where(user_id: user.id).order(:id)

  erb :'settings/objectives'
end

put '/settings/objectives' do

  params.each do |param, value|
    if param != "_method"
      objective = Objective.find(param)
      objective.update(description: value["description"], due: value["due"])
    end
  end

  redirect '/settings'
end


get '/settings/keyresults' do
  if session[:email]

    user = User.find_by(email: session[:email])

    @objectives = Objective.where(user_id: user.id).order(:id)

    @keyresults = []
    @objectives.each do |objective|
      kr_for_obj = Keyresult.where(objective_id: objective.id).order(:id)
      @keyresults << kr_for_obj
    end

  end

  erb :'settings/keyresults'
end

put '/settings/keyresults' do

  params.each do |param, value|
    if param != "_method"
      keyresult = Keyresult.find(param)
      keyresult.update(goal: value["goal"], unit: value["unit"], action: value["action"])
    end
  end

  redirect '/settings'
end

get '/settings/keyresults/delete' do
  Keyresult.destroy(params[:keyresult])
  redirect '/settings/keyresults'
end

get '/settings/objectives/delete' do
  Keyresult.destroy_all(objective_id: params[:objective])
  Objective.destroy(params[:objective])
  redirect '/settings/objectives'
end

get '/settings/keyresults/new' do
  user = User.find_by(email: session[:email])
  @objectives = Objective.where(user_id: user.id).order(:id)
  erb :'settings/new_keyresult'
end

