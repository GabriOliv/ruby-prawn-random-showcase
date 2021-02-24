require "prawn"
require "prawn-svg"
require "prawn/table"

#Name of File .rb
a = __FILE__
#Name of File .pdf
name_file = a[0..(a.size-4)] + ".pdf"
#PDF Page size
Page_size = "A4"
#PDF Page Margin
Page_margin = 50


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

        #Page 002
            #elemnt
            Color_nero =            "252525"

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
    svg_001_001 = '<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="5205px" height="2130px" viewBox="-0.5 -0.5 5205 2130"><defs/><g><rect x="1400" y="462.5" width="1000" height="400" rx="60" ry="60" fill="#10739e" stroke="none" pointer-events="all"/><g fill="#FFFFFF" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="1899.5" y="644.5">Staging</text><text x="1899.5" y="784.5">(index)</text></g><rect x="0" y="462.5" width="1000" height="400" rx="60" ry="60" fill="#10739e" stroke="none" pointer-events="all"/><g fill="#FFFFFF" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="499.5" y="644.5">Working</text><text x="499.5" y="784.5">Directory</text></g><rect x="2800" y="462.5" width="1000" height="400" rx="60" ry="60" fill="#10739e" stroke="none" pointer-events="all"/><g fill="#FFFFFF" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="3299.5" y="644.5">Local</text><text x="3299.5" y="784.5">Repository</text></g><rect x="4200" y="462.5" width="1000" height="400" rx="60" ry="60" fill="#10739e" stroke="none" pointer-events="all"/><g fill="#FFFFFF" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="4699.5" y="644.5">Remote</text><text x="4699.5" y="784.5">Repository</text></g><path d="M 750 462.5 L 750 112.5 Q 750 62.5 800 62.5 L 1600 62.5 Q 1650 62.5 1650 112.5 L 1650 316.01" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 1650 401.01 L 1607.5 316.01 L 1692.5 316.01 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><path d="M 2150 462.5 L 2150 112.5 Q 2150 62.5 2200 62.5 L 3000 62.5 Q 3050 62.5 3050 112.5 L 3050 316.01" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 3050 401.01 L 3007.5 316.01 L 3092.5 316.01 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><path d="M 3550 462.5 L 3550 112.5 Q 3550 62.5 3600 62.5 L 4400 62.5 Q 4450 62.5 4450 112.5 L 4450 316.01" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 4450 401.01 L 4407.5 316.01 L 4492.5 316.01 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><path d="M 1650 862.5 L 1650 1212.5 Q 1650 1262.5 1600 1262.5 L 800 1262.5 Q 750 1262.5 750 1212.5 L 750 1008.99" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 750 923.99 L 792.5 1008.99 L 707.5 1008.99 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><path d="M 4450 862.5 L 4450 1212.5 Q 4450 1262.5 4400 1262.5 L 3600 1262.5 Q 3550 1262.5 3550 1212.5 L 3550 1008.99" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 3550 923.99 L 3592.5 1008.99 L 3507.5 1008.99 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><path d="M 4450 862.5 L 4450 1612.5 Q 4450 1662.5 4400 1662.5 L 3600 1662.5 Q 3550 1662.5 3550 1612.5 L 3550 1008.99" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 3550 923.99 L 3592.5 1008.99 L 3507.5 1008.99 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><path d="M 3050 862.5 L 3050 1612.5 Q 3050 1662.5 3000 1662.5 L 800 1662.5 Q 750 1662.5 750 1612.5 L 750 1008.99" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 750 923.99 L 792.5 1008.99 L 707.5 1008.99 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><path d="M 4450 862.5 L 4450 2012.5 Q 4450 2062.5 4400 2062.5 L 800 2062.5 Q 750 2062.5 750 2012.5 L 750 1008.99" fill="none" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="stroke"/><path d="M 750 923.99 L 792.5 1008.99 L 707.5 1008.99 Z" fill="#23445d" stroke="#23445d" stroke-width="55" stroke-miterlimit="10" pointer-events="all"/><rect x="800" y="62.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="1199.5" y="214.5">add</text></g><rect x="800" y="1062.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="1199.5" y="1214.5">reset</text></g><rect x="1500" y="1462.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="1899.5" y="1614.5">reset [commit]</text></g><rect x="3600" y="1462.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="3999.5" y="1614.5">pull</text></g><rect x="2200" y="62.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="2599.5" y="214.5">commit</text></g><rect x="3600" y="62.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="3999.5" y="214.5">push</text></g><rect x="3600" y="1062.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="3999.5" y="1214.5">fetch</text></g><rect x="2200" y="1862.5" width="800" height="200" rx="30" ry="30" fill="none" stroke="none" pointer-events="all"/><g fill="#000000" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="115px"><text x="2599.5" y="2014.5">pull</text></g></g></svg>'

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

    #SVG Call
    svg svg_001_001, position: :center, :width => 500

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



