#!/usr/bin/env ruby

require 'set'
require 'find'
require 'date'
require 'fileutils'


root = ARGV[0]



if !FileTest.directory?(root) 
	puts "#{root} is not directory"
else
	puts "starting in #{root} directory ..." 
	dir_to_remove = Set.new
	Find.find(root) do |path|
		if File.basename(path) == '.picasa.ini'
			FileUtils.rm(path)
			next 
		end

		if !FileTest.directory?(path)
			#puts path
			dir = File.dirname(path) 
			dir_tab = dir.split('/')
			#puts dir
			date = nil
			last = dir_tab.last
			begin
				date = Date.parse(last)
			rescue
				#puts "error: #{last}"
			end
			if date
				dir_tab[dir_tab.size - 1] = date.strftime("%Y-%m")
				new_dir = dir_tab.join('/')
				
				new_path = "#{new_dir}/#{File.basename(path)}"

				while File.exist?(new_path)
				 	i ||= 0
				 	i += 1					
					new_path = "#{new_dir}/#{i}-#{File.basename(path)}"
				end

				puts "#{path} => #{new_path}"
				FileUtils.mkdir(new_dir) if !File.exist?(new_dir)
				FileUtils.mv(path, new_path)
				dir_to_remove << dir
			end
		end


	end

	puts
	puts "deleting old directories ..." 
	dir_to_remove.each do |dir|
		puts dir
		FileUtils.rmdir(dir)
	end

end
    