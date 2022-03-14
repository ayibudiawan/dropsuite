class Scan
  def self.folder_contents(path)
    if path.present?
      dir_path = path.last.eql?("/") ? path : "#{path}/"
      list_files = Dir["#{dir_path}*"]
      contents = []
      list_files.each do |file_path|
        begin
          content = File.read(file_path)
        rescue Exception => e
          content = nil
          puts e.message
        end
        contents.push(content) unless content.nil?
      end
      contents = contents.inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }
      contents.present? ? contents.sort_by { |key, value| value }.last.join(" ") : nil
    else
      puts "Args #{path} is required"
      nil
    end
  end
end
