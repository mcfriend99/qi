import os
import iters
import io
import .app

def run_test_files(files) {
  for f in files {
    f = os.join_paths('tests', f)
    app.run(f)
  }
  return app.show_tests_results()
}

def run() {
  if os.dir_exists('tests/') {
    var files = iters.filter(os.read_dir('tests/'), | x | { 
      return x != '.' and x != '..' and x.ends_with('.b') 
    })
    if files {
      if !run_test_files(files) {
        os.exit(1)
      }
    } else {
      io.stderr.write('No test files found.\n')
    }
  } else {
    io.stderr.write('"tests" directory not found.\n')
  }
}

run()
