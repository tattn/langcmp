require 'coderay'
module ApplicationHelper
  def syntax_hilight code, lang
    case lang
    when 'ruby'
      lang = :ruby
    end
    CodeRay.scan(code, lang).div(:line_numbers => :table).html_safe
		# CodeRay.scan(code, lang).div.html_safe
  end

	def i18n_url_for(options)
		if options[:locale] == I18n.default_locale
			options[:locale] = nil
		end
		url_for(options)
	end
end