def page_number_002()
    background_color(Color_nero)

    #Diagram in svg text
    svg_020_001 = '<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="1816px" height="1897px" viewBox="-0.5 -0.5 1816 1897"><defs/><g><rect x="8" y="8" width="1800" height="200" rx="30" ry="30" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-start; width: 448px; height: 1px; padding-top: 27px; margin-left: 4px;"><div style="box-sizing: border-box; font-size: 0; text-align: left; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">EAX</div></div></div></foreignObject><text x="4" y="32" fill="#FFFFFF" font-family="Helvetica" font-size="15px" font-weight="bold">EAX</text></switch></g><rect x="8" y="248" width="1800" height="200" rx="30" ry="30" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-start; width: 448px; height: 1px; padding-top: 87px; margin-left: 4px;"><div style="box-sizing: border-box; font-size: 0; text-align: left; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">EBX</div></div></div></foreignObject><text x="4" y="92" fill="#FFFFFF" font-family="Helvetica" font-size="15px" font-weight="bold">EBX</text></switch></g><rect x="8" y="488" width="1800" height="200" rx="30" ry="30" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-start; width: 448px; height: 1px; padding-top: 147px; margin-left: 4px;"><div style="box-sizing: border-box; font-size: 0; text-align: left; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">ECX</div></div></div></foreignObject><text x="4" y="152" fill="#FFFFFF" font-family="Helvetica" font-size="15px" font-weight="bold">ECX</text></switch></g><rect x="8" y="728" width="1800" height="200" rx="30" ry="30" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-start; width: 448px; height: 1px; padding-top: 207px; margin-left: 4px;"><div style="box-sizing: border-box; font-size: 0; text-align: left; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">EDX</div></div></div></foreignObject><text x="4" y="212" fill="#FFFFFF" font-family="Helvetica" font-size="15px" font-weight="bold">EDX</text></switch></g><rect x="176" y="48" width="760" height="120" rx="18" ry="18" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-end; width: 188px; height: 1px; padding-top: 27px; margin-left: 44px;"><div style="box-sizing: border-box; font-size: 0; text-align: right; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">AX</div></div></div></foreignObject><text x="232" y="32" fill="#FFFFFF" font-family="Helvetica" font-size="15px" text-anchor="end" font-weight="bold">AX</text></switch></g><rect x="176" y="288" width="760" height="120" rx="18" ry="18" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-end; width: 188px; height: 1px; padding-top: 87px; margin-left: 44px;"><div style="box-sizing: border-box; font-size: 0; text-align: right; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">BX</div></div></div></foreignObject><text x="232" y="92" fill="#FFFFFF" font-family="Helvetica" font-size="15px" text-anchor="end" font-weight="bold">BX</text></switch></g><rect x="176" y="528" width="760" height="120" rx="18" ry="18" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-end; width: 188px; height: 1px; padding-top: 147px; margin-left: 44px;"><div style="box-sizing: border-box; font-size: 0; text-align: right; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">CX</div></div></div></foreignObject><text x="232" y="152" fill="#FFFFFF" font-family="Helvetica" font-size="15px" text-anchor="end" font-weight="bold">CX</text></switch></g><rect x="176" y="768" width="760" height="120" rx="18" ry="18" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-end; width: 188px; height: 1px; padding-top: 207px; margin-left: 44px;"><div style="box-sizing: border-box; font-size: 0; text-align: right; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">DX</div></div></div></foreignObject><text x="232" y="212" fill="#FFFFFF" font-family="Helvetica" font-size="15px" text-anchor="end" font-weight="bold">DX</text></switch></g><rect x="8" y="968" width="1800" height="200" rx="30" ry="30" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-start; width: 448px; height: 1px; padding-top: 267px; margin-left: 4px;"><div style="box-sizing: border-box; font-size: 0; text-align: left; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">ESI</div></div></div></foreignObject><text x="4" y="272" fill="#FFFFFF" font-family="Helvetica" font-size="15px" font-weight="bold">ESI</text></switch></g><rect x="976" y="528" width="380" height="120" rx="18" ry="18" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-end; width: 93px; height: 1px; padding-top: 147px; margin-left: 244px;"><div style="box-sizing: border-box; font-size: 0; text-align: right; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">CH</div></div></div></foreignObject><text x="337" y="152" fill="#FFFFFF" font-family="Helvetica" font-size="15px" text-anchor="end" font-weight="bold">CH</text></switch></g><rect x="1396" y="288" width="380" height="120" rx="18" ry="18" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-end; width: 93px; height: 1px; padding-top: 87px; margin-left: 349px;"><div style="box-sizing: border-box; font-size: 0; text-align: right; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">BL</div></div></div></foreignObject><text x="442" y="92" fill="#FFFFFF" font-family="Helvetica" font-size="15px" text-anchor="end" font-weight="bold">BL</text></switch></g><rect x="1396" y="48" width="380" height="120" rx="18" ry="18" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-end; width: 93px; height: 1px; padding-top: 27px; margin-left: 349px;"><div style="box-sizing: border-box; font-size: 0; text-align: right; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">AL</div></div></div></foreignObject><text x="442" y="32" fill="#FFFFFF" font-family="Helvetica" font-size="15px" text-anchor="end" font-weight="bold">AL</text></switch></g><rect x="976" y="288" width="380" height="120" rx="18" ry="18" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-end; width: 93px; height: 1px; padding-top: 87px; margin-left: 244px;"><div style="box-sizing: border-box; font-size: 0; text-align: right; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">BH</div></div></div></foreignObject><text x="337" y="92" fill="#FFFFFF" font-family="Helvetica" font-size="15px" text-anchor="end" font-weight="bold">BH</text></switch></g><rect x="976" y="48" width="380" height="120" rx="18" ry="18" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-end; width: 93px; height: 1px; padding-top: 27px; margin-left: 244px;"><div style="box-sizing: border-box; font-size: 0; text-align: right; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">AH</div></div></div></foreignObject><text x="337" y="32" fill="#FFFFFF" font-family="Helvetica" font-size="15px" text-anchor="end" font-weight="bold">AH</text></switch></g><rect x="976" y="768" width="380" height="120" rx="18" ry="18" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-end; width: 93px; height: 1px; padding-top: 207px; margin-left: 244px;"><div style="box-sizing: border-box; font-size: 0; text-align: right; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">DH</div></div></div></foreignObject><text x="337" y="212" fill="#FFFFFF" font-family="Helvetica" font-size="15px" text-anchor="end" font-weight="bold">DH</text></switch></g><rect x="1396" y="528" width="380" height="120" rx="18" ry="18" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-end; width: 93px; height: 1px; padding-top: 147px; margin-left: 349px;"><div style="box-sizing: border-box; font-size: 0; text-align: right; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">CL</div></div></div></foreignObject><text x="442" y="152" fill="#FFFFFF" font-family="Helvetica" font-size="15px" text-anchor="end" font-weight="bold">CL</text></switch></g><rect x="1396" y="768" width="380" height="120" rx="18" ry="18" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-end; width: 93px; height: 1px; padding-top: 207px; margin-left: 349px;"><div style="box-sizing: border-box; font-size: 0; text-align: right; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">DL</div></div></div></foreignObject><text x="442" y="212" fill="#FFFFFF" font-family="Helvetica" font-size="15px" text-anchor="end" font-weight="bold">DL</text></switch></g><rect x="8" y="1208" width="1800" height="200" rx="30" ry="30" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-start; width: 448px; height: 1px; padding-top: 327px; margin-left: 4px;"><div style="box-sizing: border-box; font-size: 0; text-align: left; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">EDI</div></div></div></foreignObject><text x="4" y="332" fill="#FFFFFF" font-family="Helvetica" font-size="15px" font-weight="bold">EDI</text></switch></g><rect x="8" y="1448" width="1800" height="200" rx="30" ry="30" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-start; width: 448px; height: 1px; padding-top: 387px; margin-left: 4px;"><div style="box-sizing: border-box; font-size: 0; text-align: left; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; "><div>ESP (Stack Pointer) </div></div></div></div></foreignObject><text x="4" y="392" fill="#FFFFFF" font-family="Helvetica" font-size="15px" font-weight="bold">ESP (Stack Pointer) </text></switch></g><rect x="8" y="1688" width="1800" height="200" rx="30" ry="30" fill="none" stroke="#ffffff" stroke-width="16" pointer-events="all"/><g transform="translate(-0.5 -0.5)scale(4)"><switch><foreignObject style="overflow: visible; text-align: left;" pointer-events="none" width="100%" height="100%" requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"><div xmlns="http://www.w3.org/1999/xhtml" style="display: flex; align-items: unsafe center; justify-content: unsafe flex-start; width: 448px; height: 1px; padding-top: 447px; margin-left: 4px;"><div style="box-sizing: border-box; font-size: 0; text-align: left; "><div style="display: inline-block; font-size: 15px; font-family: Helvetica; color: #FFFFFF; line-height: 1.2; pointer-events: all; font-weight: bold; white-space: normal; word-wrap: normal; ">EBP (Base Pointer)</div></div></div></foreignObject><text x="4" y="452" fill="#FFFFFF" font-family="Helvetica" font-size="15px" font-weight="bold">EBP (Base Pointer)</text></switch></g></g><switch><g requiredFeatures="http://www.w3.org/TR/SVG11/feature#Extensibility"/><a transform="translate(0,-5)" xlink:href="https://www.diagrams.net/doc/faq/svg-export-text-problems" target="_blank"><text text-anchor="middle" font-size="10px" x="50%" y="100%">Viewer does not support full SVG 1.1</text></a></switch></svg>'

    #BackGround Draw
    stroke_color Color_black
    local_width =   50
    local_height =  50
    i = 0; while i < Page_size_x
        j = -local_height*2; while j < Page_size_y + Page_margin
            rotate(45,:origin => [i, j]) do
                stroke_rectangle([i, j + local_height], local_width, local_height)
            end
            j += Page_size_y/21
        end
        i += Page_size_x/50
    end

    move_up 30

    #SVG Call
    svg svg_020_001, position: :center, :width => 320

    #Custom Text
    text_size_01 = 16
    fill_color Color_white

    font("Heavy_Data") do
        column_box([0, cursor], :columns => 1, :width => bounds.width) do
            text "\nMagick is real.", :align => :center, :size => text_size_01
            text "\nKnow yourself.", :align => :center, :size => text_size_01
            text "\nThe best way to predict the future is to create it.", :align => :center, :size => text_size_01
            text "\nQuestion authority.", :align => :center, :size => text_size_01
            text "\nMagick is both an art and an experimental science.", :align => :center, :size => text_size_01
            text "\nBe watchful of what you do and say.", :align => :center, :size => text_size_01
            text "\nIntention controls Results.", :align => :center, :size => text_size_01
            text "\nDon’t invoke what you can’t banish.", :align => :center, :size => text_size_01
            text "\nAlways consider the options.", :align => :center, :size => text_size_01
            text "\nThe job isn’t done until you’ve put away the tools and cleaned up the mess.", :align => :center, :size => text_size_01
            text "\nKeep silent regarding a Magickal work for 24-hours, lest your analysis create doubt, thereby weakening the Intention that binds your spell.", :align => :center, :size => text_size_01
        end
    end

    start_new_page
end


# PDF Creation =======================================================
#=====================================================================

Prawn::Document.generate( name_file, :page_size => Page_size, :margin => Page_margin ) do
    #PDF Structure n Variables
        #PDF Font Families
        font_families.update("Heavy_Data" => {:normal => "suport/Heavy_Data.ttf"})

        font_families.update("Conspiracy" => {:normal => "suport/Conspiracy.ttf"})
        font_families.update("Conspiracy_PR" => {:normal => "suport/Conspiracy_PR.ttf",})
        font_families.update("Conspiracy_Bold" => {:normal   => "suport/Conspiracy_Bold.ttf",})

        #Pag Number
            page_number_size = Page_margin/2
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

    #Page001--------------

        page_number_002()



end

