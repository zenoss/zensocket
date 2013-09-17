Name:		zensocket
Version:	1.0.0
Release:	1%{?dist}
Summary:	zensocket provides the ability to open sockets with root priviledges

Group:		zenoss
License:	Commercial
URL:		http://www.zenoss.com/
Source:		%{name}-%{version}.tar.gz

%description
Zenoss needs to have root permissions to open some sockets, but we
don't want the zenoss scripts to be a giant security hole. 

Zensocket replaces the use of sudo in zenoss scripts.

Zensocket is run like this:

	  zensocket --listen=<port number> -- command to run

Where "$privilegedSocket" is substituted in the command strings with
the file descriptor number.

Alternatively, access to a ping socket is available like this:

	  zensocket --ping -- zenping $ARGS --fd=$privilegedSocket

%prep
%setup -q -n %{name}

%build
make %{?_smp_mflags}

%install
mkdir -p %{buildroot}%{_bindir}/
cp -p zensocket %{buildroot}%{_bindir}

%files
%attr(4755, root, root) %{_bindir}/zensocket

%changelog

