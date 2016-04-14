class LoginController < ApplicationController
layout:false

  def index
    if session[:current_user_id] == "3"
     redirect_to '/admin'
    end
  end

  # 登陆这里没用数据库，暂时先写死
  def test
    username = params[:user][:username]
    pwd = params[:user][:password]
    if username == "zimuzu" and pwd == "crashcourse1!9" then
      session[:current_user_id] = "3"
       redirect_to '/admin'
    else
      redirect_to(:back)
    end
  end
  
  
  def admin
    if session[:current_user_id] == "3" then
        @serie_count = Serie.count()
        @episode_count = Episode.count()
      render layout: "admin_layout"
    else
      redirect_to "index"
    end
  end
  
  def justlogmein
    session[:current_user_id] = "3"
    render :plain => "DONE"
  end

  def logout
    session[:current_user_id] = ""
    render :plain => "Logout success"
  end
  
  def serie
    @series = Serie.all
    render layout: "admin_layout"
  end
  
  def episode
    @s = Serie.all.select(:title, :id)
    @page = params[:page]

    # page is INT or not?
    if  @page =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
      #The operator =~ matches a String against a regular expression pattern. 
      #It returns the position/index where the String was matched - or nil if no match was found:
         #render inline:  page
         # page is number
    else
      # page not number
       @page = 1
    end

    per_page = 10   # config this

    if @page.to_i  == 1
        offset = 0
      else 
        offset = ((@page.to_i) -1)* per_page.to_i
    end

    #@total_epiode = Episode.count
    #@total_page = @total_epiode / per_page
    #render plain: @total_page
    #return

    @e = Episode.order(created_at: :desc).limit(10).offset(offset.to_i).includes(:serie)
    @next_page = @page.to_i + 1

    # choose tamplate base upon there are result or not.
    if @e.empty? and @page.to_i != 1
      render layout: "admin_layout", :template => "login/episode_empty"
    else
      render layout: "admin_layout"
    end

  end

end
