# imscp_flames_listeners

Set of listener files  for @flames

## Listener files

Below, you can find a list of all listener files which are available in that repository, and their respective purpose.

To install a listener file, you must upload it in your **/etc/imscp/listeners.d** directory, and edit the configuration
parameters inside it. Once done, you must rerun the i-MSCP installer.

### Listener::Named::Tuning

The **listeners.d/10_named_tuning.pl** listener file allows to remove default @ IN A IP DNS record ( when a custom DNS
is set as replacement )

### License

	Copyright (c) 2015 Laurent Declercq <l.declercq@nuxwin.com>
	
	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Lesser General Public
	License as published by the Free Software Foundation; either
	version 2.1 of the License, or (at your option) any later version.
	
	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Lesser General Public License for more details.
	
	You should have received a copy of the GNU Lesser General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

 see [lgpl v2.1](http://www.gnu.org/licenses/lgpl-2.1.txt "lgpl v2.1")

## Author

- Laurent Declercq <l.declercq@nuxwin.com>
