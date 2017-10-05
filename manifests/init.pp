# Class: zyppercheckupdates
# ===========================
#
# Full description of class zyppercheckupdates here.
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
#    class { 'zyppercheckupdates':
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
class zyppercheckupdates {
    exec {
        "zypper-updates":
            path => '/sbin:/usr/sbin:/usr/local/sbin:/root/bin:/usr/local/bin:/usr/bin:/bin:/usr/games',
            command => "if [ $(zypper -qn lu | grep $(arch) | cut -d "|" -f 3 | sed 's/ //g' | wc -l) -eq 0 ]; then printf no > /tmp/zypperupdates; printf none > /tmp/zypperupdateslist; else printf yes > /tmp/zypperupdates; zypper -qn lu | grep $(arch) | cut -d "|" -f 3 | sed 's/ //g' | tr '\\n' ' ' > /tmp/zypperupdateslist; fi; exit 0",
            timeout => 30,
            notify => undef,
    }

    exec {
        "zypper-patches":
            path => '/sbin:/usr/sbin:/usr/local/sbin:/root/bin:/usr/local/bin:/usr/bin:/bin:/usr/games',
            command => "if [ $(zypper -qn lp | grep -v security | grep -v '+--'| grep '|' | grep -v 'tatus' | cut -d '|' -f 2 | sed 's/ //g' | wc -l) -eq 0 ]; then printf no > /tmp/zypperpatches; printf none > /tmp/zypperpatcheslist; else printf yes > /tmp/zypperpatches; zypper -qn lp | grep -v security | grep -v '+--'| grep -v 'tatus' | grep '|' | cut -d '|' -f 2 | sed 's/ //g' | tr '\\n' ' ' > /tmp/zypperpatcheslist; fi; exit 0",
            timeout => 30,
            notify => undef,
    }

    exec {
        "zypper-patches-security":
            path => '/sbin:/usr/sbin:/usr/local/sbin:/root/bin:/usr/local/bin:/usr/bin:/bin:/usr/games',
            command => "if [ $(zypper -qn lp | grep security | grep -v '+--'| grep '|' | grep -v 'tatus' | cut -d '|' -f 2 | sed 's/ //g' | wc -l) -eq 0 ]; then printf no > /tmp/zypperpatchessecurity; printf none > /tmp/zypperpatchessecuritylist; else printf yes > /tmp/zypperpatchessecurity; zypper -qn lp | grep security | grep -v '+--'| grep -v 'tatus' | grep '|' | cut -d '|' -f 2 | sed 's/ //g' | tr '\\n' ' ' > /tmp/zypperpatchessecuritylist; fi; exit 0",
            timeout => 30,
            notify => undef,
    }
}
