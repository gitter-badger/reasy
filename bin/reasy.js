#!/usr/bin/env node

var Liftoff = require('liftoff');
var argv = require('minimist')(process.argv.slice(2));
var path = require('path');
var cli = new Liftoff({
    name: 'reasy', // 命令名字
    processTitle: 'reasy',
    moduleName: 'reasy',
    configName: 'reasy-conf',

    // only js supported!
    extensions: {
        '.js': null
    }
});

cli.launch({
    cwd: argv.r || argv.root,
    configPath: argv.f || argv.file
}, function(env) {
    var fis;

    global.cwd = env.cwd.replace(/\\/g, '/');

    if (!env.modulePath) {
        fis = require('../');
    } else {
        fis = require(env.modulePath);
    }
    require('../libs/handleCli').init(argv);
    fis.set('system.localNPMFolder', path.join(env.cwd, 'node_modules/reasy'));
    fis.set('system.globalNPMFolder', path.dirname(__dirname));
    fis.cli.run(argv, env);
});
