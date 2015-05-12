var path = require('path');

module.exports = function (grunt) {
  var HOME     = process.env.HOME || process.env.USERPROFILE;
  var DOTFILES = ['.bash_profile', '.gemrc', '.tmux.conf', '.vim', '.vimrc'];

  grunt.initConfig({
    // Remove DOTFILES from HOME
    clean: DOTFILES.map(function(s) { return path.join(HOME, s); }),

    // Symlink DOTFILES to HOME
    symlink: {
      options: {
        overwrite: true
      },
      expanded: {
        files: [{
          expand: true,
          src: DOTFILES,
          dest: HOME
        }]
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-symlink');
  grunt.registerTask('default', ['clean', 'symlink']);
};
