class FilesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_lecture
  
  def load_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
  
  def index
    load_files
    
    @file = LectureFile.new
    
    respond_with @files
  end
  
  def load_files
    @files = @lecture.lecture_files.with_person.by_date.paginate :page => params[:page], :per_page => 10
  end
  
  def create
    
    
    @file = LectureFile.new(params[:lecture_file])
    @file.person = @user
    @file.lecture_id = params[:lecture_id]
    
    if params[:file] && params[:file][:upload]
      @file.name = params[:file][:upload].original_filename
      
      directory = "public/system/lecture_files/#{@lecture.id}"
      
      Dir.mkdir("public/system") unless File.exists?("public/system")
      Dir.mkdir("public/system/lecture_files") unless File.exists?("public/system/lecture_files")
      Dir.mkdir("public/system/lecture_files/#{@lecture.id}") unless File.exists?("public/system/lecture_files/#{@lecture.id}")
      
      # create the file path
      path = File.join(directory, @file.name)
      # write the file
      File.open(path, "wb") { |f| f.write(params[:file][:upload].read) }
    end
    
    if @file.save
      respond_with @file, :location => {:action => "index"}
    else
      load_files
      render :index
    end
  end
  
  def download
    @file = LectureFile.find params[:id]
    send_file "public/system/lecture_files/#{@lecture.id}/#{@file.name}", :x_sendfile=>true
  end
  
  def destroy
    @file = LectureFile.find params[:id]
    @file.destroy

    respond_with @file, :location => {:action => "index"}
  end
end
