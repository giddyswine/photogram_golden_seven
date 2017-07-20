class PicturesController < ApplicationController

    def show
        the_id_number = params["the_id"]
        @the_source = Photo.find(the_id_number).source
        @the_caption = Photo.find(the_id_number).caption
    render("pic_templates/show.html.erb")
    
    end

    def create_row
        @new_photo=Photo.new
        @last_photo_id=Photo.last.id
        @new_photo_id=@last_photo_id+1
        @new_photo.id=@new_photo_id
        @new_photo.source=params["the_source"]
        @new_photo.caption=params["the_caption"]
        @new_photo.save
        
        render("pic_templates/create_row.html.erb") 
    end

    def new_form
        render("pic_templates/new_form.html.erb")
    end
end