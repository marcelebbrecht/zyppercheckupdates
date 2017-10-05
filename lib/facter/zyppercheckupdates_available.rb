Facter.add("zypper_updates_available_list") do
	setcode do
		if File.exist? '/tmp/zypperupdateslist'
			Facter::Core::Execution.exec('cat /tmp/zypperupdateslist')
		end
	end
end

Facter.add("zypper_updates_available") do
	setcode do
		if File.exist? '/tmp/zypperupdates'
			Facter::Core::Execution.exec('cat /tmp/zypperupdates')
		end
	end
end

Facter.add("zypper_patches_available_list") do
	setcode do
		if File.exist? '/tmp/zypperpatcheslist'
			Facter::Core::Execution.exec('cat /tmp/zypperpatcheslist')
		end
	end
end

Facter.add("zypper_patches_available") do
	setcode do
		if File.exist? '/tmp/zypperpatches'
			Facter::Core::Execution.exec('cat /tmp/zypperpatches')
		end
	end
end

Facter.add("zypper_patches_available_security_list") do
	setcode do
		if File.exist? '/tmp/zypperpatchessecuritylist'
			Facter::Core::Execution.exec('cat /tmp/zypperpatchessecuritylist')
		end
	end
end

Facter.add("zypper_patches_available_security") do
	setcode do
		if File.exist? '/tmp/zypperpatchessecurity'
			Facter::Core::Execution.exec('cat /tmp/zypperpatchessecurity')
		end
	end
end

