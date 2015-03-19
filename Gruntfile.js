var path = require('path');

module.exports = function (grunt) {
  var HOME     = process.env.HOME;
  var SYMLINKS = ['.bash_profile', '.gemrc', '.tmux.conf', '.vim', '.vimrc'];

  grunt.initConfig({
    clean: {
      vundle:   ['.vim/bundle'],
      symlinks: SYMLINKS.map(function(s) { return path.join(HOME, s); })
    },

    gitclone: {
      vundle: {
        options: {
          repository: 'https://github.com/gmarik/Vundle.vim.git',
          branch:     'master',
          directory:  '.vim/bundle/Vundle.vim'
        }
      }
    },

    symlink: {
      options: {
        overwrite: true
      },
      expanded: {
        files: [{
          expand: true,
          src: SYMLINKS,
          dest: HOME
        }]
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-symlink');
  grunt.loadNpmTasks('grunt-git');
  grunt.registerTask('default', ['clean:symlinks', 'clean:vundle', 'gitclone:vundle', 'symlink']);
};
