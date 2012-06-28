#!/usr/bin/env rake

namespace :vim do
  desc "Download third-party vim plugins"
  task :bundle do
    git_bundles = [ 
      "http://github.com/ervandew/supertab.git",
      "http://github.com/jpo/vim-railscasts-theme.git",
      "http://github.com/scrooloose/nerdcommenter.git",
      "http://github.com/scrooloose/nerdtree.git",
      "http://github.com/tpope/vim-rails.git",
      "http://github.com/vim-ruby/vim-ruby.git",
      "http://github.com/vim-scripts/bufexplorer.zip",
      "http://github.com/vim-scripts/L9",
      "http://github.com/vim-scripts/FuzzyFinder",
    ]

    vim_org_scripts = [
      ["SearchComplete", "474",  "plugin"],
    ]

    require 'fileutils'
    require 'open-uri'

    bundles_dir = File.join(File.dirname(__FILE__), "vim", "bundle")

    Dir.mkdir(bundles_dir) unless Dir.exists?(bundles_dir)
    FileUtils.cd(bundles_dir)

    puts "Trashing everything (lookout!)"
    Dir["*"].each {|d| FileUtils.rm_rf d }

    git_bundles.each do |url|
      dir = url.split('/').last.sub(/\.git$/, '')
      puts "  Unpacking #{url} into #{dir}"
      `git clone #{url} #{dir}`
      FileUtils.rm_rf(File.join(dir, ".git"))
    end

    vim_org_scripts.each do |name, script_id, script_type|
      puts "  Downloading #{name}"
      local_file = File.join(name, script_type, "#{name}.vim")
      FileUtils.mkdir_p(File.dirname(local_file))
      File.open(local_file, "w") do |file|
        file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
      end
    end
  end
end
