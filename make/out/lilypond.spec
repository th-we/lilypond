%define info yes

Name: lilypond
Version: 1.3.147
Release: 1
License: GPL
Group: Applications/Publishing
Source0: ftp.cs.uu.nl:/pub/GNU/LilyPond/development/lilypond-1.3.147.tar.gz
# music notation software for.. ?
Summary: A program for printing sheet music.
URL: http://www.cs.uu.nl/~hanwen/lilypond
# rpm: 4.0: broken for -ta builds: rpm doesn't look in tarball for xpm
# Icon: lilypond-icon.xpm
BuildRoot: /tmp/lilypond-install
Prereq: tetex

# use keywords: music notation software
%description
LilyPond is a music typesetter.  It produces beautiful
sheet music using a high level description file as input.  LilyPond is
part of the GNU Project.

%package documentation
Summary: Prebuilt website containing all LilyPond documentation.
Group: Applications/Publishing
# BuildArchitectures: noarch

%description documentation

The documentation of LilyPond, both in HTML and PostScript.

%prep
%setup

%build

#

# DO NOT use % { configure } , it hardcodes all paths, runs libtool,
# so we can't do make prefix=/tmp/ install.

# In fact, do not take out the spaces between % and { , because RPM will gladly
# do a substitution anyway.

./configure --disable-checking --disable-debugging --enable-printing --prefix=%{_prefix} --disable-optimise --enable-shared

make all

# urg
# %build documentation
# line 42: second %build
# ok, now make sure that lilypond package will succeed,
# even if documentation fails to build

make -C Documentation  || true
make web || true

%install



rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/tmp/lilypond-rpm-doc

strip lily/out/lilypond midi2ly/out/midi2ly
make prefix="$RPM_BUILD_ROOT%{_prefix}" install
%if info=="yes"
gzip -9fn $RPM_BUILD_ROOT%{_prefix}/info/* || true
%endif



gzip -9fn $RPM_BUILD_ROOT%{_prefix}/man/man1/* || true




mkdir -p $RPM_BUILD_ROOT%{_prefix}/../etc/profile.d
cp buildscripts/out/lilypond-profile $RPM_BUILD_ROOT%{_prefix}/../etc/profile.d/lilypond.sh
cp buildscripts/out/lilypond-login $RPM_BUILD_ROOT%{_prefix}/../etc/profile.d/lilypond.csh

# urg
#%install documentation
#line 63: second %install
# again, make sure that main package installs even if doco fails
mkdir -p web/out
tar -C web -xzf out/web.tar.gz || true

%ifos cygwin
# urg, this symlink doesn't come through on cygwin
# this is the way symlinks work over there, let's fake one
rm -f $RPM_BUILD_ROOT%{_prefix}/share/lilypond/cmtfm
echo '!<symlink>c:\\texmf\\fonts\\tfm\\public\\cm' > $RPM_BUILD_ROOT%{_prefix}/share/lilypond/cmtfm
%{fix_suffixes}
%endif

%post

touch /tmp/.lilypond-install
rm `find /var/lib/texmf -name 'feta*pk -print' -or -name 'feta*tfm -print'` /tmp/.lilypond-install
%if info=="yes"
/sbin/install-info %{_prefix}/info/lilypond.info.gz %{_prefix}/info/dir || true
%endif

%preun
%if info=="yes"
if [ $1 = 0 ]; then
    /sbin/install-info --delete %{_prefix}/info/lilypond.info.gz %{_prefix}/info/dir || true
fi
%endif


%files
# hairy to hook it in (possibly non-existing) emacs
%doc lilypond-mode.el
%doc lilypond-font-lock.el

%ifnos cygwin
%{_prefix}/bin/abc2ly
%{_prefix}/bin/as2text
%{_prefix}/bin/convert-ly
%{_prefix}/bin/etf2ly
%{_prefix}/bin/lilypond
%{_prefix}/bin/ly2dvi
%{_prefix}/bin/midi2ly
%{_prefix}/bin/lilypond-book
%{_prefix}/bin/mup2ly
%{_prefix}/bin/musedata2ly
%{_prefix}/bin/pmx2ly
%else
%{_prefix}/bin
%endif

%if info=="yes"
%{_prefix}/info/lilypond.info.gz
%{_prefix}/info/lilypond-internals.info.gz
%endif

%{_prefix}/man/man1/abc2ly.1.gz
%{_prefix}/man/man1/as2text.1.gz
%{_prefix}/man/man1/convert-ly.1.gz
%{_prefix}/man/man1/etf2ly.1.gz
%{_prefix}/man/man1/lilypond.1.gz
%{_prefix}/man/man1/ly2dvi.1.gz
%{_prefix}/man/man1/midi2ly.1.gz
%{_prefix}/man/man1/lilypond-book.1.gz
%{_prefix}/man/man1/musedata2ly.1.gz
%{_prefix}/man/man1/mup2ly.1.gz
%{_prefix}/man/man1/pmx2ly.1.gz

%{_prefix}/share/lilypond/
%{_prefix}/share/locale/*/LC_MESSAGES/lilypond.mo
# urg?
%{_prefix}/../etc/profile.d/lilypond.*

%files documentation
# this gets too messy...
# %doc input/*.ly
# verbatim include of input: list the directory without issuing a %dir 
%doc web/
