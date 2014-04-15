var path = require('path');

module.exports = function (grunt) {
    var HOME = process.env.HOME;
    var PKG  = grunt.file.readJSON('package.json');

    grunt.initConfig({
        clean: {
            bundles: [PKG.vim.bundles],
            symlinks: (function () {
                return PKG.symlinks.map(function (s) {
                    return path.join(HOME, s);
                });
            }())
        },

        gitclone: (function () {
            return PKG.vim.plugins.reduce(function (memo, plugin) {
                var dir = plugin.split('/').slice(-1)[0].replace(/\.git$/, '');
                memo[dir] = {
                    options: {
                        repository: plugin,
                        branch: 'master',
                        directory: path.join(PKG.vim.bundles, dir)
                    }
                };
                return memo;
            }, {});
        }()),

        symlink: {
            options: {
                overwrite: true
            },
            expand: {
                files: (function () {
                    return PKG.symlinks.map(function (s) {
                        return { src: s, dest: path.join(HOME, s) };
                    });
                }())
            }
        }

    });

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-symlink');
    grunt.loadNpmTasks('grunt-git');
    grunt.registerTask('default', ['clean', 'gitclone', 'symlink']);
};
