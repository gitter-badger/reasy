module.exports = function(dir) {
    dir = dir || 'modules' 
    // npm install [-g] fis3-hook-module
    return this.hook('module', {
        mode: 'commonJs'
    })
    .match('/' + dir + '/**/*.js', {
        isMod: true, // ���� comp �¶���һЩ�����������鶼��������ʽ define
    })
    .match('::package', {
        // npm install [-g] fis3-postpackager-loader
        // ���� __RESOURCE_MAP__ �ṹ���������Դ��������
        postpackager: fis.plugin('loader', {
            resourceType: 'commonJs',
            useInlineMap: true // ��Դӳ�����Ƕ
        })
    })
};