class PicturesController < ApplicationController

    def show
        @the_id_number = params["the_id"]
        @the_source = Photo.find(@the_id_number).source
        @the_caption = Photo.find(@the_id_number).caption
        @the_time_created = Photo.find(@the_id_number).created_at
        @the_time_updated = Photo.find(@the_id_number).updated_at
        
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
        
        redirect_to "/photos"
    end
    
    def update_row
        update_photo=Photo.find(params["some_id"])
        update_photo.source=params["the_source"]
        update_photo.caption=params["the_caption"]
        update_photo.save
        @the_id_number = params["some_id"]
        @the_source = Photo.find(@the_id_number).source
        @the_caption = Photo.find(@the_id_number).caption
        @the_time_created = Photo.find(@the_id_number).created_at
        @the_time_updated = Photo.find(@the_id_number).updated_at
        
       redirect_to "/photos/#{@the_id_number}"
    end

    def new_form
        render("pic_templates/new_form.html.erb")
    end
    
    def index
        @photo_array=Photo.all.ids
        @photos=Photo.all
        @sources=[]
        @ids=[]
        @captions=[]
        @number=Photo.all.ids.count
        @photo_array.each do |photo|
            source = Photo.find(photo).source
            id = Photo.find(photo).id
            caption = Photo.find(photo).caption
            @sources.push(source)
            @ids.push(id)
            @captions.push(caption)
            end
        render("pic_templates/index.html.erb")
    end
    
    def destroy_row
        @killed_picture=Photo.find(params["toast_id"])
        @killed_picture.delete
        @killed_picture.save
        @number_of_pictures=Photo.count
        
       redirect_to "/photos"
    end
    
    
    def edit_form
        @edit_picture=params["an_id"]
        
        render("pic_templates/edit_form.html.erb") 
    end
    
    
    
end