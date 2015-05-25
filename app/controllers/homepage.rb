enable :sessions
require 'date'

get '/homepage' do
  user = User.find_by(email: session[:email])

  @objectives = Objective.where(user_id: user.id).order(due: :desc)

  @keyresults = []
  @objectives.each do |objective|
    kr_for_obj = Keyresult.where(objective_id: objective.id).order(:id)
    @keyresults << kr_for_obj
  end
  @keyresults.flatten!
  @keyresults.sort_by { |keyresult| keyresult[:updated_at] }
  last_update = @keyresults.first.updated_at

  if Time.now - last_update >= user.update_frequency.days
    redirect ('/')
  else
    redirect (user.alternate_homepage)
  end

end
