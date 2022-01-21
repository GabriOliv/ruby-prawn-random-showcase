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

        #Page 001
            #bg
            Color_whitesmoke =      "F5F5F5"
            #elemnt
            Color_light_blue =      "008dd2"
            Color_dark_blue =       "01608c"
            Color_light_green =     "6eac15"
            Color_dark_green =      "498000"
            Color_light_red =       "df2a00"
            Color_dark_red =        "b62f00"


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



def page_number_001()
    background_color(Color_whitesmoke)

    #Diagram in svg text
    svg_010_001 = '<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="5205px" height="2130px" viewBox="-0.5 -0.5 5205 2130"><defs/><g><rect x="1400" y="462.5" width="1000" height="400" rx="60" ry="60" fill="#10739e" stroke="none" pointer-events="all"/><g fill="#FFFFFF" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="1899.5" y="644.5">Staging</text><text x="1899.5" y="784.5">(index)</text></g><rect x="0" y="462.5" width="1000" height="400" rx="60" ry="60" fill="#10739e" stroke="none" pointer-events="all"/><g fill="#FFFFFF" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="499.5" y="644.5">Working</text><text x="499.5" y="784.5">Directory</text></g><rect x="2800" y="462.5" width="1000" height="400" rx="60" ry="60" fill="#10739e" stroke="none" pointer-events="all"/><g fill="#FFFFFF" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="3299.5" y="644.5">Local</text><text x="3299.5" y="784.5">Repository</text></g><rect x="4200" y="462.5" width="1000" height="400" rx="60" ry="60" fill="#10739e" stroke="none" pointer-events="all"/><g fill="#FFFFFF" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="4699.5" y="644.5">Remote</text><text x="4699.5" y="784.5">Repository</text></g><path d="M 750 462.5 L 750 112.5 Q 750 62.5 800 62.5 L 1600 62.5 Q 1650 62.5 1650 112.5 L 1650 316.01" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 1650 401.01 L 1607.5 316.01 L 1692.5 316.01 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><path d="M 2150 462.5 L 2150 112.5 Q 2150 62.5 2200 62.5 L 3000 62.5 Q 3050 62.5 3050 112.5 L 3050 316.01" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 3050 401.01 L 3007.5 316.01 L 3092.5 316.01 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><path d="M 3550 462.5 L 3550 112.5 Q 3550 62.5 3600 62.5 L 4400 62.5 Q 4450 62.5 4450 112.5 L 4450 316.01" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 4450 401.01 L 4407.5 316.01 L 4492.5 316.01 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><path d="M 1650 862.5 L 1650 1212.5 Q 1650 1262.5 1600 1262.5 L 800 1262.5 Q 750 1262.5 750 1212.5 L 750 1008.99" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 750 923.99 L 792.5 1008.99 L 707.5 1008.99 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><path d="M 4450 862.5 L 4450 1212.5 Q 4450 1262.5 4400 1262.5 L 3600 1262.5 Q 3550 1262.5 3550 1212.5 L 3550 1008.99" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 3550 923.99 L 3592.5 1008.99 L 3507.5 1008.99 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><path d="M 4450 862.5 L 4450 1612.5 Q 4450 1662.5 4400 1662.5 L 3600 1662.5 Q 3550 1662.5 3550 1612.5 L 3550 1008.99" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 3550 923.99 L 3592.5 1008.99 L 3507.5 1008.99 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><path d="M 3050 862.5 L 3050 1612.5 Q 3050 1662.5 3000 1662.5 L 800 1662.5 Q 750 1662.5 750 1612.5 L 750 1008.99" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 750 923.99 L 792.5 1008.99 L 707.5 1008.99 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><path d="M 4450 862.5 L 4450 2012.5 Q 4450 2062.5 4400 2062.5 L 800 2062.5 Q 750 2062.5 750 2012.5 L 750 1008.99" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 750 923.99 L 792.5 1008.99 L 707.5 1008.99 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><rect x="800" y="62.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="1199.5" y="214.5">add</text></g><rect x="800" y="1062.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="1199.5" y="1214.5">reset</text></g><rect x="1500" y="1462.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="1899.5" y="1614.5">reset [commit]</text></g><rect x="3600" y="1462.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="3999.5" y="1614.5">pull</text></g><rect x="2200" y="62.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="2599.5" y="214.5">commit</text></g><rect x="3600" y="62.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="3999.5" y="214.5">push</text></g><rect x="3600" y="1062.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="3999.5" y="1214.5">fetch</text></g><rect x="2200" y="1862.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="2599.5" y="2014.5">pull</text></g></g></svg>'

    local_width = 400
    local_height = 60

    #Ignora Margin
    move_up 50

    #Title
    formatted_text_box [
        { :text => "GIT", :link => "https://git-scm.com/", :font => "Heavy_Data", :size => 60},
    ],
        :align => :center,
        :valign => :center,
        :at => [Center_page_x - (local_width/2), cursor],
        :width => local_width,
        :height => local_height

    move_down 60

    #Call SVG Image from svg text
    svg svg_010_001, position: :center, :width => 500

    #SubTitle size
    text_size_01 = 12
    #Command size
    text_size_02 = 11

    column_box([0, cursor], :font => "Conspiracy_Bold", :columns => 2, :width => bounds.width) do

        #===========================================

        text "\nCreate", :style => :bold, :size => text_size_01

        text "\nCreate a new local repository\n", :size => text_size_01
        text "git init PROJECT_NAME\n", :style => :bold, :size => text_size_02, :color => Color_dark_blue

        text "\nDownload repository\n", :size => text_size_01
        text "git clone PROJECT_URL\n", :style => :bold, :size => text_size_02, :color => Color_dark_blue

        #===========================================

        text "\nStatus", :style => :bold, :size => text_size_01

        text "\nList modified or new files\n", :size => text_size_01
        text "git status\n", :style => :bold, :size => text_size_02, :color => Color_light_green

        text "\nShow full change history\n", :size => text_size_01
        text "git log\n", :style => :bold, :size => text_size_02, :color => Color_light_green

        text "\nOutput the reflog of the HEAD\n", :size => text_size_01
        text "git reflog\n", :style => :bold, :size => text_size_02, :color => Color_light_green

        #===========================================

        text "\nBranches", :style => :bold, :size => text_size_01

        text "\nList all branches, local and remote\n", :size => text_size_01
        text "git branch\n", :style => :bold, :size => text_size_02, :color => Color_dark_green

        text "\nSwitch to a branch\n", :size => text_size_01
        text "git checkout OTHER_BRANCH\n", :style => :bold, :size => text_size_02, :color => Color_dark_green

        text "\nCreate a new branch\n", :size => text_size_01
        text "git branch NEW_BRANCH\n", :style => :bold, :size => text_size_02, :color => Color_dark_green

        text "\nDelete the branch called\n", :size => text_size_01
        text "git branch -d OTHER_BRANCH\n", :style => :bold, :size => text_size_02, :color => Color_dark_green

        text "\nMerge BRANCH_A into BRANCH_B\n", :size => text_size_01
        text "git checkout BRANCH_B\n", :style => :bold, :size => text_size_02, :color => Color_dark_green
        text "git merge BRANCH_A\n", :style => :bold, :size => text_size_02, :color => Color_dark_green

        #===========================================

        text "\n\nHelp", :style => :bold, :size => text_size_01

        text "\nGit help command\n", :size => text_size_01
        text "git command --help\n", :style => :bold, :size => text_size_02, :color => Color_light_blue

        #===========================================

        text "\nStage and Commit", :style => :bold, :size => text_size_01

        text "\nStage files to commit\n", :size => text_size_01
        text "git add FILE_NAME\n", :style => :bold, :size => text_size_02, :color => Color_light_red

        text "\nUnstage file, keep file changes\n", :size => text_size_01
        text "git reset\n", :style => :bold, :size => text_size_02, :color => Color_light_red

        text "\nRevert everything to the last commit\n", :size => text_size_01
        text "git reset --hard\n", :style => :bold, :size => text_size_02, :color => Color_light_red

        text "\nCommit all stage files to version\n", :size => text_size_01
        text 'git commit -m "commit text" -m "description"', :style => :bold, :size => text_size_02, :color => Color_light_red

        #===========================================

        text "\nGet the latest changes from origin\n", :size => text_size_01
        text "git fetch\n", :style => :bold, :size => text_size_02, :color => Color_dark_red

        text "\nFetch changes from origin and merge\n", :size => text_size_01
        text "git pull\n", :style => :bold, :size => text_size_02, :color => Color_dark_red

        text "\nPush local changes to the origin\n", :size => text_size_01
        text "git push\n", :style => :bold, :size => text_size_02, :color => Color_dark_red

        #===========================================

        text "\nOther", :style => :bold, :size => text_size_01

        text "\nShow what revision and author of a file\n", :size => text_size_01
        text "git blame -b FILE_NAME | less\n", :style => :bold, :size => text_size_02, :color => Color_persian

        text "\nRemove last commit unpushed\n", :size => text_size_01
        text "git reset HEAD~1 --soft   \n", :style => :bold, :size => text_size_02, :color => Color_persian
    end


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

    #Page001--------------

        page_number_001()



end

