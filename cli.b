import os
import iters
import io
import reflect
import .app

def run_test_files(files) {
  for f in files {
    f = os.join_paths('tests', f)
    app.set_file(f)
    reflect.run_script(f)
  }
  app.show_tests_results()
}

def run() {
  if os.dir_exists('tests/') {
    var files = iters.filter(os.read_dir('tests/'), | x | { 
      return x != '.' and x != '..' and x.ends_with('.b') 
    })
    if files {
      run_test_files(files)
    } else {
      io.stderr.write('No test files found.\n')
    }
  } else {
    io.stderr.write('"tests" directory not found.\n')
  }
}

run()
