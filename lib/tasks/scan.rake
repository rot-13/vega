require 'rake'
require 'net/http'
require 'json'
require 'adapters/omdb_adapter'



namespace :vega do

  $exts = ['avi', 'mkv', 'mp4']

  def scan_dir(dir)
    adapter = OMDBAdapter.new

    puts "Scanning #{dir.path}...."
    paths_to_inspect = ($exts.map { |e| Dir.glob(File.join(dir.path, "*." + e)) }).flatten()

    paths_to_inspect.each do |p|
      filename = File.basename(p)
      # Look for 'SddEdd'
      if mo = /(?<Name>.*)S(?<S>\d\d)E(?<E>\d\d)/.match(filename)
        data = {
          show_name: mo['Name'].gsub('.',' ').strip(),
          season:    mo['S'].to_i,
          episode:   mo['E'].to_i
        }

        adapter.handle_data(data)
      end
    end
  end

  task :scan_dirs => :environment do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    Directory.find_each do |dir|
      scan_dir(dir)
    end
  end


end