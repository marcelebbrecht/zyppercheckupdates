Facter.add(:updates_available_list) do
    setcode do
	    Facter::Core::Execution.exec('cat /tmp/zypperupdateslist')
    end
end

Facter.add(:updates_available) do
    setcode do
	    Facter::Core::Execution.exec('cat /tmp/zypperupdates')
    end
end

Facter.add(:patches_available_list) do
    setcode do
	    Facter::Core::Execution.exec('cat /tmp/zypperpatcheslist')
    end
end

Facter.add(:patches_available) do
    setcode do
	    Facter::Core::Execution.exec('cat /tmp/zypperpatches')
    end
end

Facter.add(:patches_available_security_list) do
    setcode do
	    Facter::Core::Execution.exec('cat /tmp/zypperpatcheslistsecurity')
    end
end

Facter.add(:patches_available_security) do
    setcode do
	    Facter::Core::Execution.exec('cat /tmp/zypperpatchessecurity')
    end
end

