require "prawn"
require "prawn-svg"
require "prawn/table"

#Name of File .rb
a = __FILE__
#Name of File .pdf
name_file = a[0..(a.size-4)] + ".pdf"
#PDF Page size
page_size = "A4"
#PDF Page Margin
page_margin = 50


# PDF Define =========================================================
#=====================================================================
    #Sizes Default
        #A4 = 595.28 - margin = 495.28
        Page_size_x = 495.28
        #A4 = 841.89 - margin = 741.89
        Page_size_y = 741.89
        #Ponto de Centro da Pagina
        Center_page_x = Page_size_x/2
        Center_page_y = Page_size_y/2

    #Color List
        #Page 000
            #bg
            Color_white =           "FFFFFF"
            #elemnt
            Color_black =           "000000"
            Color_persian =         "1C39BB"


# Methods ============================================================
#=====================================================================

def Form_draw(x, y, sides, size)
    if sides == 6
        fill_polygon    [x, y + 50 * size], [x - 43.3 * size, y + 25 * size], [x - 43.3 * size, y - 25 * size], [x, y - 50 * size], [x + 43.3 * size, y - 25 * size], [x + 43.3 * size, y + 25 * size]
    end
end


def Default_Stroke(page_size_x, page_size_y, pos_x, pos_y, lengthgrid, colorgrid)
    stroke_axis(
        :at =>[pos_x, pos_y],
        :height => page_size_y,
        :width => page_size_x,
        :step_length => lengthgrid,
        :negative_axes_length => 0,
        :color => colorgrid
    )
end


def background_color(color)
    tmp_color = fill_color
    canvas do
        fill_color color
        fill_rectangle [bounds.left, bounds.top], bounds.right, bounds.top
    end
    fill_color tmp_color
end


# Pages ==============================================================
#=====================================================================

def page_number_000()
    background_color(Color_white)

    #BackGround Page
    Form_draw(Center_page_x, Center_page_y, 6, 12)
    fill_color Color_white
    Form_draw(Center_page_x, Center_page_y, 6, 10.3)

    #Metric Grid
    5.times{
        Default_Stroke(Page_size_x, Page_size_y, 0, 0, 100, '0000ff')
        rotate(180, :origin => [Page_size_x, Page_size_y]) do
            Default_Stroke(Page_size_x, Page_size_y, Page_size_x, Page_size_y, 100, '0000ff')
        end

        Default_Stroke(Page_size_x/2, Page_size_y/2, Page_size_x/4, Page_size_y/4, 50, Color_black)
        rotate(180, :origin => [Page_size_x*3/4, Page_size_y*3/4]) do
            Default_Stroke(Page_size_x/2, Page_size_y/2, Page_size_x*3/4, Page_size_y*3/4, 50, Color_black)
        end
    }

    #Central Hexa
    fill_color Color_persian
    Form_draw(Center_page_x, Center_page_y+80, 6, 3)
    fill_color Color_white
    Form_draw(Center_page_x, Center_page_y+80, 6, 2)
    fill_color Color_black
    Form_draw(Center_page_x, Center_page_y+80, 6, 1)

    #Draw Grid
    i=0; while i < Page_size_x
        j=0; while j < Page_size_y
            fill_circle [i, j], 0.5
            j += 10
        end
        i += 10
    end

    move_down 345

    #Title
    fill_color Color_black
    font("Heavy_Data") do
        fill_color Color_white
        text "Mystical\nDigital\nGrimoire",
            #:styles => [:bold],
            :size => 65,
            :align => :center
            move_up 210
        fill_color Color_black
        text "Mystical\nDigital\nGrimoire",
            :size => 65,
            :align => :center
    end

    move_down 190

    #SubTitle
    local_width = 200
    local_height = 50
    #stroke_rectangle([Center_page_x - (local_width/2), cursor], local_width, local_height)
    formatted_text_box [ 
        { :text => "Writed by", :font => "Conspiracy", :size => 12},
        { :text => " Architect ", :font => "Conspiracy_PR", :size => 16}
    ],
        :align => :center,
        :valign => :center,
        :at => [Center_page_x - (local_width/2), cursor],
        :width => local_width,
        :height => local_height


    start_new_page
end



# PDF Creation =======================================================
#=====================================================================

Prawn::Document.generate( name_file, :page_size => page_size, :margin => page_margin ) do
    #PDF Structure n Variables
        #PDF Font Families
            font_families.update("Heavy_Data" => {:normal => "support/Heavy_Data.ttf"})

            font_families.update("Conspiracy" => {:normal => "support/Conspiracy.ttf"})
            font_families.update("Conspiracy_PR" => {:normal => "support/Conspiracy_PR.ttf",})
            font_families.update("Conspiracy_Bold" => {:normal   => "support/Conspiracy_Bold.ttf",})

        #Pag Number
            page_number_size = page_margin/2
            page_number_position_x = Page_size_x
            page_number_position_y = 0
            repeat(:all, :dynamic => true) do
                unless page_number == 1
                    fill_color Color_white
                    fill_rectangle([page_number_position_x + page_number_size, page_number_position_y - page_number_size], page_number_size, page_number_size)

                    fill_color Color_black
                    stroke_rectangle([page_number_position_x + page_number_size, page_number_position_y - page_number_size], page_number_size, page_number_size)

                    formatted_text_box [
                        { :text => "#{page_number-1}", :anchor => 'Cod000', :size => 16},
                    ],
                        :align => :center,
                        :valign => :center,
                        :at => [page_number_position_x + page_number_size, page_number_position_y - page_number_size],
                        :width => page_number_size,
                        :height => page_number_size
                end
            end

    add_dest "Cod000", dest_xyz(bounds.absolute_left, y)

    #Page000--------------

        page_number_000()



end

