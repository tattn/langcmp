require 'redcarpet'
require 'nokogiri'

namespace :doc do
  desc "Migration of documentations"
  task :migrate, ['path'] => :environment do |task, args|
    Document.destroy_all

    parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                     fenced_code_blocks: true)

    category_dirs =  Dir.glob(File.join(args[:path], '*/**/'))
    category_dirs.each do |category_dir|
      category = File.basename(category_dir)
      puts "Title = #{category}"
      Dir.glob(File.join(category_dir, "/*")).each do |lang_path|
        next if FileTest.directory?(lang_path) 

        lang = File.basename(lang_path, ".*")
        puts "Language = #{lang}"
        File.open(lang_path) do |file|
          html = parser.render(file.read)
          contents = html.split(/(<h1>)/)
          contents.shift
          contents.each do |content|
            next if content == "<h1>"
            p "<h1>"+content
            doc = Nokogiri::HTML.parse("<h1>"+content, nil, 'utf-8')
            title = doc.css('h1').text.strip
            code = doc.css('code').text.strip
            puts title
            puts code

            Document.create(
              category: category,
              title: title,
              source: code,
              language: lang
            )
          end
        end
      end
    end
  end
end
