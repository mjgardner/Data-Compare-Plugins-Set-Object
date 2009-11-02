use inc::Module::Install;

name       'Data-Compare-Plugins-Set-Object';
author     q{Mark Gardner <mjgardner@cpan.org>};
#version    '1.0';
license    'perl';
homepage   'http://wiki.github.com/mjg/Data-Compare-Plugins-Set-Object';
repository 'http://github.com/mjg/Data-Compare-Plugins-Set-Object';
bugtracker 'http://github.com/mjg/Data-Compare-Plugins-Set-Object/issues';
all_from   'lib/Data/Compare/Plugins/Set/Object.pm';

build_requires 'Test::More';
configure_requires 'version' => '0.77';

author_tests('xt');

requires 'Data::Compare' => '0.06';
requires 'Set::Object'   => 0;
requires 'List::Util'    => 0;
requires 'English'       => 0;

#auto_install;

WriteAll;

