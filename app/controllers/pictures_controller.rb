class PicturesController < ApplicationController

    def show
        the_id_number = params["the_id"]
        @the_source = Photo.find(the_id_number).source
        @the_caption = Photo.find(the_id_number).caption
        @the_time_created = Photo.find(the_id_number).created_at
        @the_time_updated = Photo.find(the_id_number).updated_at
        
        render("pic_templates/show.html.erb")
    
    end

    def create_row
        new_photo=Photo.new
        last_photo_id=Photo.last.id
        new_photo_id=last_photo_id+1
        new_photo.id=new_photo_id
        new_photo.source=params["the_source"]
        new_photo.caption=params["the_caption"]
        new_photo.save
        @number_of_pictures=Photo.count
        
        render("pic_templates/create_row.html.erb") 
    end

    def new_form
        render("pic_templates/new_form.html.erb")
    end
    
    def index
        @photo_array=Photo.all.ids
        @photo_array=Photo.all.ids
        @photos=Photo.all
        @new=[]
        @number=Photo.all.ids.count
        @photo_array.each do |photo|
            source = Photo.find(photo).source
            @new.push(source)
            end
        render("pic_templates/index.html.erb")
    end
    
    def destroy_row
        @killed_picture=Photo.find(params["toast_id"])
        @killed_picture.delete
        @killed_picture.save
        @number_of_pictures=Photo.count
        
        render("pic_templates/delete_row.html.erb") 
    end
    
    
    def edit_form
        render("pic_templates/edit_form.html.erb") 
    end
    
    
    
end