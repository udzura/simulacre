MRUBY_CONFIG=File.expand_path(ENV["MRUBY_CONFIG"] || "build_config.rb")
MRUBY_VERSION=ENV["MRUBY_VERSION"] || "master"
MRUBY_ROOT=File.expand_path('../mruby', __FILE__)

file :mruby do
  sh "git clone --depth=1 git://github.com/mruby/mruby.git"
end

desc "compile binary"
task :mruby_a => :mruby do
  sh "cd mruby && rake #{MRUBY_ROOT}/build/host/lib/libmruby.a MRUBY_CONFIG='#{MRUBY_CONFIG}'"
end

rbfiles = Dir.glob('mrblib/**/*.rb')
file 'src/mrb_clock_gettime.c' => (rbfiles + ['src/mrb_clock_gettime.tmpl', :mruby_a]) do
  sh "echo '#define _GNU_SOURCE' > src/mrb_clock_gettime.c"
  sh "mruby/build/host/bin/mrbc -Blibs -o- #{rbfiles.join(' ')} >> src/mrb_clock_gettime.c"
  sh "cat src/mrb_clock_gettime.tmpl >> src/mrb_clock_gettime.c"
end

file 'src/mrb_clock_gettime.o' => 'src/mrb_clock_gettime.c' do
  sh "gcc -g -c -fPIC -I./mruby/include src/mrb_clock_gettime.c -o src/mrb_clock_gettime.o"
end

file 'dest/libjack.so' => ['src/mrb_clock_gettime.o', :mruby_a] do
  sh "gcc -g -shared -o dest/libjack.so src/mrb_clock_gettime.o mruby/build/host/lib/libmruby.a"
end

desc "cleanup"
task :clean do
  sh "cd mruby && rake deep_clean"
end

task default: 'dest/libjack.so'
