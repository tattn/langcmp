require 'coderay'
module ApplicationHelper
  def syntax_hilight code, lang
    case lang
    when 'ruby'
      lang = :ruby
    end
    CodeRay.scan(code, lang).div(:line_numbers => :table).html_safe
  end
end
