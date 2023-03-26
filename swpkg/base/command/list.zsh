__swpkg::command::list () {
  print "Loaded packages:"
  for package in $swpkgs; do
    print "  $package"
  done
}
