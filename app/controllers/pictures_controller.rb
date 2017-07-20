class PicturesController < ApplicationController

    def show
        the_id_number = params["the_id"]
        @the_source = Photo.find(the_id_number).source
        @the_caption = Photo.find(the_id_number).caption
    render("pic_templates/show.html.erb")
    
    end



    def new_form
        render("pic_templates/new_form.html.erb")
    end
end