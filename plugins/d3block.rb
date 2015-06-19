# Title: jsFiddle tag for Jekyll
# Author: Brian Arnold (@brianarn)
# Description:
#   Given a jsFiddle shortcode, outputs the jsFiddle iframe code.
#   Using 'default' will preserve defaults as specified by jsFiddle.
#
# Syntax: {% jsfiddle shorttag [tabs] [skin] [height] [width] %}
#
# Examples:
#
# Input: {% jsfiddle ccWP7 %}
# Output: <iframe style="width: 100%; height: 300px" src="http://jsfiddle.net/ccWP7/embedded/js,resources,html,css,result/light/"></iframe>
#
# Input: {% jsfiddle ccWP7 js,html,result %}
# Output: <iframe style="width: 100%; height: 300px" src="http://jsfiddle.net/ccWP7/embedded/js,html,result/light/"></iframe>
#

module Jekyll
  class D3Block < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      markup = markup.strip.split(",")
      @fiddle = markup.first

      @width = markup[1] || '100%'
      @height = markup[2] || '500px'
    end

    def render(context)
      if @fiddle
        "<iframe style=\"width: #{@width}; height: #{@height}\" src=\"http://bl.ocks.org/#{@fiddle}/\"></iframe>"
      else
        "Error processing input, expected syntax: {% jsfiddle shorttag [tabs] [skin] [height] [width] %}"
      end
    end
  end
end

Liquid::Template.register_tag('d3block', Jekyll::D3Block)
