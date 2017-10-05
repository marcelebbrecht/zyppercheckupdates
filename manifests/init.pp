# Class: zypper
# ===========================
#
# Full description of class zypper here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'zypper':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class zypper (
	Hash $sources                 = $zypper::sources,
	Optional[Boolean] $purge      = $zapper::purge
)
{
	$keep = inline_template('<%= 
		def find_tag_val(hash, tag)
			returnarray = []
			hash.map do |k, v|
				return v if k.to_sym == tag
				vr = find_tag_val(v, tag) if v.kind_of?(Hash)
				returnarray.push(vr + ".repo") if vr
			end
			return returnarray
		end 
		find_tag_val(@sources, :file)
	%>')

	file { 'repos.d':
		ensure  => directory,
		path    => '/etc/zypp/repos.d',
		owner   => root,
		group   => root,
		mode    => '0755',
		purge   => $purge,
		recurse => $purge,
		ignore  => $keep,
	}

	if $sources {
		create_resources('zypper::source', $sources)
	}
}
