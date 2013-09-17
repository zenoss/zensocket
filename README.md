zensocket
=========

Directions for building the zensocket rpm.

1) login to a fedora core 18 machine

2) ensure yum packages are installed --
  yum install @development-tools
  yum install fedora-packager

3) make rpm build environment
  mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

4) Create sources (replace $(version) with version in zensocket.spec file)
  tar czf ~/rpmbuild/SOURCES/zensocket-$(version).tar.gz

5) Create rpm (built tar exists in ~/rpmbuild/RPMS)
  rpmbuild -ba zensocket.spec
