# source.pp
# add an zypper source
define zypper::source (
	String $file = undef,
	Integer $enabled = undef,
	Integer $autorefresh = undef,
	String $baseurl = undef,
	String $path = undef,
	String $type = undef,
	Integer $keeppackages = undef
) {

  $header = epp('zypper/_header.epp')

  $sourcelist = epp('zypper/source.list.epp', {
    'unit'            => $file,
    'name'            => $name,
    'enabled'         => $enabled,
    'autorefresh'     => $autorefresh,
    'baseurl'         => $baseurl,
    'path'            => $path,
    'type'            => $type,
    'keeppackages'    => $keeppackages,
  })

  file { "/etc/zypp/repos.d/$file.repo":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $sourcelist,
  }


}
