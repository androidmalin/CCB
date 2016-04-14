class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]

  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    
  end

  # GET /episodes/new
  def new
    @episode = Episode.new
  end

  # GET /episodes/1/edit
  def edit
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = Episode.new(episode_params)
    @episode.translator = params[:episode][:author_name]
    
    #
    # process url
    #
    video_link = params[:episode][:video_link]  #assume this is 'http://www.bilibili.com/video/av4281373/'
    uri = URI.parse(video_link)
    host_middle = uri.host.split('.')[1]  # host_middle would be  'bilibili'

    # 
    # image upload process
    #
    uploaded_io = params[:episode][:image]
    relative_file_path = 'uploads/episode/' + Time.now.to_i.to_s + File.extname(uploaded_io.original_filename)

    full_path = Rails.root.join('public/', relative_file_path)

    File.open(full_path, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @episode.image = relative_file_path
    
    #
    # save
    #
    respond_to do |format|
      if @episode.save
            render :nothing => true
            # background job... get cid and then get interface xml
            if host_middle == 'bilibili'
                  episode_id = @episode.id
                  aid = /(\d+)/.match(video_link)
                  aid = aid.to_s
                  BilibiliCidJob.perform_later(episode_id, aid)
            end
      else
      render :nothing => true
        #format.html { render :new }
        #format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_to @episode, notice: 'Episode was successfully updated.' }
        format.json { render :show, status: :ok, location: @episode }
      else
        format.html { render :edit }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @episode.destroy
    #redirect_to '/admin/episode/1'
    redirect_to(:back)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def episode_params
      params.require(:episode).permit(:title, :image, :video_link, :author_link, :number, :serie_id)
      # let episode.save can work
      # otherwise you have to @episode.title = params[:episode][:title] which is annoying
    end
end




