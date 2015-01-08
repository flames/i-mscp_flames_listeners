# i-MSCP Listener::Named::Tuning listener file
# Copyright (C) 2015 Laurent Declercq <l.declercq@nuxwin.com>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA

#
## i-MSCP listener file which allows to remove default @ IN A IP DNS record ( when a custom DNS is set as replacement )
#

package Listener::Named::Tuning;

use iMSCP::EventManager;

# Remove default domain
sub removeDefaultDnsRecord
{
	my ($wrkFile, $data) = @_;

	if ($data->{'CUSTOM_DNS_RECORD'}) {
		for(keys %{$data->{'CUSTOM_DNS_RECORD'}}) {
			if(
				(
					$data->{'CUSTOM_DNS_RECORD'}->{$_}->{'domain_dns'} eq "$data->{'DOMAIN_NAME'}." ||
					$data->{'CUSTOM_DNS_RECORD'}->{$_}->{'domain_dns'} eq ''
				) &&
				$data->{'CUSTOM_DNS_RECORD'}->{$_}->{'domain_class'} eq 'IN' &&
				$data->{'CUSTOM_DNS_RECORD'}->{$_}->{'domain_type'} eq 'A' &&
				$data->{'CUSTOM_DNS_RECORD'}->{$_}->{'domain_text'} ne $data->{'DOMAIN_IP'}
			) {
				my $match = quotemeta("\@\t\tIN\tA\t$data->{'DOMAIN_IP'}\n");
				$$wrkFile =~ s/$match//;
			}
		}
	}

	0;
}

my $eventManager = iMSCP::EventManager->getInstance();
$eventManager->register('afterNamedAddDmnDb', \&removeDefaultDnsRecord);

1;
__END__
