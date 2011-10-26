class FilesController < ApplicationController
  before_filter :load_lecture
  
  def load_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
  
  def index
    load_files
    
    @file = LectureFile.new
  end
  
  def load_files
    @files = LectureFile.paginate :conditions => ['lecture_id = ?', params[:lecture_id]], 
                                  :page => params[:page], 
                                  :order => 'created_at DESC'
  end
  
  def create
    @file = LectureFile.new(params[:lecture_file])
    @file.person = @user
    @file.lecture_id = params[:lecture_id]
    @file.name = params[:file][:upload].original_filename
    
    directory = "public/system/lecture_files/#{@lecture.id}"
    
    Dir.mkdir("public/system") unless File.exists?("public/system")
    Dir.mkdir("public/system/lecture_files") unless File.exists?("public/system/lecture_files")
    Dir.mkdir("public/system/lecture_files/#{@lecture.id}") unless File.exists?("public/system/lecture_files/#{@lecture.id}")
    
    # create the file path
    path = File.join(directory, @file.name)
    # write the file
    File.open(path, "wb") { |f| f.write(params[:file][:upload].read) }
    
    respond_to do |format|
      if @file.save
        format.html { redirect_to({:action => "index"}, :notice => 'Object was successfully created.') }
        format.xml  { render :xml => @file, :status => :created, :location => @file }
      else
        format.html {
          load_walls
          render :action => "index"
        }
        format.xml  { render :xml => @file.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def download
    @file = LectureFile.find(params[:id])
    send_file "public/system/lecture_files/#{@lecture.id}/#{@file.name}", :x_sendfile=>true
  end
  
  def destroy
    @file = LectureFile.find(params[:id])
    @file.destroy

    respond_to do |format|
      format.html { redirect_to({:action => "index"}) }
      format.xml  { head :ok }
    end
  end
end
