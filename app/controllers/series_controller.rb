class SeriesController < ApplicationController
layout:false
  before_action :set_series, only: [:show, :edit, :update, :destroy]


  def index
    @series = Serie.all
  end

  def show
    @e = @series.episodes
    render layout: "admin_layout"
  end

  def new
    @series = Serie.new
    render "login/serie_new", layout: "admin_layout"
  end

  # GET /series/1/edit
  def edit
  end

  # 新 series
  # 图片名字保留原后缀, 但是名字变成时间戳, 避免图片文件互相覆盖, 以及图片文件名有可能过长的问题.
  def create
    @series = Serie.new(series_params)

    uploaded_io = params[:serie][:image]

    folder_under_public = 'uploads/serie/'
=begin
    dirname = File.dirname(folder_under_public)
    unless File.directory?(dirname)
      FileUtils.mkdir_p(dirname)
    end
=end
    relative_file_path = folder_under_public + Time.now.to_i.to_s + File.extname(uploaded_io.original_filename)
    # uploads/1460553543.jpg
 
    full_path2 = Rails.root.join('public/', relative_file_path)

    File.open(full_path2, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @series.image = relative_file_path
    
    respond_to do |format|
      if @series.save
        
        format.html { redirect_to controller: 'login', action: 'serie' }
        #format.json { render :show, status: :created, location: @series }
        
      else
        format.html { render :new }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /series/1
  # PATCH/PUT /series/1.json
  def update
    respond_to do |format|
      if @series.update(series_params)
        format.html { redirect_to @series, notice: 'Serie was successfully updated.' }
        format.json { render :show, status: :ok, location: @series }
      else
        format.html { render :edit }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @series.destroy
    redirect_to '/admin/serie'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Serie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_params
      #params.require(:series).permit(:name, :img_url)
      params.require(:serie).permit(:title, :img_url)
    end
end
