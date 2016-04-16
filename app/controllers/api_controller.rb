class ApiController < ApplicationController
  layout:false

  
  def newest
    config_per_page = 10
    page = params[:page]

          # page is valid or not?
          if page_is_number(page) == false
           render inline:  "false"
         end

         if page.to_i  == 1
          offset = 0
        else 
          offset = page.to_i * config_per_page.to_i
        end

        @e = Episode
        .order("created_at DESC")
        .limit(config_per_page)
        .offset(offset.to_i)
        .select(:title, :id, :video_link, :number, :image, :translator, :created_at, :author_link, :html5)

        if @e.empty?
          render :nothing => true
        else
          render json: @e
        end

      end

    def episode
            episode = Episode.find_by_id(params[:id])
            # find method throw Exception when can't find record
            # find_by_*  return nil when can't find record
            # http://stackoverflow.com/questions/9709659/rails-find-getting-activerecordrecordnotfound
        if episode == nil
          render :nothing => true
        else
          render json: episode
        end

    end

  # return all series
  def series
    # serie don't change a lot. so use redis here
    redis = Redis.new
    json = redis.get('cache-series')
    if json != nil
        render :inline => json
        return
    end

    @s = Serie.all.select(:title, :id, :image)
    render :inline => @s.to_json
    redis.set('cache-series', @s.to_json)
  end
  
  private 
  def cc_image_path(name)
    return view_context.image_path name
  end

  def page_is_number(page)
    if  page =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/  # page is INT or not?
      return true
    else
      return false
    end
  end

end
